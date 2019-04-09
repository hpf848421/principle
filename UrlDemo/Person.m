//
//  Person.m
//  UrlDemo
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019年 com. All rights reserved.
//

#import "Person.h"
#import "BackUpMessage.h"
#import <objc/runtime.h>

@implementation Person

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"kvoSelf"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}
//-(void)setKvoSelf:(NSString *)kvoSelf{
//    [self willChangeValueForKey:NSStringFromSelector(@selector(kvoSelf))];
//    _kvoSelf=[kvoSelf copy];
//    [self didChangeValueForKey:NSStringFromSelector(@selector(kvoSelf))];
//}
+(instancetype)person{
    __autoreleasing Person *pe=[self alloc];
    return pe;
}
+ (BOOL)accessInstanceVariablesDirectly{
    return YES;
}

- (BOOL)validateValue:(inout id _Nullable * _Nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError{
    NSLog(@"%@",inKey);
    return YES;
}
//-(void)setNilValueForKey:(NSString *)key{
//    NSLog(@"%@",key);
//}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(void)eat{
    
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(eatwht)) {//如果是执行foo函数，就动态解析，指定新的IMP
//        class_addMethod([self class], sel, (IMP)eatwht, "");
//        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
void eatwht() {
    NSLog(@"Doing foo");//新的foo函数
}
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    //创建备用对象
    BackUpMessage * backUp = [BackUpMessage new];
    SEL sel = anInvocation.selector;
    //判断备用对象是否可以响应传递进来等待响应的SEL
    if ([backUp respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:backUp];
    }else{
        // 如果备用对象不能响应 则抛出异常
        [self doesNotRecognizeSelector:sel];
    }
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    if ([super methodSignatureForSelector:aSelector]==nil) {
//        NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
//        return sign;
//    }
    return [super methodSignatureForSelector:aSelector];
  
}
@end
