//
//  UILabel+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import "UILabel+DarkModeKit.h"
#import "NSObject+DMSwizzling.h"
#import <objc/runtime.h>

static void *currentThemeKey = &currentThemeKey;

@implementation UILabel (DarkModeKit)

+ (void)swizzleDidMoveToWindowOnce {
    [UILabel exchangeInstanceMethodWithSelfClass:[self class] originalSelector:@selector(didMoveToWindow:) swizzledSelector:@selector(dm_didMoveToWindow:)];
}

- (void)dm_didMoveToWindow {
    if (self.currentUserInterfaceStyle != [DMTraitCollection overrideTraitCollection].userInterfaceStyle) {
        self.currentUserInterfaceStyle = [DMTraitCollection overrideTraitCollection].userInterfaceStyle;
        [self dmTraitCollectionDidChange:nil];
    }
}

- (DMUserInterfaceStyle)currentUserInterfaceStyle {
    return [objc_getAssociatedObject(self, &currentThemeKey) integerValue];
}

- (void)setCurrentUserInterfaceStyle:(DMUserInterfaceStyle)currentUserInterfaceStyle {
    objc_setAssociatedObject(self, &currentThemeKey, @(currentUserInterfaceStyle), OBJC_ASSOCIATION_ASSIGN);
}

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 12.0, *)) {
        return;
    }
    // Fix for iOS 11.x
    [self updateDynamicColorInAttributedText];
}

- (void)updateDynamicColorInAttributedText {
    if (self.attributedText == nil) {
        return;
    }

  // Why are we doing this?
  //
  // 1. In iOS 11, setNeedsDisplay() is not work well
  // 2. If you set UILabel.attributedText, UILabel.textColor will be foreground color at index 0 of the attributed text
  // 3. If you set UILabel.textColor, the entire attributed text will get a foreground color
  // 4. So if a label has a two or more colors attributed string, we can not simply reset text color
  // 5. The final solution is in below, we just update attributed text
  // 6. Luckliy we only need to do this in iOS 11.

    NSMutableAttributedString *updatedAttributedText = nil;
    NSRange totalRange = NSMakeRange(0, self.attributedText.length);
    NSRange range = NSMakeRange(0, 0);
    while (range.location + range.length < self.attributedText.length) {
        NSUInteger index = range.location + range.length;
        // Don't panic, this call just make range an inout parameter.
        id attribute = [self.attributedText attribute:NSForegroundColorAttributeName atIndex:index longestEffectiveRange:&range inRange:totalRange];
//        let attribute = withUnsafeMutablePointer(to: &range) {
//          attributedText.attribute(.foregroundColor, at: index, effectiveRange: $0)
//        }
        
        if (updatedAttributedText == nil) {
            updatedAttributedText = [[NSMutableAttributedString alloc] initWithAttributedString:updatedAttributedText];
        }
        if ([attribute isKindOfClass:DMDynamicColor.class]) {
            DMDynamicColor *color = (DMDynamicColor *)attribute;
            [updatedAttributedText addAttribute:NSForegroundColorAttributeName value:[color copy] range:range];
        } else if ([self.textColor isKindOfClass:DMDynamicColor.class]) {
            DMDynamicColor *color = (DMDynamicColor *)(self.textColor);
            [updatedAttributedText addAttribute:NSForegroundColorAttributeName value:[color copy] range:range];
        }
    }
    if (updatedAttributedText) {
        self.attributedText = updatedAttributedText;
    }
}

@end
