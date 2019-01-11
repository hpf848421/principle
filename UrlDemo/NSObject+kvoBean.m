//
//  NSObject+kvoBean.m
//  UrlDemo
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019年 com. All rights reserved.
//

#import "NSObject+kvoBean.h"
#import <objc/runtime.h>
const void *myObserveInfo;
@interface NSObject ()
@property (nonatomic, strong) NSMutableDictionary *myObserveInfo;
@end
@implementation NSObject (kvoBean)
-(NSDictionary *)myObserveInfo{
    return objc_getAssociatedObject(self, myObserveInfo);
}
+(void)load{
    [self switchMethod];
}
+(void)switchMethod{
    SEL removeSel = @selector(removeObserver:forKeyPath:);
    SEL myRemoveSel = @selector(removeDasen:forKeyPath:);
    SEL addSel = @selector(addObserver:forKeyPath:options:context:);
    SEL myaddSel = @selector(addDasen:forKeyPath:options:context:);
        SEL mydealloc = @selector(swizzledealloc);
    SEL deallocSel = NSSelectorFromString(@"dealloc");
    // excute once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originRemove=class_getInstanceMethod([self class], removeSel);
        Method myRemove=class_getInstanceMethod([self class], myRemoveSel);
        method_exchangeImplementations(originRemove, myRemove);
        
        Method originAdd=class_getInstanceMethod([self class], addSel);
        Method myAdd=class_getInstanceMethod([self class], myaddSel);
        method_exchangeImplementations(originAdd, myAdd);
        
        Method originDealloc=class_getInstanceMethod([self class], deallocSel);
        Method myDealloc=class_getInstanceMethod([self class], mydealloc);
        method_exchangeImplementations(originDealloc, myDealloc);
        
    });
    
}

- (void)removeDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    [self removeDasen:observer forKeyPath:keyPath];
}
- (void)addDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    if (!self.myObserveInfo) {
        
        objc_setAssociatedObject(self, myObserveInfo, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self.myObserveInfo setValue:observer forKey:keyPath];
//    [self.myObserveInfo setObject:observer forKey:keyPath];
    [self addDasen:observer forKeyPath:keyPath options:options context:context];
}
-(void)swizzledealloc{
    
    for (NSString *kvoKey in self.myObserveInfo) {
        NSObject *kvoObj=self.myObserveInfo[kvoKey];
        [self removeDasen:kvoObj forKeyPath:kvoKey];
    }
    
    [self swizzledealloc];
}
@end
