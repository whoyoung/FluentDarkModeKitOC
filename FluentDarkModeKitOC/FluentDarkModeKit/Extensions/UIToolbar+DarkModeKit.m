//
//  UIToolbar+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UIToolbar+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UIToolbar (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if (self.barTintColor && [self.barTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.barTintColor = [self.barTintColor copy];
    }
}

@end
