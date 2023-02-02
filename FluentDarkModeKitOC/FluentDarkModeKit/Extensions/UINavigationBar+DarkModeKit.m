//
//  UINavigationBar+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UINavigationBar+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UINavigationBar (DarkModeKit)

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

