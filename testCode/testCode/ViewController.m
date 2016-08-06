//
//  ViewController.m
//  testCode
//
//  Created by zzl on 16/7/20.
//  Copyright © 2016年 zzl. All rights reserved.
//

#import "ViewController.h"
#import "ZWProgressView.h"

@interface ViewController ()

@end

@implementation ViewController
{
 }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.mvvvvv.mCompletedColorStart  =   [UIColor blueColor];
    self.mvvvvv.mCompletedColorEnd    =   [UIColor redColor];

    
    NSTimer* ttt = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(xxxx) userInfo:nil repeats:YES];
    [ttt fire];
}
-(void)xxxx
{
    if( self.mvvvvv.mProgress > 0.5f )
        self.mvvvvv.mProgress += 0.001;
    else
        self.mvvvvv.mProgress += 0.01;
    
        
    if( self.mvvvvv.mProgress >= 1.0f )
        self.mvvvvv.mProgress = 0.0f;
    
    self.mvvvvv.mCenterTxt = [NSString stringWithFormat:@"%.1f'", self.mvvvvv.mProgress];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
