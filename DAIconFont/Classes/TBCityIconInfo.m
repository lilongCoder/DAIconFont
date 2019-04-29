//
//  TBCityFontImageInfo.m
//  iCoupon
//
//  Created by 李龙 on 2018/11/30.
//  Copyright © 2018 李龙. All rights reserved.
//

#import "TBCityIconInfo.h"

@implementation TBCityIconInfo

- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    if (self = [super init]) {
        self.text = text;
        self.size = size;
        self.color = color;
    }
    return self;
}

+ (instancetype)iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    return [[TBCityIconInfo alloc] initWithText:text size:size color:color];
}

@end
