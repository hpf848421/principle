//
//  TransitionViewController.m
//  UrlDemo
//
//  Created by apple on 2019/4/8.
//  Copyright © 2019 com. All rights reserved.
//

#import "TransitionViewController.h"
#import "ViewAnimationTransition.h"
#import "ViewAnimationInterTransition.h"
@interface TransitionViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) ViewAnimationInterTransition *tran;
@end

@implementation TransitionViewController
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        ViewAnimationTransition *animation=[[ViewAnimationTransition alloc] initWithType:UINavigationControllerOperationPop];
        return animation;
    }
    return nil;

}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.tran;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    _tran =[[ViewAnimationInterTransition alloc] initWithView:self.view];
    __weak typeof(self) wself=self;
    _tran.eventBlock=^{
        [wself.navigationController popViewControllerAnimated:YES];
    };
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
