//
//  Whale.m
//  UrlDemo
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019年 com. All rights reserved.
//

#import "Whale.h"

@implementation Whale
- (instancetype)initWithLegs:(NSInteger)lages name:(NSString *)name{
    self = [self initWhale];
    if (self) {
        _numberOfLegs = lages;
        _aniname = name;
    }
    
    return self;

}
- (instancetype)initWhale{
    return [self initWhaleCanSwim:YES];
}
- (instancetype)initWhaleCanSwim:(BOOL)swim{
    self = [super initWithLegs:100 name:@"whale"];
    if (self) {
        _canSwim = swim;
    }
    
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"legs : %ld      name : %@   canSwim :%@", _numberOfLegs ,_aniname,_canSwim?@"YES":@"NO"];
}
@end
