//
//  ViewController.m
//  LocalizationDemo
//
//  Created by efun on 2019/3/20.
//  Copyright © 2019年 Mingor. All rights reserved.
//

#import "ViewController.h"
#import "LocalizedTool.h"

// 多语言
#define LocalizedStringWithKey(key) NSLocalizedStringFromTableInBundle(key, @"LocalizationTest", [LocalizedTool bundle], nil)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *languageLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.languageLab.text = [LocalizedTool language] == kChinese ? @"中文" : @"英文";
    self.titleLab.text = LocalizedStringWithKey(@"Title");
}

// 切换语言
- (IBAction)onSwitch:(UISwitch *)sender {
    if ([LocalizedTool language] == kChinese) {
        [LocalizedTool setLanguage:kEnglish];
    } else {
        [LocalizedTool setLanguage:kChinese];
    }
    self.languageLab.text = [LocalizedTool language] == kChinese ? @"中文" : @"英文";
    self.titleLab.text = LocalizedStringWithKey(@"Title");
}


@end
