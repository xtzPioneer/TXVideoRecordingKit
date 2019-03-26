//
//  TXVideoRecordingModuleRouter.m
//  MGJRouter
//
//  Created by xtz_pioneer on 2019/3/22.
//

#import "TXVideoRecordingModuleRouter.h"
#import <MGJRouterKit/MGJRouterKit.h>

/** 获取视频录制模块URL */
NSString *const getVideoRecordingModuleURL=@"tx://get/videoRecording";
/** 打开视频录制模块URL */
NSString *const openVideoRecordingModuleURL=@"tx://present/videoRecording";

/** 拍照完成后回调Key */
NSString *const takePhotosCompletionHandlerKey=@"takePhotosCompletionHandler";
/** 拍摄完成后回调Key */
NSString *const shootCompletionHandlerKey=@"shootCompletionHandler";

@implementation TXVideoRecordingModuleRouter

/** appDelegate */
+ (id)appDelegate{
    return [UIApplication sharedApplication].delegate;
}

/** rootViewController */
+ (UIViewController *)rootViewController{
    UIWindow *window=[[self appDelegate] window];
    return window.rootViewController;
}

/** 获取当前控制器 */
+ (UIViewController*)currentViewController{
    UIViewController *currentViewController=[self rootViewController];
    while (currentViewController.presentedViewController) {
        currentViewController=currentViewController.presentedViewController;
    }
    if ([currentViewController isKindOfClass:[UITabBarController class]]) {
        currentViewController=[(UITabBarController *)currentViewController selectedViewController];
    }
    if ([currentViewController isKindOfClass:[UINavigationController class]]) {
        currentViewController=[(UINavigationController *)currentViewController topViewController];
    }
    return currentViewController;
}

/** 自动注册 */
+ (void)load{
    
    // 获取视频录制模块
    [MGJRouter registerURLPattern:getVideoRecordingModuleURL toObjectHandler:^id(NSDictionary *routerParameters) {
        // 创建相机控制器
        TXCameraController *cameraController=[TXCameraController defaultCameraController];
        // 弱引用
        __weak TXCameraController *weakCameraController=cameraController;
        // 拍照完成后回调
        typedef void (^TXTakePhotosCompletionHandler) (NSError *error,UIImage *image);
        TXTakePhotosCompletionHandler takePhotosCompletionHandler =routerParameters[MGJRouterParameterUserInfo][takePhotosCompletionHandlerKey];
        cameraController.takePhotosCompletionBlock = ^(UIImage *image, NSError *error) {
            [weakCameraController dismissViewControllerAnimated:YES completion:nil];
            if (takePhotosCompletionHandler) takePhotosCompletionHandler(error,image);
        };
        // 拍摄完成后回调
        typedef void (^TXShootCompletionHandler) (NSError *error,NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage);
        TXShootCompletionHandler shootCompletionHandler =routerParameters[MGJRouterParameterUserInfo][shootCompletionHandlerKey];
        cameraController.shootCompletionBlock = ^(NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage, NSError *error) {
            [weakCameraController dismissViewControllerAnimated:YES completion:nil];
            if (shootCompletionHandler) shootCompletionHandler(error,videoUrl,videoTimeLength,thumbnailImage);
        };
        return cameraController;
    }];
    
    // 打开视频录制模块
    [MGJRouter registerURLPattern:openVideoRecordingModuleURL toHandler:^(NSDictionary *routerParameters) {
        // 创建相机控制器
        TXCameraController *cameraController=[TXCameraController defaultCameraController];
        // 弱引用
        __weak TXCameraController *weakCameraController=cameraController;
        // 拍照完成后回调
        typedef void (^TXTakePhotosCompletionHandler) (NSError *error,UIImage *image);
        TXTakePhotosCompletionHandler takePhotosCompletionHandler =routerParameters[MGJRouterParameterUserInfo][takePhotosCompletionHandlerKey];
        cameraController.takePhotosCompletionBlock = ^(UIImage *image, NSError *error) {
            [weakCameraController dismissViewControllerAnimated:YES completion:nil];
            if (takePhotosCompletionHandler) takePhotosCompletionHandler(error,image);
        };
        // 拍摄完成后回调
        typedef void (^TXShootCompletionHandler) (NSError *error,NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage);
        TXShootCompletionHandler shootCompletionHandler =routerParameters[MGJRouterParameterUserInfo][shootCompletionHandlerKey];
        cameraController.shootCompletionBlock = ^(NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage, NSError *error) {
            [weakCameraController dismissViewControllerAnimated:YES completion:nil];
            if (shootCompletionHandler) shootCompletionHandler(error,videoUrl,videoTimeLength,thumbnailImage);
        };
        [[self currentViewController] presentViewController:cameraController animated:YES completion:nil];
    }];
    
}

@end
