//
//  ViewController.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import "ViewController.h"
#import "UIColor+DarkModeKit.h"
#import "UILabel+DarkModeKit.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor dm_colorWithLightColor:[UIColor redColor] darkColor:[UIColor grayColor]];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"blue_white orange_yellow"
                                                                  attributes:@{
        NSForegroundColorAttributeName: [UIColor dm_colorWithLightColor:[UIColor blueColor] darkColor:[UIColor whiteColor]]}
    ];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor dm_colorWithLightColor:[UIColor orangeColor] darkColor:[UIColor yellowColor]] range:NSMakeRange(11, 13)];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 30)];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    self.label.attributedText = attrStr;
}


@end
