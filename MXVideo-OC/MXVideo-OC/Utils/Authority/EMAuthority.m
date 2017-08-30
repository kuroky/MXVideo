//
//  EMAuthority.m
//  Emucoo
//
//  Created by kuroky on 2017/6/27.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMAuthority.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>

@implementation EMAuthority

#pragma mark - 打开应用设置
+ (void)em_openSettings {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication] openURL:url
                                       options:@{}
                             completionHandler:nil];
}

+ (void)em_openWifiSettings {
    NSURL *url = [NSURL URLWithString:@"App-Prefs:root=WIFI"];
    [[UIApplication sharedApplication] openURL:url
                                       options:@{}
                             completionHandler:nil];
}

#pragma mark - 相机
+ (BOOL)em_CameraPermission; {
    if (TARGET_IPHONE_SIMULATOR) {
        return YES;
    }
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

#pragma mark - 麦克风
+ (BOOL)em_RecordPermission {
    AVAudioSessionRecordPermission recordPermission = [AVAudioSession sharedInstance].recordPermission;
    if (recordPermission == AVAudioSessionRecordPermissionDenied) {
        return NO;
    }
    else {
        return YES;
    }
}

#pragma mark - 相册权限
+ (BOOL)em_AlbumPermission {
    PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
    if(author == PHAuthorizationStatusRestricted || author == PHAuthorizationStatusDenied){
        //无权限
        return NO;
    }
    else {
        return YES;
    }
}

#pragma mark - 定位权限
+ (BOOL)em_LocationPermission {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

@end
