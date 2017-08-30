//
//  UILabel+EMAdd.m
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "UILabel+EMAdd.h"

@implementation UILabel (EMAdd)
#pragma marl - 计算文字所占的高度
+ (CGFloat)heightOfLabel:(NSString *)text
                textFont:(UIFont *)font
               lineSpace:(CGFloat)lineSpace
                   width:(CGFloat)width {
    if ([UILabel isBlank:text]) {
        return 0;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    if (lineSpace) {
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.lineSpacing = lineSpace;
        [attributes setObject:style forKey:NSParagraphStyleAttributeName];
    }
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    CGRect rect = [attString boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                          context:nil];
    return rect.size.height;
}

+ (CGFloat)widthOfLabel:(NSString *)text
               textFont:(UIFont *)font
                 height:(CGFloat)height {
    if ([UILabel isBlank:text]) {
        return 0;
    }
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:font}];
    CGRect rect = [attString boundingRectWithSize:(CGSize){CGFLOAT_MAX, height}
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                          context:nil];
    return rect.size.width;
}

+ (BOOL)isBlank:(NSString *)stringValue {
    if ([stringValue isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([stringValue isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    
    return (stringValue == nil) || ([stringValue length] <1) || stringValue == NULL;
}

#pragma mark - 计算label所占高度
- (CGFloat)em_heightOfLabel {
    return [UILabel heightOfLabel:self.text
                         textFont:self.font
                        lineSpace:0
                            width:self.frame.size.width];
}

#pragma mark - 计算label所占宽度
- (CGFloat)em_widthOfLabel {
    return  [UILabel widthOfLabel:self.text
                         textFont:self.font
                           height:self.frame.size.height];
}

#pragma mark - 计算文字所占size
+ (CGSize)sizeWithFont:(UIFont *)font
                string:(NSString *)string
                  size:(CGSize)size
                  mode:(NSLineBreakMode)lineBreakMode {
    if (!font)
        font = [UIFont systemFontOfSize:12];
    NSMutableDictionary *attr = [NSMutableDictionary new];
    attr[NSFontAttributeName] = font;
    if (lineBreakMode != NSLineBreakByWordWrapping) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = lineBreakMode;
        attr[NSParagraphStyleAttributeName] = paragraphStyle;
    }
    CGRect rect = [string boundingRectWithSize:size
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    attributes:attr
                                       context:nil];
    return rect.size;
}

- (void)em_attributeContent:(NSString *)content
           normalAttributes:(NSDictionary *)nAttributes
              specialString:(NSString *)sString
          specialattributes:(NSDictionary *)sAttributes {
    if (!content || !sString) {
        return;
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content
                                                                            attributes:nAttributes];
    NSRange range = [content localizedStandardRangeOfString:sString];
    if (NSNotFound != range.location && range.length > 0) {
        [str setAttributes:sAttributes range:range];
    }
    self.attributedText = str;
}

- (void)em_attributeContent:(NSString *)content
           normalAttributes:(NSDictionary *)nAttributes
              specialString:(NSString *)sString
          specialattributes:(NSDictionary *)sAttributes
                  lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content
                                                                            attributes:nAttributes];
    NSRange range = [content localizedStandardRangeOfString:sString];
    if (NSNotFound != range.location && range.length > 0) {
        [str setAttributes:sAttributes range:range];
    }
    
    if (lineSpace > 0) {
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.lineSpacing = lineSpace;
        NSDictionary *attributes = @{NSParagraphStyleAttributeName:style};
        NSRange range = NSMakeRange(0, str.length);
        [str setAttributes:attributes range:range];
    }
    self.attributedText = str;
}

- (void)em_attributeContent:(NSString *)content
           normalAttributes:(NSDictionary *)nAttributes
             specialStrings:(NSArray *)sStrings
          specialattributes:(NSArray *)sAttributes
                  lineSpace:(CGFloat)lineSpace {
    NSMutableDictionary *nattributes = [NSMutableDictionary dictionaryWithDictionary:nAttributes];
    if (lineSpace > 0) {
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.lineSpacing = lineSpace;
        [nattributes setValue:style forKey:NSParagraphStyleAttributeName];
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content
                                                                            attributes:nattributes];
    BOOL useSameAtt = NO; // 使用相同的attribute
    if (sStrings.count != sAttributes.count) {
        useSameAtt = YES;
    }
    if (sStrings.count) {
        [sStrings enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [content localizedStandardRangeOfString:obj];
            if (NSNotFound != range.location && range.length > 0) {
                NSInteger index = useSameAtt == YES ? 0 : idx;
                NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
                style.lineSpacing = lineSpace;
                NSMutableDictionary *attribute = [NSMutableDictionary dictionaryWithDictionary:sAttributes[index]];
                [attribute setValue:style forKey:NSParagraphStyleAttributeName];
                [str setAttributes:attribute range:range];
            }
        }];
    }
    self.attributedText = str;
}

- (void)em_attributeContent:(NSString *)content
              withLineSpace:(CGFloat)lineSpace {
    if (!content) {
        return;
    }
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = lineSpace;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:style};
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content attributes:attributes];
    self.attributedText = str;
}

@end
