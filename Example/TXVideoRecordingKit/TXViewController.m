//
//  TXViewController.m
//  TXVideoRecordingKit
//
//  Created by 907689522@qq.com on 03/22/2019.
//  Copyright (c) 2019 907689522@qq.com. All rights reserved.
//

#import "TXViewController.h"

@interface TXViewController ()

@end

@implementation TXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 按钮
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"点击进入拍摄" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat buttonX=15;
    CGFloat buttonY=200;
    CGFloat buttonW=self.view.frame.size.width-buttonX*2;
    CGFloat buttonH=25;
    button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
    [self.view addSubview:button];
	// Do any additional setup after loading the view, typically from a nib.
}

/** 按钮事件 */
- (void)buttonEvent:(id)sender{
    // 创建参数
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    // 拍照完成后回调
    typedef void (^TXTakePhotosCompletionHandler) (NSError *error,UIImage *image);
    TXTakePhotosCompletionHandler takePhotosCompletionHandler=
    takePhotosCompletionHandler = ^(NSError *error,UIImage *image){
        if (!error) {
            NSLog(@"image:%@",image);
        }else{
        }
    };
    // 拍摄完成后回调
    typedef void (^TXShootCompletionHandler) (NSError *error,NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage);
    TXShootCompletionHandler shootCompletionHandler = ^(NSError *error,NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage){
        if (!error) {
            NSLog(@"thumbnailImage:%@",thumbnailImage);
            NSLog(@"videoTimeLength:%f",videoTimeLength);
            NSLog(@"videoUrl:%@",videoUrl);
        }else{
        }
    };
    // 设置参数
    [parameters setObject:takePhotosCompletionHandler forKey:@"takePhotosCompletionHandler"];
    [parameters setObject:shootCompletionHandler forKey:@"shootCompletionHandler"];
    // 打开方式1 URL
    [MGJRouter openURL:@"tx://present/videoRecording"
          withUserInfo:parameters
            completion:nil];
    /*
    // 打开方式2 URL
    UIViewController *vc=[MGJRouter objectForURL:@"tx://get/videoRecording" withUserInfo:parameters];
    [self presentViewController:vc animated:YES completion:nil];
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
