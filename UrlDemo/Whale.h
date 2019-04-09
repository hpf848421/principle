//
//  Whale.h
//  UrlDemo
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mamal.h"
NS_ASSUME_NONNULL_BEGIN

@interface Whale : Mamal
{
     BOOL    _canSwim;
}
- (instancetype)initWhale;
- (instancetype)initWhaleCanSwim:(BOOL)swim NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
