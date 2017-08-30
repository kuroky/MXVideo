//
//  EMTimer.h
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EMTimerHandler)(_Nullable id userInfo);

@interface EMTimer : NSObject

+ ( NSTimer * _Nonnull ) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                 target:(_Nonnull id)aTarget
                                               selector:(_Nonnull SEL)aSelector
                                               userInfo:(_Nullable id)userInfo
                                                repeats:(BOOL)yesOrNo;

+ (NSTimer * _Nonnull) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                block:(_Nonnull EMTimerHandler)block
                                             userInfo:(nullable id)userInfo
                                              repeats:(BOOL)yesOrNo;

@end
