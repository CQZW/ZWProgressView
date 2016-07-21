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
    ZWProgressView* _xxxx;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _xxxx = [[ZWProgressView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    
    _xxxx.mCompletedColorStart  =   [UIColor blueColor];
    _xxxx.mCompletedColorEnd    =   [UIColor redColor];

    [self.view addSubview:_xxxx];
    
    NSTimer* ttt = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(xxxx) userInfo:nil repeats:YES];
    [ttt fire];
}
-(void)xxxx
{
    _xxxx.mProgress += 0.01;
    if( _xxxx.mProgress >= 1.0f )
        _xxxx.mProgress = 0.0f;
    
    _xxxx.mCenterTxt = [NSString stringWithFormat:@"%.1f'", _xxxx.mProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
