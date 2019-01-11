//
//  ViewController.m
//  UrlDemo
//
//  Created by apple on 2019/1/3.
//  Copyright © 2019年 com. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LayOutView.h"
#import "Person.h"
#import <objc/runtime.h>
#import "NSObject+kvoBean.h"
#import "MyThread.h"
@interface ViewController ()
@property (nonatomic, assign) int money;
@property (nonatomic, strong) dispatch_queue_t queue;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, weak) LayOutView *view1,*view2;
@property (nonatomic, strong) NSLayoutConstraint *leftContraint;
@property (nonatomic, strong) Person *pe;
//@property (nonatomic, weak) NSString *string_weak_;
@property (nonatomic, strong) NSThread *subThread;
@property (nonatomic, assign) BOOL isneedStop;
@end

@implementation ViewController
-(void)btnclick{
     [self.view1 layoutIfNeeded];
    self.pe=nil;
//self.leftContraint.constant = 250 ;
//    [UIView animateWithDuration:2 animations:^{
//
//        [self.view layoutIfNeeded];
//    }];

}
//-(void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    NSLog(@"%s",__func__);
//}
#pragma mark autoreleasePool
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self autoreleasePool];
//
//}
//-(void)autoreleasePool{
//    int lagerNum = 1024 * 1024 * 200 ;
//    for(int i = 0 ; i < lagerNum; i++)
//    {
//        @autoreleasepool {
//            NSString *str = [NSString stringWithFormat:@"Hello"];
//            str = [str uppercaseString];
//            str = [[NSString new] stringByAppendingFormat:@"-%@",@"World!"];
//        }
//
//    }
//
//}
#pragma mark runloop
//-(void)myrunLoop{
//    self.subThread = [[MyThread alloc] initWithTarget:self selector:@selector(subThreadTodo) object:nil];
//    self.subThread.name = @"subThread";
//    [self.subThread start];
//
//}
//- (void)subThreadTodo
//{
//    NSLog(@"%@----开始执行子线程任务",[NSThread currentThread]);
//    //获取当前子线程的RunLoop
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    //注释掉下面这行和不注释掉下面这行分别运行一次
//    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerTodo) userInfo:nil repeats:NO];
//    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
//    NSLog(@"RunLoop:%@",runLoop);
//    //让RunLoop跑起来
////    while(!self.isneedStop){
//        [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
////    }
//
//    NSLog(@"%@----执行子线程任务结束",[NSThread currentThread]);
//}
//-(void)timerTodo{
//     NSLog(@"Timer启动啦，当前RunLoopMode:%@\n", [[NSRunLoop currentRunLoop] currentMode]);
//
//}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self performSelector:@selector(wantodo) onThread:self.subThread withObject:nil waitUntilDone:NO];
////    [self performSelector:@selector(wantodo) withObject:self.subThread];
//}
//-(void)wantodo{
//     NSLog(@"当前线程:%@执行任务处理数据", [NSThread currentThread]);
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self myrunLoop];
//
//}
#pragma mark autoreleased
//__weak id reference = nil;
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSString *str = [NSString stringWithFormat:@"a string object"];
//    reference = str;
//    NSLog(@"viewDidLoad - %@", reference);
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"viewWillAppear - %@", reference);
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"viewDidAppear - %@", reference);
//}

__weak id string_weak_ = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    @autoreleasepool {
        NSString *string = [NSString stringWithFormat:@"leichdasdasdsadsad"];
        string_weak_ = string;
//        NSLog(@"string: %@", string_weak_);
    }
      NSLog(@"string: %@", string_weak_);
//    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)string));
}
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    NSLog(@"string: %@", string_weak_);
//       NSLog(@"viewWillAppear Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)string_weak_));
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

    NSLog(@"string: %@", string_weak_);
//       NSLog(@"viewDidAppear Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)string_weak_));
}
//-(void)myreleased{
//    // 场景 1
//
//    NSString *string = [NSString stringWithFormat:@"leichunfeng"];
//
//    string_weak_ = string;
//
//    // 场景 2
//
//    //    @autoreleasepool {
//
//    //        NSString *string = [NSString stringWithFormat:@"leichunfeng"];
//
//    //        string_weak_ = string;
//
//    //    }
//
//    // 场景 3
//
//    //    NSString *string = nil;
//
//    //    @autoreleasepool {
//
//    //        string = [NSString stringWithFormat:@"leichunfeng"];
//
//    //        string_weak_ = string;
//
//    //    }
//
//    NSLog(@"string: %@", string_weak_);
//}


