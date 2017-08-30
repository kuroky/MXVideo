//
//  EMAuthority.h
//  Emucoo
//
//  Created by kuroky on 2017/6/27.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMAuthority : NSObject

/**
 打开设置
 */
+ (void)em_openSettings;

/**
 打开Wifi设置
 */
+ (void)em_openWifiSettings;

/**
 用户相机权限是否开启
 
 @return NO:未开启
 */
+ (BOOL)em_CameraPermission;

/**
 用户麦克风权限是否开启
 
 @return NO:未开启
 */
+ (BOOL)em_RecordPermission;

/**
 用户相册权限是否开启
 
 @return NO:未开启
 */
+ (BOOL)em_AlbumPermission;

/**
 定位权限是否开启

 @return NO:未开启
 */
+ (BOOL)em_LocationPermission;

@end
