//
//  UIButton+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UIButton+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UIButton (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    [self dm_updateDynamicColors];
    
    NSArray<NSNumber *> *states = @[@(UIControlStateNormal), @(UIControlStateHighlighted), @(UIControlStateDisabled), @(UIControlStateSelected), @(UIControlStateFocused)];
    [states enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIColor *color = [self titleColorForState:obj.integerValue];
        if ([color isKindOfClass:[DMDynamicColor class]]) {
            [self setTitleColor:[color copy] forState:obj.integerValue];
        }
    }];
}

@end
