//
//  TBCityIconFont.m
//  iCoupon
//
//  Created by 李龙 on 2018/11/30.
//  Copyright © 2018 李龙. All rights reserved.
//

#import "TBCityIconFont.h"
#import <CoreText/CoreText.h>
#import "UIFont+IconFont.h"

@implementation TBCityIconFont

static NSString *_fontName;

+ (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

+ (UIFont *)fontWithSize:(CGFloat)size {
    UIFont *font = [UIFont iconFontOfSize:size];
    if (font == nil) {
        NSBundle *imageBundle = [NSBundle bundleForClass:NSClassFromString(@"TBCityIconFont")];
        NSURL *url1 = [imageBundle URLForResource:@"IconFontResource" withExtension:@"bundle"];
        imageBundle = [NSBundle bundleWithURL:url1];
        NSURL *fontFileUrl = [imageBundle URLForResource:[self fontName] withExtension:@"ttf"];
//        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:[self fontName] withExtension:@"ttf"];
        [self registerFontWithURL: fontFileUrl];
        font = [UIFont fontWithName:[self fontName] size:size];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }
    return font;
}

+ (void)setFontName:(NSString *)fontName {
    _fontName = fontName;
    
}


+ (NSString *)fontName {
    return _fontName ? : @"iconfont";
}

@end
