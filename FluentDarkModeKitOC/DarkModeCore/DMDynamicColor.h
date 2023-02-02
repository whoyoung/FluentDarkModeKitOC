//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import <UIKit/UIKit.h>
#import "DMTraitCollection.h"

NS_ASSUME_NONNULL_BEGIN
@interface DMDynamicColor : UIColor

@property (nonatomic, readonly) UIColor *lightColor;
@property (nonatomic, readonly) UIColor *darkColor;

+ (UIColor *)colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;
+ (UIColor *)colorWithDynamicProvider:(UIColor * (^)(DMTraitCollection *traitCollection))dynamicProvider;

@end

NS_ASSUME_NONNULL_END
