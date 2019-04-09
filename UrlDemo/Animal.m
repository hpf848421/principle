//
//  Animal.m
//  
//
//  Created by apple on 2019/3/14.
//

#import "Animal.h"

@implementation Animal
- (instancetype)init
{
    return [self initWithName:@"animal"];
}
 - (instancetype)initWithName:(NSString *)name {
     self = [super init];
     if (self) {
         _aniname = name;
     }
     return self;
 }
@end
