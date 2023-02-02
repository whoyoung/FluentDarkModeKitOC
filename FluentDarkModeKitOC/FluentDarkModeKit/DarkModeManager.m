//
//  DarkModeManager.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import "DarkModeManager.h"
#import "UITextField+DarkModeKit.h"
#import "UILabel+DarkModeKit.h"
#import "UIImageView+DarkModeKit.h"
#import "UITabBarItem+DarkModeKit.h"

static BOOL swizzlingConfigured = NO;

@implementation DarkModeManager

+ (void)setupWithConfiguration:(DMEnvironmentConfiguration *)configuration {
    [DarkModeManager commonSetupWithConfiguration: configuration];
}

+ (void)commonSetupWithConfiguration:(DMEnvironmentConfiguration *)configuration {
    if (swizzlingConfigured) {
        return;
    }
    [DMTraitCollection setupEnvironmentWithConfiguration:configuration];
    
    if (@available(iOS 13.0, *)) {
    } else {
        [UIView swizzleWillMoveToWindowOnce];
        [UITextField swizzleTextFieldWillMoveToWindowOnce];
        [UILabel swizzleDidMoveToWindowOnce];
        
        [UIImageView swizzleSetImageOnce];
        [UIImageView swizzleInitImageOnce];
        [UITabBarItem swizzleSetImageOnce];
        [UITabBarItem swizzleSetSelectedImageOnce];
    }
    
    swizzlingConfigured = YES;
}

+ (void)registerWithApplication:(UIApplication *)application syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated {
    [DMTraitCollection registerWithApplication:application syncImmediately:syncImmediately animated:animated];
}

+ (void)registerWithViewController:(UIViewController *)viewController syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated {
    [DMTraitCollection registerWithViewController:viewController syncImmediately:syncImmediately animated:animated];
}

+ (NSString *)messageForSwizzlingFailedWithClass:(Class)cls selector:(SEL)Selector {
    return @"Method swizzling for theme failed! Class: \(cls), Selector: \(selector)";
}

+ (void)unregister {
    [DMTraitCollection unregister];
}

@end
