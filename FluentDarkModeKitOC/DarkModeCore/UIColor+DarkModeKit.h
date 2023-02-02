//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import <UIKit/UIKit.h>
#import "DMNamespace.h"
#import "DMTraitCollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DarkModeKit)

+ (UIColor *)dm_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;
+ (UIColor *)dm_colorWithDynamicProvider:(UIColor * (^)(DMTraitCollection *traitCollection))dynamicProvider;
- (UIColor *)dm_resolvedColorWithTraitCollection:(DMTraitCollection *)traitCollection;

@end

NS_ASSUME_NONNULL_END
