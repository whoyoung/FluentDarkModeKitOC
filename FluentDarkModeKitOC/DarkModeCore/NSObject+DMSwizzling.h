//
//  NSObject+DMSwizzling.h
//
//
//  Created by lujh on 2018/4/18.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DMSwizzling)
+ (void)dm_exchangeInstanceMethodWithSelfClass:(Class)selfClass
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector;
@end
