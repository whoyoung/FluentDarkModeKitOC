//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import <UIKit/UIKit.h>
#import "DMNamespace.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DarkModeKit)

+ (UIImage *)dm_imageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage;

@end

NS_ASSUME_NONNULL_END
