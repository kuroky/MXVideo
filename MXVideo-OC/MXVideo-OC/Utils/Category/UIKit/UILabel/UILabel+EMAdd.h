//
//  UILabel+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (EMAdd)

/**
 *  根据文字的大小和既定的宽度，来计算文字所占的高度
 *
 *  @param text 字符串
 *  @param font        字体大小
 *  @param lineSpace   行间距
 *  @param width       最大宽度
 *
 *  @return 文字高度
 */
+ (CGFloat)heightOfLabel:(NSString *)text
                textFont:(UIFont *)font
               lineSpace:(CGFloat)lineSpace
                   width:(CGFloat)width;

/**
 *  根据文字的大小和既定的高度，来计算文字所占的宽度
 *
 *  @param text 字符串
 *  @param font        字体大小
 *  @param height      最大高度
 *
 *  @return 文字宽度
 */
+ (CGFloat)widthOfLabel:(NSString *)text
               textFont:(UIFont *)font
                 height:(CGFloat)height;

/**
 计算label所占高度

 @return label占据高度
 */
- (CGFloat)em_heightOfLabel;

/**
 计算label所占宽度
 
 @return label占据宽度
 */
- (CGFloat)em_widthOfLabel;

/**
 计算字符串frame.size
 
 @param font 字体
 @param string 文字
 @param size 默认size
 @param lineBreakMode NSParagraphStyle
 @return CGSize
 */
+ (CGSize)sizeWithFont:(UIFont *)font
                string:(NSString *)string
                  size:(CGSize)size
                  mode:(NSLineBreakMode)lineBreakMode;

/**
 label简单富文本1
 NSDictionary *nAtt = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blackColor]};
 NSDictionary *sAtt = @{NSFontAttributeName:[UIFont em_boldFont:16],NSForegroundColorAttributeName:[EMBaseColor chat_blackColor1]};
 
 @param content 正常内容
 @param nAttributes 正常格式
 @param sString 特殊字符
 @param sAttributes 特殊格式
 */
- (void)em_attributeContent:(NSString *)content
           normalAttributes:(NSDictionary *)nAttributes
              specialString:(NSString *)sString
          specialattributes:(NSDictionary *)sAttributes;

/**
 label简单富文本 + 行间距

 @param content 正常内容
 @param nAttributes 正常格式
 @param sString 特殊字符
 @param sAttributes 特殊格式
 @param lineSpace 行间距
 */
- (void)em_attributeContent:(NSString *)content
           normalAttributes:(NSDictionary *)nAttributes
              specialString:(NSString *)sString
          specialattributes:(NSDictionary *)sAttributes
                  lineSpace:(CGFloat)lineSpace;

/**
 label添加富文本2

 @param content 正常内容
 @param nAttributes 正常格式
 @param sStrings 特殊字符...
 @param sAttributes 特殊字符格式...
 @param lineSpace 行间距
 */
- (void)em_attributeContent:(NSString *)content
           normalAttributes:(NSDictionary *)nAttributes
             specialStrings:(NSArray *)sStrings
          specialattributes:(NSArray *)sAttributes
                  lineSpace:(CGFloat)lineSpace;

/**
 label增加行间距

 @param content 内容
 @param lineSpace 行间距
 */
- (void)em_attributeContent:(NSString *)content
              withLineSpace:(CGFloat)lineSpace;

@end
