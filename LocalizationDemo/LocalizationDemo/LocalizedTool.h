//
//  LocalizedTool.h
//  LocalizationDemo
//
//  Created by efun on 2019/3/20.
//  Copyright © 2019年 Mingor. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    kChinese = 0,
    kEnglish,
} Language;


@interface LocalizedTool : NSObject

+ (NSBundle *)bundle;//获取当前资源文件

+ (void)initLanguage;//初始化语言文件

+ (Language)language;//获取应用当前语言

+ (void)setLanguage:(Language)language;//设置当前语言

@end
