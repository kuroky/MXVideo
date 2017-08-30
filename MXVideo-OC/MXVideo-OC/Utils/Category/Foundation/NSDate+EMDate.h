//
//  NSDate+EMDate.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EMDate)

#pragma mark- NSDate相关组件属性
/**
 *  年
 */
@property (nonatomic, readonly) NSInteger em_year; ///< Year component
/**
 *  月
 */
@property (nonatomic, readonly) NSInteger em_month; ///< Month component (1~12)
/**
 *  日
 */
@property (nonatomic, readonly) NSInteger em_day; ///< Day component (1~31)
/**
 *  时
 */
@property (nonatomic, readonly) NSInteger em_hour; ///< Hour component (0~23)
/**
 *  分
 */
@property (nonatomic, readonly) NSInteger em_minute; ///< Minute component (0~59)
/**
 *  秒
 */
@property (nonatomic, readonly) NSInteger em_second; ///< Second component (0~59)
/**
 *  纳秒
 */
@property (nonatomic, readonly) NSInteger em_nanosecond; ///< Nanosecond component
/**
 *  星期
 */
@property (nonatomic, readonly) NSInteger em_weekday; ///< Weekday component (1~7, first day is based on user setting)

/**
 *  星期几
 */
@property (nonatomic, readonly) NSInteger em_weekdayOrdinal; ///< WeekdayOrdinal component
/**
 *  一个月中的第几个星期
 */
@property (nonatomic, readonly) NSInteger em_weekOfMonth; ///< WeekOfMonth component (1~5)
/**
 *  一年中的第几个星期
 */
@property (nonatomic, readonly) NSInteger em_weekOfYear; ///< WeekOfYear component (1~53)
/**
 *  在ISO接收机8601周编号的一年。
 */
@property (nonatomic, readonly) NSInteger em_yearForWeekOfYear; ///< YearForWeekOfYear component
/**
 *  季度
 */
@property (nonatomic, readonly) NSInteger em_quarter; ///< Quarter component
/**
 *  是否是闰月
 */
@property (nonatomic, readonly) BOOL em_isLeapMonth; ///< Weather the month is leap month
/**
 *  是否是闰月
 */
@property (nonatomic, readonly) BOOL em_isLeapYear; ///< Weather the year is leap year
/**
 *  是否是今天
 */
@property (nonatomic, readonly) BOOL em_isToday;
/**
 *  是否是昨天
 */
@property (nonatomic, readonly) BOOL em_isYesterday;

/**
 是否是明天
 */
@property (readonly, nonatomic) BOOL em_isTomorrow;

#pragma mark - Date modify

/**
 Returns a date representing the receiver date shifted later by the provided number of years.
 
 @param years  Number of years to add.
 @return Date modified by the number of desired years.
 */
- (nullable NSDate *)em_dateByAddingYears:(NSInteger)years;

/**
 Returns a date representing the receiver date shifted later by the provided number of months.
 
 @param months  Number of months to add.
 @return Date modified by the number of desired months.
 */
- (nullable NSDate *)em_dateByAddingMonths:(NSInteger)months;

/**
 Returns a date representing the receiver date shifted later by the provided number of weeks.
 
 @param weeks  Number of weeks to add.
 @return Date modified by the number of desired weeks.
 */
- (nullable NSDate *)em_dateByAddingWeeks:(NSInteger)weeks;

/**
 Returns a date representing the receiver date shifted later by the provided number of days.
 
 @param days  Number of days to add.
 @return Date modified by the number of desired days.
 */
- (nullable NSDate *)em_dateByAddingDays:(NSInteger)days;

/**
 Returns a date representing the receiver date shifted later by the provided number of hours.
 
 @param hours  Number of hours to add.
 @return Date modified by the number of desired hours.
 */
- (nullable NSDate *)em_dateByAddingHours:(NSInteger)hours;

/**
 Returns a date representing the receiver date shifted later by the provided number of minutes.
 
 @param minutes  Number of minutes to add.
 @return Date modified by the number of desired minutes.
 */
- (nullable NSDate *)em_dateByAddingMinutes:(NSInteger)minutes;

/**
 Returns a date representing the receiver date shifted later by the provided number of seconds.
 
 @param seconds  Number of seconds to add.
 @return Date modified by the number of desired seconds.
 */
- (nullable NSDate *)em_dateByAddingSeconds:(NSInteger)seconds;


#pragma mark - Date Format

/**
 *  返回一个format格式的String
 */
- (nullable NSString *)em_stringWithFormat:(nullable NSString *)format;

- (nullable NSDateFormatter *)em_dateFormatWithStr:(nullable NSString *)format;

/**
 *   用给定的日期字符串转换为给定的格式
 *
 *  @param dateString 日期字符串
 *  @param format     格式
 *
 *  @return 格式化之后的字符串
 */
+ (nullable NSDate *)em_dateWithString:(nullable NSString *)dateString
                                format:(nullable NSString *)format;

/**
 *  周一......
 */
- (nullable NSString *)em_dayOfWeek;

@end
