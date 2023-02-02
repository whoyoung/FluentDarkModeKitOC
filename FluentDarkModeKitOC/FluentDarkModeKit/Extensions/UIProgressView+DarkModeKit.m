//
//  UIProgressView+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UIProgressView+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UIProgressView (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if (self.progressTintColor && [self.progressTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.progressTintColor = [self.progressTintColor copy];
    }
    if (self.trackTintColor && [self.trackTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.trackTintColor = [self.trackTintColor copy];
    }
}

@end
