//
//  EMTool.h
//  Emucoo
//
//  Created by kuroky on 2017/7/26.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMTool : NSObject
 

/**
 根据弧度计算点在圆上坐标 起始弧度为0
 
            (y)
            ^ 90
            |
            |
            |
0           |
 ---------------------------> (x) 180
            |(0,0)
            |
            |
            | 90

 @param center 圆的中心点
 @param startAngle 偏移弧度 (-180 - 180)
 @param angle 弧度 (0 - 360)
 @param radius 圆的半径
 @param clockwise 是否顺时针
 @return CGPoint
 */
+ (CGPoint)em_coordinateWithCenter:(CGPoint)center
                    withStartAngle:(CGFloat)startAngle
                      andWithAngle:(CGFloat)angle
                     andWithRadius:(CGFloat)radius
                         clockwise:(BOOL)clockwise;

@end
