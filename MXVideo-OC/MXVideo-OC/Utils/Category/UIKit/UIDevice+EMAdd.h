//
//  UIDevice+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/7/4.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (EMAdd)

#pragma mark - Device Information
/**
 系统版本

 @return (e.g. 8.1)
 */
+ (double)em_systemVersion;

/**
 *  是否是Pad
 */
@property (nonatomic, readonly) BOOL em_isPad;

/**
 *  是否是模拟器
 */
@property (nonatomic, readonly) BOOL em_isSimulator;

/**
 *  设备是否越狱
 */
@property (nonatomic, readonly) BOOL em_isJailbroken;

/**
 *  是否可以打电话
 */
@property (nonatomic, readonly) BOOL em_canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

/**
 * 设备的机型 e.g. "iPhone6,1" "iPad4,6"
 */
@property (nullable,nonatomic, readonly) NSString *em_machineModel;

/**
 * 设备的机型名称 e.g. "iPhone 5s" "iPad mini 2"
 */
@property (nullable,nonatomic, readonly) NSString *em_machineModelName;

/**
 *  系统启动时间
 */
@property (nullable,nonatomic, readonly) NSDate *em_systemUptime;


#pragma mark - Network Information
/**
 *  设备的wifi ip地址  @"192.168.1.111"
 */
@property (nullable, nonatomic, readonly) NSString *em_ipAddressWIFI;

/**
 *  设备的Cell IP address  @"10.2.2.222"
 */
@property (nullable, nonatomic, readonly) NSString *em_ipAddressCell;

/**
 是否小屏幕手机 (5s, se, 4s...)
 */
@property (assign, nonatomic, readonly) BOOL em_isSmallDevice;

/**
 屏幕宽度
 */
@property (assign, nonatomic, readonly) CGFloat em_deviceWidth;

/**
 屏幕高度
 */
@property (assign, nonatomic, readonly) CGFloat em_deviceHeight;

/**
 Network traffic type:
 
 WWAN: Wireless Wide Area Network.
 For example: 3G/4G.
 
 WIFI: Wi-Fi.
 
 AWDL: Apple Wireless Direct Link (peer-to-peer connection).
 For exmaple: AirDrop, AirPlay, GameKit.
 */
typedef NS_OPTIONS(NSUInteger, YYNetworkTrafficType) {
    YYNetworkTrafficTypeWWANSent     = 1 << 0,
    YYNetworkTrafficTypeWWANReceived = 1 << 1,
    YYNetworkTrafficTypeWIFISent     = 1 << 2,
    YYNetworkTrafficTypeWIFIReceived = 1 << 3,
    YYNetworkTrafficTypeAWDLSent     = 1 << 4,
    YYNetworkTrafficTypeAWDLReceived = 1 << 5,
    
    YYNetworkTrafficTypeWWAN = YYNetworkTrafficTypeWWANSent | YYNetworkTrafficTypeWWANReceived,
    YYNetworkTrafficTypeWIFI = YYNetworkTrafficTypeWIFISent | YYNetworkTrafficTypeWIFIReceived,
    YYNetworkTrafficTypeAWDL = YYNetworkTrafficTypeAWDLSent | YYNetworkTrafficTypeAWDLReceived,
    
    YYNetworkTrafficTypeALL = YYNetworkTrafficTypeWWAN |
    YYNetworkTrafficTypeWIFI |
    YYNetworkTrafficTypeAWDL,
};

/**
 Get device network traffic bytes.
 
 @discussion This is a counter since the device's last boot time.
 Usage:
 
 uint64_t bytes = [[UIDevice currentDevice] getNetworkTrafficBytes:YYNetworkTrafficTypeALL];
 NSTimeInterval time = CACurrentMediaTime();
 
 uint64_t bytesPerSecond = (bytes - _lastBytes) / (time - _lastTime);
 
 _lastBytes = bytes;
 _lastTime = time;
 
 
 @param types traffic types
 @return bytes counter.
 */
- (uint64_t)em_getNetworkTrafficBytes:(YYNetworkTrafficType)types;

#pragma mark - Disk Space
///=============================================================================
/// @name Disk Space
///=============================================================================

/**
 *  磁盘总空间：（byte）(-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_diskSpace;

/**
 *  磁盘可用空间：（byte）(-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_diskSpaceFree;

/**
 *  磁盘已用空间：（byte）(-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_diskSpaceUsed;


#pragma mark - Memory Information
///=============================================================================
/// @name Memory Information
///=============================================================================

/**
 *  Total physical memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryTotal;

/**
 *  Used (active + inactive + wired) memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryUsed;

/**
 *  Free memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryFree;

/**
 *  Acvite memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryActive;

/**
 *  Inactive memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryInactive;

/**
 *   Wired memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryWired;

/**
 *   Purgable memory in byte. (-1 when error occurs)
 */
@property (nonatomic, readonly) int64_t em_memoryPurgable;

#pragma mark - CPU Information
///=============================================================================
/// @name CPU Information
///=============================================================================

/**
 *   Avaliable CPU processor count.
 */
@property (nonatomic, readonly) NSUInteger em_cpuCount;

/**
 *   Current CPU usage, 1.0 means 100%. (-1 when error occurs)
 */
@property (nonatomic, readonly) float em_cpuUsage;

/**
 *   Current CPU usage per processor (array of NSNumber), 1.0 means 100%. (nil when error occurs)
 */
@property (nullable, nonatomic, readonly) NSArray<NSNumber *> *em_cpuUsagePerProcessor;

@end
