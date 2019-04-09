//
//  ViewAnimationInterTransition.h
//  UrlDemo
//
//  Created by apple on 2019/4/9.
//  Copyright © 2019 com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewAnimationInterTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, copy) dispatch_block_t eventBlock;
- (instancetype)initWithView:(UIView *)gestureView;
@end

NS_ASSUME_NONNULL_END
