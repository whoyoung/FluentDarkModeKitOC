//
//  UISlider+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UISlider+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UISlider (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if (self.minimumTrackTintColor && [self.minimumTrackTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.minimumTrackTintColor = [self.minimumTrackTintColor copy];
    }
    if (self.maximumTrackTintColor && [self.maximumTrackTintColor isKindOfClass:[DMDynamicColor class]]) {
        self.maximumTrackTintColor = [self.maximumTrackTintColor copy];
    }
}

@end

