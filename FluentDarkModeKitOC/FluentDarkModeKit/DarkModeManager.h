//
//  DarkModeManager.h
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/1.
//

#import <Foundation/Foundation.h>
#import "DarkModeCore.h"

NS_ASSUME_NONNULL_BEGIN

@interface DarkModeManager : NSObject

+ (void)setupWithConfiguration:(DMEnvironmentConfiguration *)configuration;

+ (NSString *)messageForSwizzlingFailedWithClass:(Class)cls selector:(SEL)Selector;

+ (void)registerWithApplication:(UIApplication *)application syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
