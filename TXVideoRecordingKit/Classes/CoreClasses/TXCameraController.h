//
//  TXCameraController.h
//  MGJRouter
//
//  Created by xtz_pioneer on 2019/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  拍照完成后的Block回调
 *
 *  @param image 拍照后返回的image
 */
typedef void(^TakePhotosCompletionBlock)(UIImage *image, NSError *error);

/**
 *  拍摄完成后的Block回调
 *
 *  @param videoUrl 拍摄后返回的小视频地址
 *  @param videoTimeLength 小视频时长
 *  @param thumbnailImage 小视频缩略图
 */
typedef void(^ShootCompletionBlock)(NSURL *videoUrl, CGFloat videoTimeLength, UIImage *thumbnailImage, NSError *error);


@interface TXCameraController : UIViewController

/**
 *  拍照完成后的Block回调
 */
@property (copy, nonatomic) TakePhotosCompletionBlock takePhotosCompletionBlock;

/**
 *  拍摄完成后的Block回调
 */
@property (copy, nonatomic) ShootCompletionBlock shootCompletionBlock;

/**
 *  自定义APP相册名字，如果为空则默认为APP的名字
 */
@property (strong, nonatomic) NSString *assetCollectionName;

/**
 *  视频文件保存文件夹，如果没有定义，默认在document/video文件夹下面
 */
@property (strong, nonatomic) NSString *videoFilePath;

+ (instancetype)defaultCameraController;
@end

NS_ASSUME_NONNULL_END
