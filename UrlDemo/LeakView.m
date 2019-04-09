//
//  LeakView.m
//  UrlDemo
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019年 com. All rights reserved.
//

#import "LeakView.h"

@implementation LeakView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *searchBtn=[[UIButton alloc] initWithFrame:CGRectMake(50, 100,150, 40)];
        [self addSubview:searchBtn];
        [searchBtn setTitle:@"确定" forState:UIControlStateNormal];
        searchBtn.layer.cornerRadius = 20;
        searchBtn.backgroundColor=[UIColor blueColor];
        [searchBtn addTarget:self action:@selector(searchclick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
-(void)searchclick:(UIButton *)search{

    if (self.myBlock) {
        self.myBlock();
    }
    [self hideView];
}
-(void)hideView{
    CAAnimation *anima=[self.layer animationForKey:@"easyout"];
    if (anima) {
        return;
    }
    CGRect frame=self.frame;
    CGFloat destX=frame.size.width;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.fromValue=[NSNumber numberWithFloat:0];
    animation.toValue=[NSNumber numberWithFloat:destX];
    animation.delegate=self;
    animation.removedOnCompletion=NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.repeatCount=1;
    animation.fillMode=kCAFillModeForwards;
    animation.duration=0.3;
    
    
    
    [self.layer addAnimation:animation forKey:@"easyout"];
    
    [self removeFromSuperview];
}

- (void)animationDidStart:(CAAnimation *)anim{
    if ([self.layer animationForKey:@"easyout"] == anim) {
        
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if ([self.layer animationForKey:@"easyout"] == anim) {
        self.backgroundColor=[UIColor redColor];
        [self.layer removeAnimationForKey:@"easyout"];
        [self.layer removeAnimationForKey:@"alphaAni"];
        [self removeFromSuperview];
    }
}
@end
