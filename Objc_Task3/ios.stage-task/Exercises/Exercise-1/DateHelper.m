#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSArray *monthList = [[NSArray alloc] initWithArray:@[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"]];
    
    if (monthNumber > 12 || monthNumber == 0) {
        return nil;
    }
    
    return monthList[monthNumber - 1];
    
//    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:dateFromString];
    
    return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    
    NSArray *weekDays = @[@"Пн", @"Вт", @"Ср", @"Чт", @"Пт", @"Сб", @"Вс"];
    
    NSLog(@" ---- %ld", (long)[components weekday]);
    
//    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"dd-MMM-yyyy" options:0 locale:[NSLocale currentLocale]];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = formatString;
    
//    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
//    NSString *todayString = [dateFormatter stringFromDate:date];
//    NSLog(@"todayString: %@", todayString);
    if ([components weekday]) {
        return weekDays[[components weekday] - 2];
    }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger todaysWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger dateWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    
    return dateWeek == todaysWeek ? YES : NO;
    
    
//    NSDateComponents *componentsDateStart = [[NSDateComponents alloc] init];
//    componentsDateStart.year = 2021;
//    componentsDateStart.month = 5;
//    componentsDateStart.day = 24;
    
//    NSDateComponents *componentsDateEnd = [[NSDateComponents alloc] init];
//    componentsDateEnd.year = 2021;
//    componentsDateEnd.month = 5;
//    componentsDateEnd.day = 30;
    
//    NSCalendar *cal = [NSCalendar currentCalendar];
    
//    NSDate *startDate = [cal dateFromComponents:componentsDateStart];
//    NSDate *endDate = [cal dateFromComponents:componentsDateEnd];
    
//    if ((startDate.timeIntervalSince1970 < date.timeIntervalSince1970) && (date.timeIntervalSince1970 < endDate.timeIntervalSince1970)) {
//        return YES;
//    }
    
    
//    return NO;
}

@end
