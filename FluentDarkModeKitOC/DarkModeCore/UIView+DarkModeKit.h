//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import <UIKit/UIKit.h>
#import "DMTraitCollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DarkModeKit) <DMTraitEnvironment>

- (void)dm_updateDynamicColors;
- (void)dm_updateDynamicImages;

+ (void)swizzleWillMoveToWindowOnce;

@end

NS_ASSUME_NONNULL_END
