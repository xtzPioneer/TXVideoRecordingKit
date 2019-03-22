//
//  TXVideoRecordingModuleRouter.h
//  MGJRouter
//
//  Created by xtz_pioneer on 2019/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 获取视频录制模块URL */
FOUNDATION_EXPORT NSString *const getVideoRecordingModuleURL;
/** 打开视频录制模块URL */
FOUNDATION_EXPORT NSString *const openVideoRecordingModuleURL;

/** 拍照完成后回调Key */
FOUNDATION_EXPORT NSString *const takePhotosCompletionHandlerKey;
/** 拍摄完成后回调Key */
FOUNDATION_EXPORT NSString *const shootCompletionHandlerKey;

/**
 *  视频录制模块
 *
 * 请用以下方式打开《视频录制模块》
 *  创建参数
 *
 *  NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
 *
 *  拍照完成后回调
 *
 *  typedef void (^TXTakePhotosCompletionHandler) (NSError *error,UIImage *image);
 *  TXTakePhotosCompletionHandler takePhotosCompletionHandler=
 *  takePhotosCompletionHandler = ^(NSError *error,UIImage *image){
 *  if (!error) {
 *  NSLog(@"image:%@",image);
 *  }else{
 *  }
 *  };
 *
 *  拍摄完成后回调
 *
 *  typedef void (^TXShootCompletionHandler) (NSError *error,NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage);
 *  TXShootCompletionHandler shootCompletionHandler = ^(NSError *error,NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage){
 *  if (!error) {
 *  NSLog(@"thumbnailImage:%@",thumbnailImage);
 *  NSLog(@"videoTimeLength:%f",videoTimeLength);
 *  NSLog(@"videoUrl:%@",videoUrl);
 *  }else{
 *  }
 *  };
 *
 *  设置参数
 *
 *  [parameters setObject:takePhotosCompletionHandler forKey:@"takePhotosCompletionHandler"];
 *  [parameters setObject:shootCompletionHandler forKey:@"shootCompletionHandler"];
 *
 *  打开方式1 URL
 *
 *  [MGJRouter openURL:@"tx://present/videoRecording"
 *  withUserInfo:parameters
 *  completion:nil];
 *
 *  打开方式2 URL
 *
 *  UIViewController *vc=[MGJRouter objectForURL:@"tx://get/videoRecording" withUserInfo:parameters];
 *  [self presentViewController:vc animated:YES completion:nil];
 *
 */
@interface TXVideoRecordingModuleRouter : NSObject

@end

NS_ASSUME_NONNULL_END
