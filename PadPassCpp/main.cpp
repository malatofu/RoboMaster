#include <iostream>
#include <map>
#include <string>
#include <fstream>
#include <streambuf>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>
#include <time.h>
#include "keras_model.h"
#include "protocol.h"
#include "Structure.h"
#include <numeric>
#include "json.hpp"

using namespace std;
using namespace cv;
using namespace keras;
using json = nlohmann::json;
//#define runtime_calculate
#define test
#ifdef test
#define config_path "/Users/wzq/RoboMaster/PadPassCpp/config.json"
int count_test=0;
#else
#define config_path "/home/ubuntu/RoboMaster/PadPassCpp/config.json"
#endif
//#define timeline
#ifdef timeline
static int timeline_flag=0;//0的时候为白屏,1的时候为有数据
static int timeline_buffer_jump=0;
#endif
static int count_digit=0;
const int camera_width=500;
const int camera_height=480;
json config_json;
int config_threshhold_led_light;
int config_threshhold_handwrite_1_width;
int config_threshhold_white_rectangle_area_min;
int config_threshhold_white_rectangle_area_max;
KerasModel *model_handwrite_digit;
KerasModel *model_led_digit;

uint8_t result_digit_handwrite[9];
uint8_t result_digit_led[5];
struct Digit{
    vector<float> predictions;
    int index;
    int result;
};
Digit image_predict(Mat img,KerasModel *model){//通过卷积神经网络识别

    vector<vector<vector<float>>> data;
    vector<vector<float>> d;
    for (int i = 0; i < img.rows; i++) {
        vector<float> r;
        for (int j = 0; j < img.cols; j++) {
            r.push_back(img.at<uchar>(i, j)/255.0);
        }
        d.push_back(r);
    }
    data.push_back(d);

    DataChunk * dc = new DataChunk2D();
    dc->set_data(data); //Mat 转 DataChunk
    Digit res;

    res.predictions = model->compute_output(dc);

    auto max = max_element(res.predictions.begin(), res.predictions.end());
    res.result = (int)distance(res.predictions.begin(), max);

    delete dc;
    //imshow(to_string(count_digit)+"-"+to_string(index),img);
//    waitKey(0);

    return res;
}
Mat image_resize_digit_other(Mat rawimg){
    int width=28;
    cv::Size size;
    size.width = width;
    size.height = width;
    cv::resize(rawimg, rawimg, size,INTER_CUBIC);
    return rawimg;

}
Mat image_resize_digit_1(Mat rawimg){
    int width=28;
    cv::Mat outimg(width, width, CV_8U, 255);

    outimg = cv::Scalar(0,0,0);
    float fc = (float)28 / rawimg.cols;
    float fr = (float)28 / rawimg.rows;
    fc = min(fc, fr);
    fr = fc;
    cv::Size size;
    size.width = rawimg.cols * fc;
    size.height = rawimg.rows * fr;
    if(size.width == 0 || size.height == 0)return outimg;
    cv::resize(rawimg, rawimg, size,INTER_CUBIC);

    int w = rawimg.cols, h = rawimg.rows;
    int x = (width - w)/2, y = (width - h)/2;
    rawimg.copyTo(outimg(cv::Rect(x, y, w, h)));

    return outimg;
}
Mat image_resize(Mat rawimg){
    if(rawimg.size().width<=config_threshhold_handwrite_1_width)//参数:数字1的宽度参数,现场拍照整定
        return image_resize_digit_1(rawimg);//防止数字1拉伸占满全屏
    return image_resize_digit_other(rawimg);//全部拉伸

}
Mat resize_resize(Mat rawimage){
    float fx=480.0 /(float) rawimage.size().width;
    float fy=640.0 /(float) rawimage.size().height;
    fx=fy=min(fx,fy);
    Mat result;
    resize(rawimage,result,Size(),fx,fy,INTER_CUBIC);
    return result;
}
bool sort_cmp_x_greater(const Rect &rect1, const Rect &rect2){
    if (rect1.x<rect2.x)return true;
    return false;
}
bool sort_cmp_y_greater(const Rect &rect1, const Rect &rect2){
    if (rect1.y<rect2.y)return true;
    return false;
}
void slice_first_line(Mat frame,vector<Rect> pos_rect_left,vector<Rect> pos_rect_right,vector<Mat> &image_digit){
    int arg_line=0;
    float x=pos_rect_left[arg_line].x+pos_rect_left[arg_line].width;
    float y=(pos_rect_left[arg_line].y+pos_rect_right[arg_line].y)/2-5;
    float length=0;
    float height=0;
    for (int i = 0; i < 2; ++i) {
        length+=(pos_rect_right[i].x-pos_rect_left[i].x-pos_rect_left[i].width);
    }
    length=(length)/2;
    length = (length) /3;

    height+=pos_rect_left[1].y-y+0.77*pos_rect_left[1].height;
    height+=pos_rect_right[1].y-y+0.77*pos_rect_right[1].height;
    height=height/2;

    Mat frame_copy=frame.clone();
    int x1=(int)x,y1=(int)y,height1=(int)height,length1=(int)length;

    for (int i = 0; i < 3; ++i) {
        Rect rect=Rect(x1+ length1*i,y1,length1,height1);
        Mat mat(frame_copy,rect);
        image_digit.push_back(mat);
    }

}
void slice_second_line(Mat frame,vector<Rect> pos_rect_left,vector<Rect> pos_rect_right,vector<Mat> &image_digit){
    int arg_line=1;
    float x=pos_rect_left[arg_line].x+pos_rect_left[arg_line].width;
    float y=(pos_rect_left[arg_line].y+pos_rect_right[arg_line].y+0.75*pos_rect_left[arg_line].height+0.75*pos_rect_right[arg_line].height)/2;
    float length=0;
    float height=0;
    for (int i = 1; i < 3; ++i) {
        length+=(pos_rect_right[i].x-pos_rect_left[i].x-pos_rect_left[i].width);
    }
    length=(length)/2;
    length = (length) /3;

    height+=pos_rect_left[3].y-y+0.29*pos_rect_left[3].height;
    height+=pos_rect_right[3].y-y+0.29*pos_rect_right[3].height;
    height=height/2;

    Mat frame_copy=frame.clone();
    int x1=(int)x,y1=(int)y,height1=(int)height,length1=(int)length;

    for (int i = 0; i < 3; ++i) {
        Rect rect=Rect(x1+ length1*i,y1,length1,height1);
        Mat mat(frame_copy,rect);
        image_digit.push_back(mat);
    }

}
void slice_third_line(Mat frame,vector<Rect> pos_rect_left,vector<Rect> pos_rect_right,vector<Mat> &image_digit){
    int arg_line=3;
    float x=pos_rect_left[arg_line].x+pos_rect_left[arg_line].width;
    float y=(pos_rect_left[arg_line].y+pos_rect_right[arg_line].y+0.25*pos_rect_left[arg_line].height+0.25*pos_rect_right[arg_line].height)/2;
    float length=0;
    float height=0;
    for (int i = 3; i < 5; ++i) {
        length+=(pos_rect_right[i].x-pos_rect_left[i].x-pos_rect_left[i].width);
    }
    length=(length)/2;
    length = (length) /3;

    height+=pos_rect_left[4].y-y+1.5*pos_rect_left[4].height;
    height+=pos_rect_right[4].y-y+1.5*pos_rect_right[4].height;
    height=height/2;

    Mat frame_copy=frame.clone();
    int x1=(int)x,y1=(int)y,height1=(int)height,length1=(int)length;

    for (int i = 0; i < 3; ++i) {
        Rect rect=Rect(x1+ length1*i,y1,length1,height1);
        Mat mat(frame_copy,rect);
        image_digit.push_back(mat);
        //imshow(to_string(i),mat);
    }

}
int slice_led(Mat frame,vector<Rect> pos_rect_left,vector<Rect> pos_rect_right,Mat &result){
    int arg_line=0;
    float x=pos_rect_left[arg_line].x+pos_rect_left[arg_line].width;
    float y=(pos_rect_left[arg_line].y+pos_rect_right[arg_line].y)/2;
    float length=0;
    float height=(pos_rect_left[arg_line].height+pos_rect_right[arg_line].height)/2;
    for (int i = 0; i < 2; ++i) {
        length+=(pos_rect_right[i].x-pos_rect_left[i].x-pos_rect_left[i].width);
    }
    length=(length)/2;


    float led_x=(270/950.0)*length+x;
    float led_width=(415/950.0)*length;

    float led_height = (155 / 57.0) * height;
    float led_y = y - led_height*1.2;

    Mat frame_copy=frame.clone();
    int led_x1=(int)led_x,led_y1=(int)led_y,led_height1=(int)led_height,led_width1=(int)led_width;
    if(led_x1<0||led_y1<0||led_height1<0||led_width1<0||(led_x1+led_width1>frame.size().width)||(led_y1+led_height1>frame.size().height))
        return -1;
    Rect rect_led_screen(led_x1,led_y1,led_width1,led_height1);
    Mat led_screen_frame(frame_copy,rect_led_screen);

//
//    Mat led_screen_hsv,led_screen_mask,led_screen_grayscale;
//    cvtColor(led_screen_frame,led_screen_hsv,COLOR_BGR2HSV);
//
//
//    cvtColor(led_screen_frame,led_screen_grayscale,COLOR_BGR2GRAY);
//
//
//    Scalar lower_red=Scalar(0, 0, config_threshhold_led_light);//参数:LED灯亮度参数
//
//    Scalar upper_red=Scalar(255, 255, 255);
//    inRange(led_screen_frame,lower_red,upper_red,led_screen_mask);//红色LED掩码


//    dilate(led_screen_mask, led_screen_mask, Mat(), Point(-1, -1), 2, 1, 1);
//    dilate(mask1, mask1, Mat(), Point(-1, -1), 2, 1, 1);

//    imshow( "led_screen_grayscale", led_screen_grayscale );
//    imshow( "led_screen_grayscale", led_screen_grayscale );

//
//    waitKey(0);
    result=led_screen_frame;
    return 0;
    //return result;

//
//    imshow("test",led_screen_mask);
//    waitKey(0);



}
void extract_digit_from_slice(vector<Mat> &image_digit,vector<Mat> &image_digit_final){
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;
    for (int i = 0; i < 9; ++i) {
        Mat edge;
        Canny(image_digit[i],edge, 500, 2000,5);
        findContours(edge.clone(), contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
        Mat copy = image_digit[i].clone();
        Mat im_gray;

        cvtColor(copy,im_gray,COLOR_BGR2GRAY);
        Mat im_th;

        adaptiveThreshold(im_gray,im_th,255,ADAPTIVE_THRESH_GAUSSIAN_C,THRESH_BINARY_INV,25,25);
//        threshold(im_gray,im_th,105,255,THRESH_BINARY_INV);

        map<int,Mat> temp_dict;
        int max_index=-1;
        for (int j = 0; j < contours.size(); ++j) {
            Rect rect=boundingRect(contours[j]);
            int area=rect.width*rect.height;
            if(rect.width<=5||rect.height<=5||copy.size().width-rect.width<3)continue;
            rect.y+=3;
            rect.x+=2;
            rect.height-=5;
            rect.width-=5;
            try {
                Mat img_temp(im_th,rect);
                temp_dict[area]=img_temp;
                max_index=max(max_index,area);

            }catch (cv::Exception &e){
                continue;
            }


        }
        if(max_index==-1){
            cout<<"cannot find max image"<<endl;
            continue;
        }
        Mat image_max=temp_dict[max_index];
        image_digit_final.push_back(image_max);
//        imshow(to_string(i),image_max);

    }
//    waitKey(0);
}
void extract_minimum_digit(vector<Mat> &image_digit_with_border,vector<Mat> &image_digit_final){
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;

    for (int i = 0; i < 9; ++i) {
        map<int,Mat> temp_dict;
        int max_index=-1;

        int x1=28,y1=28,x2=0,y2=0;

        findContours( image_digit_with_border[i].clone(), contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
        for (int j = 0; j < contours.size(); ++j) {
            Rect rect=boundingRect(contours[j]);
//            int area=rect.height*rect.width;
            if(rect.width<3||rect.height<3)continue;//original is 3 x x
            x1=min(x1,rect.x);
            y1=min(y1,rect.y);

            x2=max(x2,rect.x+rect.width);
            y2=max(y2,rect.y+rect.height);



//            max_index=max(max_index,area);
//            if (rect.y-2>0)rect.y-=1;
//
//            rect.y-=1;
//            rect.x-=1;
//            rect.height+=2;
//            rect.width+=2;
//            Mat img_temp(image_digit_with_border[i],rect);
//            temp_dict[area]=img_temp;
        }
        if(x2==0||y2==0){
            image_digit_final.push_back(image_digit_with_border[i]);
            continue;
        }

        Rect rect(x1-1,y1-1,x2-x1+2,y2-y1+2);
        Mat img_temp(image_digit_with_border[i],rect);
        dilate(img_temp, img_temp, Mat());
//        imwrite("/Users/wzq/Desktop/untitled folder/untitled folder/"+to_string(i)+".jpg",temp_dict[max_index]);


        //resizeimg(temp_dict[max_index]);
        image_digit_final.push_back(img_temp);
        //imshow(to_string(i),temp_dict[max_index]);

        //count_digit++;
    }
    //waitKey(0);

}

void extract_minimum_led_digit(Mat &led_screen_frame,vector<Mat> &image_digit){
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;
    vector<Rect> rects_led;
    Mat led_screen_mask,led_screen_grayscale,led_screen_hsv;


    cvtColor(led_screen_frame,led_screen_hsv,COLOR_BGR2HSV);


    cvtColor(led_screen_frame,led_screen_grayscale,COLOR_BGR2GRAY);


//    Scalar lower_red=Scalar(0, 0, config_threshhold_led_light);//参数:LED灯亮度参数
//
//    Scalar upper_red=Scalar(255, 255, 255);
//    inRange(led_screen_frame,lower_red,upper_red,led_screen_mask);//红色LED掩码
    dilate(led_screen_mask, led_screen_mask, Mat(), Point(-1, -1), 2, 1, 1);


    findContours( led_screen_mask.clone(), contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
    for (int i = 0; i < contours.size(); ++i) {
        Rect rect=boundingRect(contours[i]);
//        rect.x-=2;
//        rect.y-=2;
//        rect.height+=4;
//        rect.width+=4;
        if(rect.height<10)continue;
        rects_led.push_back(rect);
    }
#ifdef test
//    imshow("led_screen_mask",led_screen_mask);
//    waitKey(0);
#endif
    sort(rects_led.begin(),rects_led.end(),sort_cmp_x_greater);
    for (int i = 0; i < rects_led.size(); ++i) {
        Mat im_gray(led_screen_grayscale,rects_led[i]),im_th;
//        adaptiveThreshold(im_gray,im_th,255,ADAPTIVE_THRESH_GAUSSIAN_C,THRESH_BINARY_INV,25,25);
        threshold(im_gray,im_th,150,255,THRESH_BINARY);
//        dilate(im_th, im_th, Mat(), Point(-1, -1), 2, 1, 1);

#ifdef test
//        imshow("led"+to_string(i),im_th);
//        waitKey(0);
#endif
        image_digit.push_back(im_th.clone());


    }
}
void digit_handwrite_recognize(vector<Mat> &image_digit,vector<Digit> &res){

//    vector<int> res;
    for (int i = 0; i < image_digit.size(); ++i) {
        Mat mat=image_resize(image_digit[i]);
        Digit temp=image_predict(mat,model_handwrite_digit);
        temp.index=i;
#ifdef test
        //imshow(to_string(i+1)+"-"+to_string(temp.result),mat);
#endif
//        imwrite("/Users/wzq/Desktop/untitled folder/untitled folder/"+to_string(i)+".jpg",mat);

        //res[i]=temp;
        res.push_back(temp);
    }

    //waitKey(0);


    //resizeimg(temp_dict[max_index]);
}
void digit_led_recognize(vector<Mat> &image_digit,vector<Digit> &res){
//    vector<int> res;
    for (int i = 0; i < image_digit.size(); ++i) {
        Mat mat=image_resize(image_digit[i]);
        Digit temp=image_predict(mat,model_led_digit);
        temp.index=i;
        //res[i]=temp;

        res.push_back(temp);
    }
}
int location_rectangle_detect(Mat &frame,vector<Rect> &pos_rect){//检测符合面积以及宽高比的矩形
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;

    Mat gray_frame,edge_frame;
    cvtColor(frame,gray_frame,COLOR_BGR2GRAY);
    Canny(frame,edge_frame, 500, 1500,5);
    findContours( edge_frame.clone(), contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
    for (int i = 0; i < contours.size(); ++i) {
        vector<Point> approx;
        vector<Vec4i> hierarchy;
        approxPolyDP(Mat(contours[i]), approx, arcLength(Mat(contours[i]), true)*0.04, true);
        if(approx.size()>=4&&approx.size()<=10){
            Rect rect=boundingRect(contours[i]);
            int x=rect.x,y=rect.y,w=rect.width,h=rect.height;
            int area=w*h;

            if(area<config_threshhold_white_rectangle_area_min || area > config_threshhold_white_rectangle_area_max)continue;//面积大小进行过滤

            if(((float)w/(float)h)<=1.5||((float)w/(float)h)>=2.5)continue;//宽高比过滤
//            rectangle(frame,rect,Scalar(0,0,255),2);

//            if(x<10 ||x>470)continue;//相对位置过滤

//            Mat mask_rect = Mat(gray_frame, rect);
//            Scalar mask_rect_average=mean(mask_rect);
            //if(mask_rect_average[0]<80||mask_rect_average[0]>100)continue;//通过平均颜色进行过滤

            pos_rect.push_back(rect);
        }
    }
    return pos_rect.size();
}
vector<Rect> location_rectangle_remove_duplicate(vector<Rect> pos_rect){//过滤相同矩形
    sort(pos_rect.begin(),pos_rect.end(),sort_cmp_y_greater);
    vector<Rect> pos_rect_new;
    pos_rect_new.push_back(pos_rect[0]);
    for (int i = 0; i < (pos_rect.size()-1); ++i) {
        int distance=abs(pos_rect[i].x-pos_rect[i+1].x)+abs(pos_rect[i].y-pos_rect[i+1].y);
        if(distance<10)
            continue;
        pos_rect_new.push_back(pos_rect[i+1]);
        //rectangle(frame,pos_rect[i],Scalar(0,0,255),2);
        cout<<pos_rect[i]<<pos_rect[i].height*pos_rect[i].width<<endl;
    }
    return pos_rect_new;
}
void location_rectangle_categorize(vector<Rect> &pos_rect,vector<Rect> &pos_rect_left,vector<Rect> &pos_rect_right){//将矩形按在图形中的位置分为左右两个部分
    for (int i = 0; i < pos_rect.size(); ++i) {
        if(pos_rect[i].x<(camera_width/2))
            pos_rect_left.push_back(pos_rect[i]);
        else
            pos_rect_right.push_back(pos_rect[i]);
    }

}

int location_rectangle_filter_variance(vector<Rect> &pos_rect){//通过方差过滤
    int mean,variance_mean;
    if(pos_rect.size()==5)return 5;
    while (1){//对x坐标进行过滤
        mean=0;
        variance_mean=0;
        vector<int> variance;
        for (int i = 0; i < pos_rect.size(); ++i) {
            mean+=pos_rect[i].x;
        }
        mean/=pos_rect.size();
        //求x坐标的平均值

        for (int i = 0; i < pos_rect.size(); ++i) {
            int temp=abs(pos_rect[i].x-mean);
            variance.push_back(temp);
        }
        //求到平均值的偏差


        for (int i = 0; i < variance.size(); ++i) {
            variance_mean+=variance[i];
        }
        variance_mean/=variance.size();
        //求偏差的平均值

        if(pos_rect.size()<=5)//当数量到达5时或者偏差没那么大的时候,退出x轴过滤器
        {
//            auto max1 = max_element(variance.begin(), variance.end());
//            int index1 = (int)distance(variance.begin(), max1);//求出索引
//
//            if(variance[index1]>10)
            break;

        }

        auto max = max_element(variance.begin(), variance.end());
        int index = (int)distance(variance.begin(), max);//求出索引
        if(variance_mean<10)//当数量到达5时或者偏差没那么大的时候,退出x轴过滤器
        {

            if(variance[index]<10)
                break;

        }
        pos_rect.erase(pos_rect.begin() + index);
    }
    if(pos_rect.size()==5)return 5;

    while (1){//对y轴进行过滤
        vector<int> distance_y,variance;
        mean=0;
        for (int i = 0; i < pos_rect.size()-1;++i) {
            distance_y.push_back(pos_rect[i+1].y-pos_rect[i].y);
            mean+=distance_y[i];
        }
        mean/=distance_y.size();
        //求y轴相近距离,以及平均值


        for (int i = 0; i < distance_y.size(); ++i) {
            int temp=abs(distance_y[i]-mean);
            variance.push_back(temp);
        }
        //求到平均值的偏差

        auto max = max_element(variance.begin(), variance.end());
        int index = (int)distance(variance.begin(), max);//求出索引

        if(index==0)pos_rect.erase(pos_rect.begin() + 0);
        else if(index==(distance_y.size()-1))pos_rect.erase(pos_rect.begin() + distance_y.size());
        else pos_rect.erase(pos_rect.begin() + index);
        if(pos_rect.size()<=5)break;
        //pos_rect.erase(pos_rect.begin() + index);
    }
    return pos_rect.size();



}
int variance_check(vector<Rect> &pos_rect){//通过方差计算矩形区域是否合法,防止程序崩溃
    int flag=0;
    int mean,variance_mean;
    {//对x坐标进行过滤
        mean=0;
        variance_mean=0;
        vector<int> variance;
        for (int i = 0; i < pos_rect.size(); ++i) {
            mean+=pos_rect[i].x;
        }
        mean/=pos_rect.size();
        //求x坐标的平均值

        for (int i = 0; i < pos_rect.size(); ++i) {
            int temp=abs(pos_rect[i].x-mean);
            variance.push_back(temp);
        }
        //求到平均值的偏差


        for (int i = 0; i < variance.size(); ++i) {
            variance_mean+=variance[i];
        }
        variance_mean/=variance.size();
        //求偏差的平均值

        if(variance_mean<10)//当数量到达5时或者偏差没那么大的时候,退出x轴过滤器
            flag+=1;

    }

    {//对y轴进行过滤
        vector<int> distance_y,variance;
        mean=0;
        for (int i = 0; i < pos_rect.size()-1;++i) {
            distance_y.push_back(pos_rect[i+1].y-pos_rect[i].y);
            mean+=distance_y[i];
        }
        mean/=distance_y.size();
        //求y轴相近距离,以及平均值


        for (int i = 0; i < distance_y.size(); ++i) {
            int temp=abs(distance_y[i]-mean);
            variance.push_back(temp);
        }
        //求到平均值的偏差

        for (int i = 0; i < variance.size(); ++i) {
            variance_mean+=variance[i];
        }
        variance_mean/=variance.size();
        if(variance_mean<10)//当数量到达5时或者偏差没那么大的时候,退出x轴过滤器
            flag+=1;
            //flag+=1;
        //pos_rect.erase(pos_rect.begin() + index);
    }
    return flag==2;
}
int judge_empty_rectangle(vector<Mat> &image_digit_handwrite_with_border){
    vector<float> empty_rate;
    int empty_count=0;
    for(int i=0;i<image_digit_handwrite_with_border.size();i++){
        //imshow(to_string(i),image_digit_handwrite_with_border[i]);
        float a=countNonZero(image_digit_handwrite_with_border[i]);
        float rate=a/(float)(image_digit_handwrite_with_border[i].size().width*image_digit_handwrite_with_border[i].size().height);
        //empty_rate.push_back(rate);
        if(rate>0.02)empty_count++;
    }
    if(empty_count>=5)
        return 1;
//    cout<<"rect is empty"<<endl;
    return 0;
    //waitKey(0);

}
void result_duplicate_solve(vector<Digit> &result){
    //int map[]={0,0,0,0,0,0,0,0,0,0};
    vector<Digit> map1[10];

    for (int i=0;i<result.size();i++){
        map1[result[i].result].push_back(result[i]);//统计数字出现次数
    }
    int duplicate_index=-1;
    int zero_index=-1;
    for (int i = 1; i < 10; ++i) {
        if(map1[i].size()==0)zero_index=i;
        if(map1[i].size()>=2)duplicate_index=i;
        
    }

    if(duplicate_index!=-1&&zero_index!=-1){
        Digit max1=map1[duplicate_index][0];
        Digit max2=map1[duplicate_index][1];
        //Digit zero1=map1[zero_index][0];
        if(max1.predictions[max1.result]>max2.predictions[max2.result]){
            result[max2.index].result=zero_index;
        }else{
            result[max1.index].result=zero_index;
        }

    }if(map1[0].size()!=0){
        Digit max1=map1[0][0];
        result[max1.index].result=zero_index;
    }

}
void save_result(vector<Digit> res,uint8_t *store){
    for (int i = 0; i < res.size(); ++i) {
        store[i]=res[i].result;
    }
}


int process(Mat frame){
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;
    vector<Rect> pos_rect,pos_rect_left,pos_rect_right;
//    vector<Rect> pos_rect_left(pos_rect_new.begin(),pos_rect_new.begin()+5),pos_rect_right(pos_rect_new.begin()+5,pos_rect_new.end());

#ifdef runtime_calculate
    clock_t clock_runtime;
#endif

    //对图像大小进行处理
    frame=resize_resize(frame);
    GaussianBlur(frame,frame,Size(5, 5),1);
#ifdef runtime_calculate
    clock_runtime=clock() ;
#endif

    location_rectangle_detect(frame,pos_rect);//检测所有符合大小符合的矩形
//    imshow("",frame);
//    waitKey(0);
    if(pos_rect.size()<10){
        cout<<"cannot find location rectangle"<<endl;
        return -1;
    }
    location_rectangle_categorize(pos_rect,pos_rect_left,pos_rect_right);//将矩形按在图形中的位置分为左右两个部分
    if(pos_rect_left.size()<5||pos_rect_right.size()<5){
        cout<<"cannot find location rectangle"<<endl;
        return -1;
    }
    pos_rect_left=location_rectangle_remove_duplicate(pos_rect_left);//过滤相同矩形
    pos_rect_right=location_rectangle_remove_duplicate(pos_rect_right);//过滤相同矩形
    if(pos_rect_left.size()<5||pos_rect_right.size()<5){
        cout<<"cannot find location rectangle"<<endl;
        return -1;
    }
    location_rectangle_filter_variance(pos_rect_left);//左侧矩形过滤
    location_rectangle_filter_variance(pos_rect_right);//右侧矩形过滤

    if(pos_rect_left.size()<5||pos_rect_right.size()<5){
        cout<<"cannot find location rectangle"<<endl;
        return -1;
    }
#ifdef test
    for(int i=0;i<5;i++){
        rectangle(frame,pos_rect_left[i],Scalar(0,0,255),2);
        rectangle(frame,pos_rect_right[i],Scalar(0,0,255),2);

    }
#endif
    if(!variance_check(pos_rect_left)||!variance_check(pos_rect_right)){
        cout<<"please adjust the paramater for rectangle"<<endl;
#ifdef test
//        imshow("frame",frame);
//        waitKey(0);
#endif
        return -1;
    }
    sort(pos_rect_left.begin(),pos_rect_left.end(),sort_cmp_y_greater);//左侧定位点排序
    sort(pos_rect_right.begin(),pos_rect_right.end(),sort_cmp_y_greater);//右侧定位点排序



#ifdef runtime_calculate
    printf("Time for find location rectangle takes: %lfs\n", (double)(clock() - clock_runtime)/CLOCKS_PER_SEC);
#endif



#ifdef test

    imshow("frame"+to_string(count_test),frame);
    waitKey(0);
#endif

#ifdef runtime_calculate
    clock_runtime=clock() ;
#endif

    vector<Mat> image_digit_handwrite;
    vector<Mat> image_digit_led;



    slice_first_line(frame,pos_rect_left,pos_rect_right,image_digit_handwrite);//切割出九宫格第一行
    slice_second_line(frame,pos_rect_left,pos_rect_right,image_digit_handwrite);//切割出九宫格第二行
    slice_third_line(frame,pos_rect_left,pos_rect_right,image_digit_handwrite);//切割出九宫格第三行
    Mat led_screen;
    if(slice_led(frame,pos_rect_left,pos_rect_right,led_screen)==-1){
        cout<<"led screen is not in range"<<endl;
        return -1;
    };////切割出LED
    vector<Mat> image_digit_handwrite_with_border,image_digit_handwrite_final;
    //对切割出的图片进行处理获取纯数字边框
    extract_digit_from_slice(image_digit_handwrite,image_digit_handwrite_with_border);//提取出九宫格中小矩形
    if(image_digit_handwrite_with_border.size()!=9){
        cout<<"cannot find enough image_digit_handwrite_with_border"<<endl;
        return -1;
	}

#ifdef timeline
    if(judge_empty_rectangle(image_digit_handwrite_with_border)==0){
        timeline_flag=0;
        timeline_buffer_jump=0;
        return -1;
    }

    if(timeline_buffer_jump<2&&timeline_flag==0){
        timeline_buffer_jump++;
        return -1;
    }
    if(timeline_flag==1)
        return -1;
    timeline_flag=1;





#else
    if(judge_empty_rectangle(image_digit_handwrite_with_border)==0)//判断九宫格是否为空
        return -1;
#endif
    extract_minimum_digit(image_digit_handwrite_with_border,image_digit_handwrite_final);//提取出最后识别九宫格图形
    extract_minimum_led_digit(led_screen,image_digit_led);//提取每个LED字符

#ifdef runtime_calculate
    printf("Time for locating each digit takes: %lfs\n", (double)(clock() - clock_runtime)/CLOCKS_PER_SEC);
#endif
//    if(image_digit_led.size()!=5){
//        cout<<"cannot find enough image_digit_led"<<endl;
//        return -1;
//        }
    vector<Digit> result_handwrite,result_led;


#ifdef runtime_calculate
    clock_runtime=clock() ;
#endif
    digit_handwrite_recognize(image_digit_handwrite_final,result_handwrite);//识别手写数字
    digit_led_recognize(image_digit_led,result_led);//识别LED数字

#ifdef runtime_calculate
    printf("Time for recognizing digit takes: %lfs\n", (double)(clock() - clock_runtime)/CLOCKS_PER_SEC);
#endif
    result_duplicate_solve(result_handwrite);
    save_result(result_handwrite,result_digit_handwrite);
    save_result(result_led,result_digit_led);




    return 0;

}
void PadPassPrint(uint8_t *digit_handwrite,uint8_t *digit_led){
    cout<<"pad:";
    for (int i = 0; i < 9; ++i) {
        cout<<(int)digit_handwrite[i];
        
    }
    cout<<endl;
    cout<<"pass:";
    for (int i = 0; i < 5; ++i) {
        cout<<(int)digit_led[i];

    }
    cout<<endl;
}
void config_load(){
    std::ifstream config_file(config_path);
    std::string str;

    config_file.seekg(0, std::ios::end);
    str.reserve(config_file.tellg());
    config_file.seekg(0, std::ios::beg);

    str.assign((std::istreambuf_iterator<char>(config_file)),
               std::istreambuf_iterator<char>());
    config_json=json::parse(str);
    model_handwrite_digit=new KerasModel(config_json["handwrite_nnet_path"],true);
    model_led_digit=new KerasModel(config_json["led_nnet_path"],true);
    config_threshhold_handwrite_1_width=config_json["threshhold_handwrite_1_width"];
    config_threshhold_led_light=config_json["threshhold_led_light"];
    config_threshhold_white_rectangle_area_min=config_json["threshhold_white_rectangle_area_min"];
    config_threshhold_white_rectangle_area_max=config_json["threshhold_white_rectangle_area_max"];

    //config_json.parse(str);
}

int main() {

    config_load();


    memset(result_digit_handwrite,0, sizeof(result_digit_handwrite));
    memset(result_digit_led,0, sizeof(result_digit_led));


#ifdef test
    VideoCapture cap("/Volumes/Untitled 2/wzq_1_946685387.mp4");
#endif
            clock_t tStart;
    Mat frame;
    int count=0;
    while(1){


#ifdef test
//        while (1){
//            cap>>frame;
//            if(frame.size().height>0&&frame.size().width>0)
//                imwrite("/Users/wzq/Downloads/untitled folder 5/"+to_string(count++)+".jpg",frame);
//        }
//        frame=imread("/Users/wzq/RoboMaster/PadPass/test7/1202.jpg");
//        for (int i = 0; i < 2828; i+=1) {
//            frame=imread("/Users/wzq/Downloads/video_output/"+to_string(i)+".jpg");
//            count_test=i;
//            if(process(frame)!=0)continue;
//
//
//            PadPassSend(result_digit_handwrite,result_digit_led);
//            PadPassPrint(result_digit_handwrite,result_digit_led);
////            imshow("frame"+to_string(i),frame);
////            waitKey(0);
//            destroyAllWindows();
//        }
        cap>>frame;
//        imwrite("/Users/wzq/Downloads/untitled folder/"+to_string(count++)+".jpg",frame);
//        continue;
#else
        if(getImageFromMemory(frame)!=0)continue;
#endif
tStart= clock();
        if(process(frame)!=0)continue;
    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
        PadPassSend(result_digit_handwrite,result_digit_led);
        PadPassPrint(result_digit_handwrite,result_digit_led);
#ifdef test

//        imshow("frame",frame);
//        waitKey(0);
        destroyAllWindows();
#endif
    }
    delete model_handwrite_digit;
    delete model_led_digit;



//    clock_t tStart;
//    tStart= clock();
//    m.compute_output(sample);
//    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
    tStart= clock();
    process(frame);
    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);


    tStart= clock();
    process(frame);
    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);


    imshow("frame",frame);
    waitKey(0);

//    tStart= clock();
//    process(frame);
//    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
    return 0;
}
