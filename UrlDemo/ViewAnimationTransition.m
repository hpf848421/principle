//
//  ViewAnimationTransition.m
//  UrlDemo
//
//  Created by apple on 2019/4/8.
//  Copyright © 2019 com. All rights reserved.
//

#import "ViewAnimationTransition.h"
@interface ViewAnimationTransition()<CAAnimationDelegate>
@property (nonatomic, assign) UINavigationControllerOperation operationType;
@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic,strong) UIView *fromView;
@property (nonatomic,strong) UIView *toView;
@property (nonatomic, weak) UILabel *wenziLAbel;
@end
@implementation ViewAnimationTransition
-(instancetype)initWithType:(UINavigationControllerOperation)operationType{
    if (self = [super init]) {
        _operationType = operationType;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2.0f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (self.operationType == UINavigationControllerOperationPush) {
        //获取目标动画的VC
        UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView *containerView = [transitionContext containerView];
        
        UIView *fromView = fromVc.view;
        UIView *toView = toVc.view;
        
        //截图
        UIView *toView_snapView = [toView snapshotViewAfterScreenUpdates:YES];
        
        CGRect left_frame = CGRectMake(0, 0, CGRectGetWidth(fromView.frame) / 2.0, CGRectGetHeight(fromView.frame));
        CGRect right_frame = CGRectMake(CGRectGetWidth(fromView.frame) / 2.0, 0, CGRectGetWidth(fromView.frame) / 2.0, CGRectGetHeight(fromView.frame));
        UIView *from_left_snapView = [fromView resizableSnapshotViewFromRect:left_frame
                                                          afterScreenUpdates:NO
                                                               withCapInsets:UIEdgeInsetsZero];
        
        UIView *from_right_snapView = [fromView resizableSnapshotViewFromRect:right_frame
                                                           afterScreenUpdates:NO
                                                                withCapInsets:UIEdgeInsetsZero];
        
        toView_snapView.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1);
        from_left_snapView.frame = left_frame;
        from_right_snapView.frame = right_frame;
        
        //将截图添加到 containerView 上
        [containerView addSubview:toView_snapView];
        [containerView addSubview:from_left_snapView];
        [containerView addSubview:from_right_snapView];
        
        fromView.hidden = YES;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            //左移
            from_left_snapView.frame = CGRectOffset(from_left_snapView.frame, -from_left_snapView.frame.size.width, 0);
            //右移
            from_right_snapView.frame = CGRectOffset(from_right_snapView.frame, from_right_snapView.frame.size.width, 0);
            
            toView_snapView.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            fromView.hidden = NO;
            
            [from_left_snapView removeFromSuperview];
            [from_right_snapView removeFromSuperview];
            [toView_snapView removeFromSuperview];
            
            if ([transitionContext transitionWasCancelled]) {
                [containerView addSubview:fromView];
            } else {
                [containerView addSubview:toView];
            }
            NSLog(@"转场动画结束");
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    if (self.operationType == UINavigationControllerOperationPop) {
        //获取目标动画的VC
        UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView *containerView = [transitionContext containerView];
        
        UIView *fromView = fromVc.view;
        UIView *toView = toVc.view;
        
        //截图
        UIView *toView_snapView = [toView snapshotViewAfterScreenUpdates:YES];
        
        CGRect left_frame = CGRectMake(0, 0, CGRectGetWidth(fromView.frame) / 2.0, CGRectGetHeight(fromView.frame));
        CGRect right_frame = CGRectMake(CGRectGetWidth(fromView.frame) / 2.0, 0, CGRectGetWidth(fromView.frame) / 2.0, CGRectGetHeight(fromView.frame));
        UIView *from_left_snapView = [fromView resizableSnapshotViewFromRect:left_frame
                                                          afterScreenUpdates:NO
                                                               withCapInsets:UIEdgeInsetsZero];
        
        UIView *from_right_snapView = [fromView resizableSnapshotViewFromRect:right_frame
                                                           afterScreenUpdates:NO
                                                                withCapInsets:UIEdgeInsetsZero];
        
        toView_snapView.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1);
        from_left_snapView.frame = left_frame;
        from_right_snapView.frame = right_frame;
        
        //将截图添加到 containerView 上
        [containerView addSubview:toView_snapView];
        [containerView addSubview:from_left_snapView];
        [containerView addSubview:from_right_snapView];
        
        fromView.hidden = YES;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            //左移
            from_left_snapView.frame = CGRectOffset(from_left_snapView.frame, -from_left_snapView.frame.size.width, 0);
            //右移
            from_right_snapView.frame = CGRectOffset(from_right_snapView.frame, from_right_snapView.frame.size.width, 0);
            
            toView_snapView.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            fromView.hidden = NO;
            
            [from_left_snapView removeFromSuperview];
            [from_right_snapView removeFromSuperview];
            [toView_snapView removeFromSuperview];
            
            if ([transitionContext transitionWasCancelled]) {
                [containerView addSubview:fromView];
            } else {
                [containerView addSubview:toView];
            }
            NSLog(@"转场动画结束");
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    //    UIView *contain=transitionContext.containerView;
    //    UIViewController *toviewController=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //    UIViewController *fromviewController=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //    _transitionContext=transitionContext;
    //    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
    //        _fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //        _toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //    }else{
    //        _fromView = fromviewController.view;
    //        _toView = toviewController.view;
    //    }
    //
    //    CGRect fromRect=[transitionContext initialFrameForViewController:fromviewController];
    //    CGRect fromFinRect=[transitionContext finalFrameForViewController:fromviewController];
    ////    toviewController.view.backgroundColor=[UIColor grayColor];
    //
    //    [contain addSubview:toviewController.view];
    //    if (self.operationType == UINavigationControllerOperationPush) {
    //        UILabel *wenziLAbel = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 200, 300)];
    //        wenziLAbel.text=@"我是过渡文字";
    //        [contain insertSubview:wenziLAbel belowSubview:_toView];
    //        _wenziLAbel=wenziLAbel;
    //        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    //        animation.duration = [self transitionDuration:transitionContext];
    //        animation.fromValue = @([UIScreen mainScreen].bounds.size.width*1.5);
    //        animation.toValue =@([UIScreen mainScreen].bounds.size.width*0.5);
    //        animation.delegate = self;
    //        animation.beginTime=CACurrentMediaTime();
    //        animation.removedOnCompletion=NO;
    //        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    //        animation.fillMode = kCAFillModeForwards;
    //        [_toView.layer addAnimation:animation forKey:@"push"];
    //    }
    //    if (self.operationType == UINavigationControllerOperationPop) {
    //        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    //        animation.duration = [self transitionDuration:transitionContext];
    //        animation.fromValue = @(1);
    //        animation.toValue = @(0);
    //        animation.delegate = self;
    //        [_fromView.layer addAnimation:animation forKey:@"pop"];
    //    }
    //
}

//- (void)animationDidStart:(CAAnimation *)anim{
//
//}
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"转场动画结束");
//    [_wenziLAbel removeFromSuperview];
//    if (self.operationType == UINavigationControllerOperationPush) {
//
//        [_transitionContext completeTransition:!_transitionContext.transitionWasCancelled];
//        [_toView.layer removeAnimationForKey:@"push"];
//    }else if (_operationType == UINavigationControllerOperationPop){
//   [_toView.layer removeAnimationForKey:@"pop"];
//        [_transitionContext completeTransition:!_transitionContext.transitionWasCancelled];
//    }
//}

@end