#pragma mark block
-(void)blockTest{
    __block int a = 0;
    NSLog(@"定义前：%p", &a);         //栈区
    void (^foo)(void) = ^{
        a = 1;
        NSLog(@"block内部：%p", &a);    //堆区
    };
    NSLog(@"定义后：%p", &a);         //堆区
    foo();

}
#pragma mark layer
//-(void)demoReplication{
//    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
//    animationView.center = self.view.center;
//    [self.view addSubview:animationView];
//    animationView.backgroundColor = [UIColor lightGrayColor];
//    animationView.clipsToBounds = true;
//
//    CAShapeLayer *animationLayer = [[CAShapeLayer alloc] init];      // 动画图层,就是不停变大的那个圆
//    animationLayer.backgroundColor = [UIColor redColor].CGColor;
//    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
//    animationLayer.cornerRadius = 10;
//    animationLayer.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 100);
//
//    // 放大的动画
//    CABasicAnimation *transformAnim = [[CABasicAnimation alloc] init];
//    transformAnim.keyPath = @"transform";
//    NSValue *keyVF=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
//    transformAnim.fromValue =keyVF;
//    NSValue *keyV=[NSValue valueWithCATransform3D:CATransform3DMakeScale(10, 10, 1)];
//    transformAnim.toValue = keyV;
//    transformAnim.duration = 2;
//    transformAnim.removedOnCompletion = NO;
//    transformAnim.fillMode = kCAFillModeForwards;
//    // 透明度动画(其实也可以直接设置CAReplicatorLayer的instanceAlphaOffset来实现)
////
//    CABasicAnimation *alphaAnim = [[CABasicAnimation alloc] init];
//    alphaAnim.keyPath = @"opacity";
//    alphaAnim.fromValue = @(1);
//    alphaAnim.toValue = @(0);
//    alphaAnim.duration = 2.0f;
//    alphaAnim.removedOnCompletion = NO;
//    alphaAnim.fillMode = kCAFillModeForwards;
////
//    CAAnimationGroup *animGroup = [[CAAnimationGroup alloc] init];
//    animGroup.animations = @[transformAnim,alphaAnim];
//    animGroup.duration = 2;
//    animGroup.repeatCount = 10;
//    [animationLayer addAnimation:animGroup forKey:nil];
////    [animationLayer addAnimation:alphaAnim forKey:nil];
//    [animationView.layer addSublayer:animationLayer];
//    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
//    [replicatorLayer addSublayer:animationLayer];
//    replicatorLayer.instanceCount = 3 ; //三个复制图层
//    replicatorLayer.instanceDelay = 0.3;  // 复制间隔0.3秒
//    [animationView.layer addSublayer:replicatorLayer];
//
//}
//#pragma mark kvo
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//
//}
//-(void)kvotest{
//    self.pe=[Person new];
//    [self.pe addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//    self.pe.age=@"15";
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
////    [self myreleased];
////    [self blockTest];
////    [self demoReplication];
//
////    LayOutView *view1 = [[LayOutView alloc] init];
////    [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
////    view1.backgroundColor=[UIColor redColor];
////    [self.view addSubview:view1];
////    self.view1 = view1;
////    NSLayoutConstraint *leftContraint=[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100];
////    [self.view addConstraint:leftContraint];
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:100]];
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:100]];
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:150]];
////    self.leftContraint=leftContraint;
//////    [self.view1 setNeedsLayout];
//////    [self.view1 layoutIfNeeded];
////    LayOutView *view2 = [[LayOutView alloc] initWithFrame:CGRectMake(0, 15, 60, 30)];
////    view2.backgroundColor=[UIColor blueColor];
////    [view1 addSubview:view2];
////    self.view2 = view2;
////
////
////    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(100,300, 50, 50)];
////    [btn setTitle:@"点击" forState:UIControlStateNormal];
////    [self.view addSubview:btn];
////    [btn setBackgroundColor:[UIColor blackColor]];
////    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
//    //    UIImageView *imagev=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    //    [imagev sd_setImageWithURL:[NSURL URLWithString:@"http://pic.people.com.cn/NMediaFile/2019/0103/MAIN201901030843000067861598035.jpg"] completed:nil];
//    //
//    ////    [imagev sd_setImageWithURL:[NSURL URLWithString:@"http://www.cnsphoto.com/cnsphoto/groupPicToIo/getIoReadImg.do?picId=22519054&langType=0&imgType=4&featuresImgFlag=1"]];
//    ////
//    //
//    //     [self.view addSubview:imagev];
//
//
//}
#pragma mark 锁
-(void)lock{
    //    self.queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //    self.semaphore = dispatch_semaphore_create(0);
    //
    //
    //    [self semaphoreSync];
    //
    //    [self semaphoreSync];
    
    //    [self groupEnterAndLeave];
    //    self.money = 100;
    
    //    dispatch_queue_t queue=dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    //
    //
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 10; i++) {
    //            [self saveMoney];
    //        }
    //
    //    });
    //
    //    dispatch_async(queue, ^{
    //        for (int i = 0; i < 10; i++) {
    //            [self drawMoney];
    //        }
    //
    //    });
}
/**
 存钱
 */
- (void)saveMoney
{
    @synchronized (self) {
        int oldMoney = self.money;
        sleep(.2);
        oldMoney += 50;
        self.money = oldMoney;
        
        NSLog(@"存50，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
    }
    
}

/**
 取钱
 */
- (void)drawMoney
{
    @synchronized (self) {
        int oldMoney = self.money;
        sleep(.2);
        oldMoney -= 20;
        self.money = oldMoney;
        
        NSLog(@"取20，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
    }
    
}
/**
 * 队列组 dispatch_group_enter、dispatch_group_leave
 */
- (void)groupEnterAndLeave
{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
        dispatch_group_leave(group);
    });
    NSLog(@"group--middle");
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步操作都执行完毕后，回到主线程.
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
        NSLog(@"group---end");
    });
    NSLog(@"group--ending");
    
}
/**
 * semaphore 线程同步
 */
- (void)semaphoreSync {
    
    //    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    //    NSLog(@"semaphore---begin");
    //
    
    __block int number = 0;
    dispatch_async(self.queue, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        
        number = 100;
        
        dispatch_semaphore_signal(self.semaphore);
    });
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end,number = %zd",number);
}

@end
