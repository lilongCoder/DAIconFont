//
//  UIFont+IconFont.m
//  IconFont_Example
//
//  Created by 李龙 on 2019/4/29.
//  Copyright © 2019 leehonn. All rights reserved.
//

#import "UIFont+IconFont.h"
#import <CoreText/CTFontManager.h>

@implementation UIFont (IconFont)

+ (UIFont *)iconFontOfSize:(CGFloat)size
{
    NSString *fontName = @"iconfont";
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:fontName];
        font = [UIFont fontWithName:fontName size:size];
        if (!font) font = [UIFont systemFontOfSize:size];
    }
    return font;
}
+ (void)dynamicallyLoadFontNamed:(NSString *)name
{
    NSString *fontfileName = @"iconfont.ttf";
    NSBundle *imageBundle = [NSBundle bundleForClass:NSClassFromString(@"TBCityIconFont")];
    NSURL *url1 = [imageBundle URLForResource:@"IconFontResource" withExtension:@"bundle"];
    imageBundle = [NSBundle bundleWithURL:url1];
    NSString *resourcePath = [imageBundle pathForResource:fontfileName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    NSData *fontData = [NSData dataWithContentsOfURL:url];
    if (fontData) {
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
        CGFontRef font = CGFontCreateWithDataProvider(provider);
        if (!CTFontManagerRegisterGraphicsFont(font, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(font);
        CFRelease(provider);
    }
}

@end
