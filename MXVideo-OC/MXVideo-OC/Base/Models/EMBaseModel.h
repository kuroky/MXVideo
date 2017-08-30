//
//  EMBaseModel.h
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Model的基类
 */
@interface EMBaseModel : NSObject <NSCopying, NSCoding>

/**
 *  将json字典转换成Model
 *
 *  @param jsonDic NSDictionary类型的json
 *
 *  @return model
 */
+ (id)em_convertModelWithJsonDic:(NSDictionary *)jsonDic;

/**
 *  将json字符串转换成Model
 *
 *  @param jsonStr NSString类型的json
 *
 *  @return model
 */
+ (id)em_convertModelWithJsonStr:(NSString *)jsonStr;

/**
 *  将json数组model化
 *
 *  @param jsonArr NSArray类型json
 *
 *  @return 包含model的NSArray
 */
+ (NSArray *)em_convertModelWithJsonArr:(NSArray *)jsonArr;

/**
 字段映射 @"本地字段": @"后台返回"

 @return 映射 NSDictionary
 */
+ (NSDictionary *)modelCustomPropertyMapper;

/**
 容器类段映射 @{@"emobjectList": [EMObject class]

 @return 映射 NSDictionary
 */
+ (NSDictionary *)modelContainerPropertyGenericClass;

#pragma mark - 在子类中实现以下方法
/**
 *  当 JSON 转为 Model 完成后，该方法会被调用,你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。你也可以在这里做一些自动转换不能完成的工作。
 *
 *  @param dic
 *
 *  @return YES/NO
 */
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic;

/**
 *  当 Model 转为 JSON 完成后，该方法会被调用。你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。 你也可以在这里做一些自动转换不能完成的工作
 *
 *  @param dic
 *
 *  @return
 */
//- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic;

/**
 *  如果实现了该方法，则处理过程中会忽略该列表内的所有属性
 *
 *  @return
 */
//+ (NSArray *)modelPropertyBlacklist;

/**
 *  如果实现了该方法，则处理过程中不会处理该列表外的属性
 *
 *  @return
 */
//+ (NSArray *)modelPropertyWhitelist;

@end

@interface NSObject (EMBaseModel)

/**
 *  将model转成json 字典
 *
 *  @return NSDictionary 或 NSArray类型
 */
- (NSMutableDictionary *)em_modelToJsonDictionary;

/**
 将model转成json 字符串

 @return NSString
 */
- (NSString *)em_modelToJsonString;

@end
