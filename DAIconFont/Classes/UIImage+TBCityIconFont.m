//
//  UIImage+TBCityIconFont.m
//  iCoupon
//
//  Created by 李龙 on 2018/11/30.
//  Copyright © 2018 李龙. All rights reserved.
//
#import "UIImage+TBCityIconFont.h"
#import "TBCityIconFont.h"
#import <CoreText/CoreText.h>
#import "UIFont+IconFont.h"

@implementation UIImage (TBCityIconFont)

+ (UIImage *)iconWithInfo:(TBCityIconInfo *)info {
    CGFloat size = info.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    NSDictionary *textDic = @{NSFontAttributeName : [UIFont iconFontOfSize:realSize]};
    CGRect rect = [info.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:textDic context:nil];
    CGSize size1 = rect.size;
    UIFont *font = [TBCityIconFont fontWithSize:realSize];
    UIGraphicsBeginImageContext(size1);
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    if ([info.text respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [info.text drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: info.color}];
    } else {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, info.color.CGColor);
        [info.text drawAtPoint:CGPointMake(0, 0) withFont:font];
#pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}

@end
