//
//  UITextView+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UITextView+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UITextView (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if ([DMTraitCollection overrideTraitCollection].userInterfaceStyle == DMUserInterfaceStyleDark) {
        self.keyboardAppearance = UIKeyboardAppearanceDark;
    } else {
        self.keyboardAppearance = UIKeyboardAppearanceDefault;
    }
}

@end
