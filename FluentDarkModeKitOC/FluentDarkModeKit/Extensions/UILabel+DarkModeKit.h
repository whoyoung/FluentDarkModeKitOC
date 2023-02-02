//
//  UILabel+DarkModeKit.h
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import <UIKit/UIKit.h>
#import "DarkModeCore.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DarkModeKit)

@property (nonatomic, assign) DMUserInterfaceStyle currentUserInterfaceStyle;

+ (void)swizzleDidMoveToWindowOnce;

@end

NS_ASSUME_NONNULL_END
