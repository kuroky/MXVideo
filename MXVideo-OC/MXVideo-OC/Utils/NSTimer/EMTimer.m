//
//  EMTimer.m
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMTimer.h"

@interface EMTimerTarget : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation EMTimerTarget

- (void) fire:(NSTimer *)timer {
    if(self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0.0f];
#pragma clang diagnostic pop
    } else {
        [self.timer invalidate];
    }
}

@end

@implementation EMTimer

+ ( NSTimer * _Nonnull ) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                 target:(_Nonnull id)aTarget
                                               selector:(_Nonnull SEL)aSelector
                                               userInfo:(_Nullable id)userInfo
                                                repeats:(BOOL)yesOrNo {
    EMTimerTarget *timerTarget = [EMTimerTarget new];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:yesOrNo];
    return timerTarget.timer;
}

+ (NSTimer * _Nonnull) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                block:(_Nonnull EMTimerHandler)block
                                             userInfo:(nullable id)userInfo
                                              repeats:(BOOL)yesOrNo {
    NSMutableArray *userInfoArray = [NSMutableArray arrayWithObject:[block copy]];
    if (userInfo != nil) {
        [userInfoArray addObject:userInfo];
    }
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(_timerBlockInvoke:)
                                       userInfo:[userInfoArray copy]
                                        repeats:yesOrNo];
}

+ (void)_timerBlockInvoke:(NSArray*)userInfo {
    EMTimerHandler block = userInfo[0];
    id info = nil;
    if (userInfo.count == 2) {
        info = userInfo[1];
    }
    // or `!block ?: block();` @sunnyxx
    if (block) {
        block(info);
    }
}

@end
