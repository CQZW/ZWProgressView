//
//  ZWProgressView.h
//  testCode
//
//  Created by zzl on 16/7/20.
//  Copyright © 2016年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWProgressView : UIView


@property (nonatomic,assign)    CGFloat     mRadial;//半径.默认 frame的 /2

//没完成的颜色
@property (nonatomic,strong)    UIColor*    mInCompletedColor;

//未完成的线条宽度,默认1
@property (nonatomic,assign)    CGFloat     mWidthOfInCompleted;

//完成了的颜色,开始,结束的渐变..
@property (nonatomic,strong)    UIColor*    mCompletedColorStart;
@property (nonatomic,strong)    UIColor*    mCompletedColorEnd;

//完成的线条宽度,默认2
@property (nonatomic,assign)    CGFloat     mWidthOfCompleted;


@property (nonatomic,assign)    float       mProgress;//0~1.0f;

@property (nonatomic,strong)    NSString*   mCenterTxt;//中间的文字..

@property (nonatomic,strong)    UIColor*    mTxtColor;//默认=mCompletedColorStart

@end
