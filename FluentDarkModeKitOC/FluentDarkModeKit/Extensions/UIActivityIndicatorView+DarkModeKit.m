//
//  UIActivityIndicatorView+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UIActivityIndicatorView+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UIActivityIndicatorView (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    // Re-set the color with the copy of original color
    // to ensure the activity indicator image is re-generated
    if (self.color && [self.color isKindOfClass:[UIColor class]]) {
        self.color = [self.color copy];
    }
}

@end
