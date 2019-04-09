//
//  ViewAnimationTransition.h
//  UrlDemo
//
//  Created by apple on 2019/4/8.
//  Copyright © 2019 com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewAnimationTransition : NSObject<UIViewControllerAnimatedTransitioning>
-(instancetype)initWithType:(UINavigationControllerOperation)operationType;
@end

NS_ASSUME_NONNULL_END
