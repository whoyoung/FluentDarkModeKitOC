//
//  UITabBarItem+DarkModeKit.h
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (DarkModeKit)

@property (nonatomic, strong, nullable) UIImage *dm_dynamicImage;

@property (nonatomic, strong, nullable) UIImage *dm_dynamicSelectedImage;

- (void)updateDynamicImages;

+ (void)swizzleSetImageOnce;

+ (void)swizzleSetSelectedImageOnce;

@end

NS_ASSUME_NONNULL_END
