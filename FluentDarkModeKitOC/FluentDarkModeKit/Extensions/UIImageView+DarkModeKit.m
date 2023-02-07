//
//  UIImageView+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import "UIImageView+DarkModeKit.h"
#import <objc/runtime.h>
#import "DarkModeManager.h"
#import "NSObject+DMSwizzling.h"

static void *dynamicImageKey = &dynamicImageKey;

@implementation UIImageView (DarkModeKit)

- (void)setDm_dynamicImage:(nullable UIImage *)dm_dynamicImage {
    objc_setAssociatedObject(self, &dynamicImageKey, dm_dynamicImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)dm_dynamicImage {
    return objc_getAssociatedObject(self, &dynamicImageKey);
}

+ (void)swizzleSetImageOnce {
    [UIImageView dm_exchangeInstanceMethodWithSelfClass:[self class] originalSelector:@selector(setImage:) swizzledSelector:@selector(dm_setImage:)];
}

- (void)dm_setImage:(UIImage *)image {
    if ([image isKindOfClass:[DMDynamicImageProxy class]]) {
        self.dm_dynamicImage = image;
    } else {
        self.dm_dynamicImage = nil;
    }
    [self dm_setImage:image];
}

+ (void)swizzleInitImageOnce {
    [UIImageView dm_exchangeInstanceMethodWithSelfClass:[self class] originalSelector:@selector(initWithImage:) swizzledSelector:@selector(dm_initWithImage:)];
}

- (UIImageView *)dm_initWithImage:(UIImage *)image {
    if ([image isKindOfClass:[DMDynamicImageProxy class]]) {
        self.dm_dynamicImage = image;
    }
    return [self dm_initWithImage:image];
}

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    if (self.dm_dynamicImage) {
        self.image = self.dm_dynamicImage;
    }
}

@end
