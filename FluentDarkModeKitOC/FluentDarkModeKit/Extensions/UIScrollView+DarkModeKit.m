//
//  UIScrollView+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UIScrollView+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UIScrollView (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if ([DMTraitCollection overrideTraitCollection].userInterfaceStyle == DMUserInterfaceStyleDark) {
        self.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    } else {
        self.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    }
}

@end
