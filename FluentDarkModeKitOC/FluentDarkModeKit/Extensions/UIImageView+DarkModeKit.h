//
//  UIImageView+DarkModeKit.h
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DarkModeKit)

@property (nonatomic, strong, nullable) UIImage *dm_dynamicImage;

+ (void)swizzleSetImageOnce;

+ (void)swizzleInitImageOnce;

@end

NS_ASSUME_NONNULL_END
