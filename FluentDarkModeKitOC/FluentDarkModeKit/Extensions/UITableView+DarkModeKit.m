//
//  UITableView+DarkModeKit.m
//  FluentDarkModeKitOC
//
//  Created by 杨虎 on 2023/2/2.
//

#import "UITableView+DarkModeKit.h"
#import "DarkModeCore.h"

@implementation UITableView (DarkModeKit)

- (void)dmTraitCollectionDidChange:(DMTraitCollection *)previousTraitCollection {
    [super dmTraitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        return;
    }
    
    [self dm_updateDynamicColors];
    if (self.sectionIndexColor && [self.sectionIndexColor isKindOfClass:[DMDynamicColor class]]) {
        self.sectionIndexColor = [self.sectionIndexColor copy];
    }
    if (self.separatorColor && [self.separatorColor isKindOfClass:[DMDynamicColor class]]) {
        self.separatorColor = [self.separatorColor copy];
    }
}

@end
