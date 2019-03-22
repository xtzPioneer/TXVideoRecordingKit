# TXVideoRecordingKit

[![CI Status](https://img.shields.io/travis/907689522@qq.com/TXVideoRecordingKit.svg?style=flat)](https://travis-ci.org/907689522@qq.com/TXVideoRecordingKit)
[![Version](https://img.shields.io/cocoapods/v/TXVideoRecordingKit.svg?style=flat)](https://cocoapods.org/pods/TXVideoRecordingKit)
[![License](https://img.shields.io/cocoapods/l/TXVideoRecordingKit.svg?style=flat)](https://cocoapods.org/pods/TXVideoRecordingKit)
[![Platform](https://img.shields.io/cocoapods/p/TXVideoRecordingKit.svg?style=flat)](https://cocoapods.org/pods/TXVideoRecordingKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 使用方法
* #import "TXVideoRecordingKit.h" 即可使用
```objc
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
```

## Installation

TXVideoRecordingKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TXVideoRecordingKit'
```

## Author

xtz_pioneer, xtz_pioneer@163.com

## License

TXVideoRecordingKit is available under the MIT license. See the LICENSE file for more info.
