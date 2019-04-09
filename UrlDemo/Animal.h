//
//  Animal.h
//  
//
//  Created by apple on 2019/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject
{

    NSString *_aniname;
}
 - (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
