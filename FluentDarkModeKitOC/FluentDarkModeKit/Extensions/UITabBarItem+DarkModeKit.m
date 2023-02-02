//
//  UITabBarItem+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UITabBarItem+DarkModeKit.h"
#import <objc/runtime.h>
#import "NSObject+DMSwizzling.h"
#import "DarkModeCore.h"

static void *UIImageKey = &UIImageKey;
static void *dynamicSelectedImageKey = &dynamicSelectedImageKey;

@implementation UITabBarItem (DarkModeKit)

- (void)updateDynamicImages {
    if (self.dm_dynamicImage) {
        self.image = self.dm_dynamicImage;
    }
    if (self.dm_dynamicSelectedImage) {
        self.selectedImage = self.dm_dynamicSelectedImage;
    }
}

- (UIImage *)dm_dynamicImage {
    return objc_getAssociatedObject(self, &UIImageKey);
}

- (void)setDm_dynamicImage:(UIImage *)dm_dynamicImage {
    objc_setAssociatedObject(self, &UIImageKey, dm_dynamicImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)dm_dynamicSelectedImage {
    return objc_getAssociatedObject(self, &dynamicSelectedImageKey);
}

- (void)setDm_dynamicSelectedImage:(UIImage *)dm_dynamicSelectedImage {
    objc_setAssociatedObject(self, &dynamicSelectedImageKey, dm_dynamicSelectedImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)swizzleSetImageOnce {
    [UITabBarItem exchangeInstanceMethodWithSelfClass:[self class] originalSelector:@selector(setImage:) swizzledSelector:@selector(dm_setImage:)];
}

- (void)dm_setImage:(UIImage *)image {
    if ([image isKindOfClass:[DMDynamicImageProxy class]]) {
        self.dm_dynamicImage = image;
    } else {
        self.dm_dynamicImage = nil;
    }
    [self dm_setImage:image];
}

+ (void)swizzleSetSelectedImageOnce {
    [UITabBarItem exchangeInstanceMethodWithSelfClass:[self class] originalSelector:@selector(setSelectedImage:) swizzledSelector:@selector(dm_setSelectedImage:)];
}

- (void)dm_setSelectedImage:(UIImage *)selectedImage {
    if ([selectedImage isKindOfClass:[DMDynamicImageProxy class]]) {
        self.dm_dynamicSelectedImage = selectedImage;
    } else {
        self.dm_dynamicSelectedImage = nil;
    }
    [self dm_setSelectedImage:selectedImage];
}

@end
