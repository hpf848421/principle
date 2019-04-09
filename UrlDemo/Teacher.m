//
//  Teacher.m
//  UrlDemo
//
//  Created by apple on 2019/2/18.
//  Copyright © 2019年 com. All rights reserved.
//

#import "Teacher.h"

@interface Teacher ()
@property (nonatomic, copy,getter=getAddress) NSString *address;
@end

@implementation Teacher
@synthesize address = _address;
-(NSString *)getAddress{
    return _address;
}
- (void)setAddress:(NSString *)address{
    [self willChangeValueForKey:@"address"];
    _address = address;
    [self didChangeValueForKey:@"address"];
}
@end
