//
//  LocalizedTool.m
//  LocalizationDemo
//
//  Created by efun on 2019/3/20.
//  Copyright © 2019年 Mingor. All rights reserved.
//

#import "LocalizedTool.h"

@implementation LocalizedTool

static NSBundle *bundle = nil;
+ (NSBundle *)bundle {
    return bundle;
}

//首次加载时检测语言是否存在
+ (void)initLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage = [def valueForKey:@"LocalLanguageKey"];
    if (!currLanguage) {
        NSArray *preferredLanguages = [NSLocale preferredLanguages];
        currLanguage = preferredLanguages[0];
        if ([currLanguage hasPrefix:@"en"]) {
            currLanguage = @"en";
        } else {
            currLanguage = @"zh-Hans";
        }
        [def setValue:currLanguage forKey:@"LocalLanguageKey"];
        [def synchronize];
    }
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:currLanguage ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}

//获取当前语言
+ (Language)language {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:@"LocalLanguageKey"];
    if ([language isEqualToString:@"en"]) {
        return kEnglish;
    }
    return kChinese;
}

//设置语言
+ (void)setLanguage:(Language)language {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage = [userDefaults valueForKey:@"LocalLanguageKey"];
    
    NSString *languageStr = language == kChinese ? @"zh-Hans" : @"en";
    if ([currLanguage isEqualToString:languageStr]) {
        return;
    }
    [userDefaults setValue:languageStr forKey:@"LocalLanguageKey"];
    [userDefaults synchronize];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:languageStr ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

@end
