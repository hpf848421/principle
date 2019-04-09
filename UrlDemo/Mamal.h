//
//  Mamal.h
//  UrlDemo
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019年 com. All rights reserved.
//


#import "Animal.h"
NS_ASSUME_NONNULL_BEGIN

@interface Mamal : Animal
{
    @public
    NSInteger _numberOfLegs;
}
-(instancetype)initWithLegs:(NSInteger)lages name:(NSString *)name NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithLegs:(NSInteger)lages;
@end

NS_ASSUME_NONNULL_END
