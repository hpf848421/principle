//
//  ViewAnimationInterTransition.m
//  UrlDemo
//
//  Created by apple on 2019/4/9.
//  Copyright © 2019 com. All rights reserved.
//

#import "ViewAnimationInterTransition.h"
@interface ViewAnimationInterTransition ()
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gestureRecognizer;
@property (nonatomic,strong) UIView *gestureView;
@end
@implementation ViewAnimationInterTransition
- (instancetype)initWithView:(UIView *)gestureView{
    self = [self init];
    if (self) {
        UIScreenEdgePanGestureRecognizer *pang=[[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizeDidUpdate:)];
        pang.edges=UIRectEdgeLeft;
        _gestureRecognizer=pang;
        _gestureView=gestureView;
        [gestureView addGestureRecognizer:pang];
    }
    return self;
}
- (void)dealloc{
    [_gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
}

-(void)gestureRecognizeDidUpdate:(UIPanGestureRecognizer *)ges{
    CGFloat progress = fabs([ges translationInView:self.gestureView].x) / (self.gestureView.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));

    if (_gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        if (_eventBlock) {
            _eventBlock();
        }
    }else if (_gestureRecognizer.state == UIGestureRecognizerStateChanged){
        [self updateInteractiveTransition:progress];
        
    }else if (_gestureRecognizer.state == UIGestureRecognizerStateEnded || _gestureRecognizer.state == UIGestureRecognizerStateCancelled){
        NSLog(@"gestureRecognizeDidUpdate");
        if (progress > 0.3) {
            NSLog(@"progress > 0.5");
            [self finishInteractiveTransition];
        }else{
            NSLog(@"progress < 0.5");
            [self cancelInteractiveTransition];
        }
    }
}
@end
