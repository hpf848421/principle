//
//  Person.h
//  UrlDemo
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic, assign) NSInteger age1;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *kvoSelf; //手动监听
@property (nonatomic, copy) NSString *categaryProperty; //手动监听
@property (nonatomic, copy,readonly,getter=getAddress) NSString *address;
+(instancetype)person;
-(void)eat;

@end

NS_ASSUME_NONNULL_END
