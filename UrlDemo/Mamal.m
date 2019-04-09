//
//  Mamal.m
//  UrlDemo
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019年 com. All rights reserved.
//

#import "Mamal.h"

@implementation Mamal
- (instancetype)initWithName:(NSString *)name{
    self=[self initWithLegs:100 name:name];
    if (self) {
        _aniname = name;
        
    }
    return self;

}

-(instancetype)initWithLegs:(NSInteger)lages name:(NSString *)name{
    self=[super initWithName:name];
    if (self) {
        _numberOfLegs = lages;
    }
    return self;
}
-(instancetype)initWithLegs:(NSInteger)lages{
    self=[self initWithName:@"mamal"];
    if (self) {
        _numberOfLegs = lages;

    }
    return self;
    
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"legs : %ld      name : %@", _numberOfLegs ,_aniname];
}
@end
