//
//  UITextField+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UITextField+DarkModeKit.h"
#import "DarkModeCore.h"
#import "NSObject+DMSwizzling.h"

@implementation UITextField (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if (self.textColor && [self.textColor isKindOfClass:[DMDynamicColor class]]) {
        self.textColor = [self.textColor copy];
    }
    if ([DMTraitCollection overrideTraitCollection].userInterfaceStyle == DMUserInterfaceStyleDark) {
        self.keyboardAppearance = UIKeyboardAppearanceDark;
    } else {
        self.keyboardAppearance = UIKeyboardAppearanceDefault;
    }
}

+ (void)swizzleTextFieldWillMoveToWindowOnce {
    [UITextField dm_exchangeInstanceMethodWithSelfClass:[self class] originalSelector:@selector(willMoveToWindow:) swizzledSelector:@selector(dm_willMoveToWindow:)];
}

- (void)dm_willMoveToWindow:(UIWindow *)newWindow {
    [self dm_willMoveToWindow:newWindow];
    [self dmTraitCollectionDidChange:nil];
}

@end
