//
//  UITextField+DarkModeKit.h
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (DarkModeKit)

+ (void)swizzleTextFieldWillMoveToWindowOnce;

@end

NS_ASSUME_NONNULL_END