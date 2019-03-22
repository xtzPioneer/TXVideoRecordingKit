#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TXCameraButton.h"
#import "TXCameraController.h"
#import "TXPhotoLibraryManager.h"
#import "TXVideoRecordingKit.h"
#import "TXVideoRecordingModuleRouter.h"

FOUNDATION_EXPORT double TXVideoRecordingKitVersionNumber;
FOUNDATION_EXPORT const unsigned char TXVideoRecordingKitVersionString[];

