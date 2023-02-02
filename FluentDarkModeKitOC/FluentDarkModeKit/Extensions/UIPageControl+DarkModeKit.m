//
//  UIPageControl+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UIPageControl+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UIPageControl (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    [self dm_updateDynamicColors];
    
    if (self.pageIndicatorTintColor && [self.pageIndicatorTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.pageIndicatorTintColor = [self.pageIndicatorTintColor copy];
    }
    if (self.currentPageIndicatorTintColor && [self.currentPageIndicatorTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.currentPageIndicatorTintColor = [self.currentPageIndicatorTintColor copy];
    }
}

@end
