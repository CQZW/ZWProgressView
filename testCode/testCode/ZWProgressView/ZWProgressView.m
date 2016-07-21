//
//  ZWProgressView.m
//  testCode
//
//  Created by zzl on 16/7/20.
//  Copyright © 2016年 zzl. All rights reserved.
//

#import "ZWProgressView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZWProgressView
{
    UILabel*    _centerlabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//rgb 0x123456
-(UIColor*)rgbForColor:(int)rgb
{
    int r = ( rgb & 0x00ff0000 ) >> 16;
    int g = ( rgb & 0x0000ff00 ) >> 8;
    int b = ( rgb & 0x000000ff ) >> 0;
    
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.000];
}

-(void)cfgDefault
{
    self.backgroundColor = [UIColor clearColor];
    
    self.mRadial = self.frame.size.width/2 - 1;//半径..默认30
    
    //34 39 3f
    self.mInCompletedColor = [self rgbForColor:0x34393f];
    
    self.mWidthOfInCompleted = 1;
    //77 6e c8
    
    self.mCompletedColorStart = [self rgbForColor:0x776ec8];
    
    //2c 8f cd
    self.mCompletedColorEnd = [self rgbForColor:0x2c8fcd];
    
    self.mWidthOfCompleted = 3;
    
    self.mProgress = 0.0f;//0~1.0f;
    
    self.mCenterTxt = @"";//中间的文字..
    
    self.mTxtColor = self.mCompletedColorStart;//默认=mCompletedColorStart
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self cfgDefault];
    
    _centerlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
    _centerlabel.font = [UIFont systemFontOfSize:15];//字体没有考虑 frame 很小的情况
    _centerlabel.textColor = self.mTxtColor;
    _centerlabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_centerlabel];
    _centerlabel.center = CGPointMake(frame.size.width/2.0f, frame.size.height/2.0f);
    
    return self;
}

-(void)setMProgress:(float)mProgress{
    _mProgress = mProgress;
    if( _mProgress >= 1.0f )
        _mProgress = 1.0f;
    
    [self setNeedsDisplay];
}

-(void)setMCenterTxt:(NSString *)mCenterTxt
{
    _mCenterTxt = mCenterTxt;
    _centerlabel.text = mCenterTxt;
}


-(CGFloat)getDrawAngle
{
    return 2*M_PI*self.mProgress;
}

-(UIColor*)getDrawColor:(float)progress
{
    CGFloat r1,g1,b1,a1;
    CGFloat r2,g2,b2,a2;
    
    [self.mCompletedColorStart  getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [self.mCompletedColorEnd    getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
  
    b2 *= 255.0f;
    
    
    CGFloat dr,dg,db,da;
    dr = r2 - r1;
    dg = g2 - g1;
    db = b2 - b1;
    da = a2 - a1;
    
    r1 += dr * progress;
    g1 += dg * progress;
    b1 += db * progress;
    a1 += da * progress;
    
    return [UIColor colorWithRed:r1  green:g1  blue:b1 alpha:a1];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGPoint itcenter = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    //先画未完成的圆圈...
    CGFloat r,g,b,a;
    
    [self.mInCompletedColor getRed:&r green:&g blue:&b alpha:&a];
    
    CGContextSetRGBStrokeColor( context, r , g , b , a );//画笔线的颜色
    CGContextSetLineWidth(context, self.mWidthOfInCompleted);//线的宽度
    CGContextAddArc(context,itcenter.x,
                            itcenter.y,
                            self.mRadial,
                            0,2*M_PI,
                            0); //添加一个圆
    
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
#define DIF_P 0.01f
    
    for ( float f = 0.0f; f < self.mProgress ; f += DIF_P) {
        
        [[self getDrawColor:f] getRed:&r green:&g blue:&b alpha:&a];
        
        CGContextSetRGBStrokeColor( context, r , g , b , a );//画笔线的颜色
        CGContextSetLineWidth(context, self.mWidthOfCompleted);//线的宽度
        CGContextAddArc(context,itcenter.x,
                        itcenter.y,
                        self.mRadial-0.5f,
                        2*M_PI*f - M_PI/2.0f,(f+DIF_P)*2*M_PI-M_PI/2.0f,
                        0); //添加一个圆
        
        CGContextDrawPath(context, kCGPathStroke); //绘制路径
        
    }
}





@end
