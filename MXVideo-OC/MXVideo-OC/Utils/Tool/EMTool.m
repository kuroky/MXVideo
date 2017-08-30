//
//  EMTool.m
//  Emucoo
//
//  Created by kuroky on 2017/7/26.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMTool.h"

@implementation EMTool

+ (CGPoint)em_coordinateWithCenter:(CGPoint)center
                    withStartAngle:(CGFloat)startAngle
                      andWithAngle:(CGFloat)angle
                     andWithRadius:(CGFloat)radius
                         clockwise:(BOOL)clockwise {
    CGFloat lastAngle;
    if (clockwise) {
        lastAngle = 180 - angle - startAngle;
    }
    else {
        lastAngle = angle + 180 + startAngle;
    }
    CGFloat x = radius * cosf(lastAngle*M_PI/180);
    CGFloat y = radius * sinf(lastAngle*M_PI/180);
    return CGPointMake(center.x + x, center.y - y);
}

@end
