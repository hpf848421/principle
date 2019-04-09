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
#import "LeakView.h"
#import "Teacher.h"
#include <pthread.h>
#import <pop/POP.h>
#import "MysubView.h"
#import "BinaryTree.h"
#import <objc/message.h>
#import "MyLayerView.h"
#import "SonLayerView.h"
#import "MRCViewController.h"
#import "Mamal.h"
#import "Whale.h"
#import "MyOperation.h"
#import "ViewAnimationTransition.h"
#import "TransitionViewController.h"
#import "ViewAnimationInterTransition.h"
//#import <AFNetworking.h>
@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic, assign) int money;
@property (nonatomic, strong) dispatch_queue_t queue;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, weak) LayOutView *view1,*view2;
@property (nonatomic, strong) NSLayoutConstraint *leftContraint;
@property (nonatomic, strong) Person *pe;
//@property (nonatomic, weak) NSString *string_weak_;
@property (nonatomic, strong) NSThread *subThread;
@property (nonatomic, assign) BOOL isneedStop;
@property (nonatomic, strong) CALayer *aniLayer;
@property (nonatomic, copy) void(^myBlock)(void);
@property (nonatomic, weak) UIWindow *weakWind;
@property (nonatomic, strong) NSTimer *timer1;
@property (nonatomic,strong) UIScreenEdgePanGestureRecognizer *recognizer;
@property (nonatomic, strong) ViewAnimationInterTransition *tran;
@end

@implementation ViewController
//-(ViewAnimationInterTransition *)tran{
//    if (!_tran) {
//        _tran =[[ViewAnimationInterTransition alloc] initWithView:self.view];
//        __weak typeof(self) wself=self;
//        _tran.eventBlock=^{
//            TransitionViewController *tran=[[TransitionViewController alloc] init];
//            [wself.navigationController pushViewController:tran animated:YES];
//        };
//    }
//    return _tran;
//}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        ViewAnimationTransition *animation=[[ViewAnimationTransition alloc] initWithType:operation];
        return animation;
    }
    return nil;
}
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    return self.tran;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    
//    self.navigationController.interactivePopGestureRecognizer.enabled=NO;
}
-(void)btnclick{
     [self.view1 layoutIfNeeded];
    self.pe=nil;
    
    
//self.leftContraint.constant = 250 ;
//    [UIView animateWithDuration:2 animations:^{
//
//        [self.view layoutIfNeeded];
//    }];

}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationController.navigationBar.hidden=YES;
    _tran =[[ViewAnimationInterTransition alloc] initWithView:self.view];
    __weak typeof(self) wself=self;
    _tran.eventBlock=^{
        TransitionViewController *tran=[[TransitionViewController alloc] init];
        [wself.navigationController pushViewController:tran animated:YES];
    };
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    TransitionViewController *tr=[[TransitionViewController alloc] init];
//    [self.navigationController pushViewController:tr animated:YES];
//}
//-(void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    NSLog(@"%s",__func__);
//}

#pragma mark MyOperation
//-(void)viewDidLoad{
//    [super viewDidLoad];
//
//    self.view.backgroundColor=[UIColor grayColor];
//    MyOperation *ope=[[MyOperation alloc] init];
//    [ope start];
//}
//#pragma mark runloop 主线程
//-(void)viewDidLoad{
//    [super viewDidLoad];
//self.view.backgroundColor=[UIColor whiteColor];
//    [self addMainObserver];
//}
//// 添加主线程runloop监听者
//
//- (void)addMainObserver
//{
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//
//        switch (activity) {
//
//            case kCFRunLoopEntry:
//                NSLog(@"###cmm###进入kCFRunLoopEntry");
//                break;
//
//            case kCFRunLoopBeforeTimers:
//                NSLog(@"###cmm###即将处理Timer事件");
//                break;
//
//            case kCFRunLoopBeforeSources:
//                NSLog(@"###cmm###即将处理Source事件");
//                break;
//
//            case kCFRunLoopBeforeWaiting:
//                NSLog(@"###cmm###即将休眠");
//                break;
//
//            case kCFRunLoopAfterWaiting:
//                NSLog(@"###cmm###被唤醒");
//
//                break;
//
//            case kCFRunLoopExit:
//                NSLog(@"###cmm###退出RunLoop");
//                break;
//
//            default:
//                break;
//        }
//    });
//    NSString *aaaaaa=NSLocalizedString(@"btn_title", nil);
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
////    _timer1=[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timclick) userInfo:nil repeats:YES];
//    _timer1 = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timclick) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:_timer1 forMode:NSDefaultRunLoopMode];
////    _timer1 = [NSTimer scheduledTimerWithTimeInterval:10 repeats:NO block:^(NSTimer * _Nonnull timer) {
////        NSLog(@"###cmm###timer时间到");
////    }];
//}
//-(void)timclick{
//    NSLog(@"###cmm###timer时间到");
//}
#pragma mark 通知同步
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor whiteColor];
//    Whale *mal = [[Whale alloc] init];
//    NSLog(@"%@",mal);
//
//    Whale *mal2 = [[Whale alloc] initWithName:@"2-name"];
//    NSLog(@"%@",mal2);
//
//    Whale *mal3 = [[Whale alloc] initWithLegs:0];
//    NSLog(@"%@",mal3);
//
//    Whale *mal4 = [[Whale alloc] initWithLegs:0 name:@"4-name"];
//    NSLog(@"%@",mal4);
//
//    Whale *mal5 = [[Whale alloc] initWhale];
//    NSLog(@"%@",mal5);
//
//    Whale *mal6 = [[Whale alloc] initWhaleCanSwim:NO];
//    NSLog(@"%@",mal6);
//
//
////    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNoti) name:@"testNoti" object:nil];
//}
//-(void)testNoti{
//    NSLog(@"收到通知");
//    sleep(2);
//    NSLog(@"结束");
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"testNoti" object:nil];
//    NSLog(@"touchesBegan结束");
//}
#pragma mark 分类属性
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    // 获取成员变量
//    Person *pe=[[Person alloc] init];
//    unsigned int ivarCount = 0;
//    Ivar *ivars = class_copyIvarList([Person class], &ivarCount);
//    for (int i = 0; i < ivarCount; i++) {
//        Ivar ivar = ivars[i];
//        NSLog(@"第%d个成员变量：%s",i,ivar_getName(ivar));
//    }
//    free(ivars);
//    // 获取属性
//    unsigned int propertyCount = 0;
//    objc_property_t *propertyList = class_copyPropertyList([Person class], &propertyCount);
//    for (int i = 0; i < propertyCount; i++) {
//        objc_property_t property = propertyList[i];
//        NSLog(@"第%d个属性：%s",i,property_getName(property));
//    }
//
//
//    // 获取方法列表
//    unsigned int methodCount = 0;
//    Method *methods = class_copyMethodList([Person class], &methodCount);
//    for (int i = 0; i < methodCount; i++) {
//        Method method = methods[i];
//
//        NSLog(@"第%d个方法：%s",i, sel_getName(method_getName(method)));
//    }
//
//}
#pragma mark mrc
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    MRCViewController *mrcVC=[[MRCViewController alloc] init];
//    [self.navigationController pushViewController:mrcVC animated:YES];
//}
#pragma mark sdwebImage
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    UIImageView *imagev=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [imagev sd_setImageWithURL:[NSURL URLWithString:@"http://pic.people.com.cn/NMediaFile/2019/0103/MAIN201901030843000067861598035.jpg"] completed:nil];
//
//    //    [imagev sd_setImageWithURL:[NSURL URLWithString:@"http://www.cnsphoto.com/cnsphoto/groupPicToIo/getIoReadImg.do?picId=22519054&langType=0&imgType=4&featuresImgFlag=1"]];
//    //
//
////    [self.view addSubview:imagev];
//    void(^myBlock)(void)=^{
//
//        NSLog(@"执行block  %@",imagev);
//
//    };
//    NSLog(@"执行  %@",myBlock);
//    self.myBlock=myBlock;
// NSLog(@"执行  %@",myBlock);
//}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    _myBlock();
//
//}
#pragma mark layer
//-(void)viewDidLoad{
//[super viewDidLoad];
//    self.view.backgroundColor=[UIColor whiteColor];
//     SonLayerView *son=[[SonLayerView alloc] init];
//    [son eat];
//    self.view.backgroundColor=[UIColor whiteColor];
//    MyLayerView *lay=[[MyLayerView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    lay.backgroundColor=[UIColor redColor];
//    [self.view addSubview:lay];
//
//    UIWindow *windw=[[UIWindow alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
//    windw.backgroundColor=[UIColor greenColor];
//    [self.view addSubview:windw];
//    self.weakWind=windw;
//    windw.windowLevel = UIWindowLevelAlert;
//    [windw makeKeyAndVisible];
//
//
//    MyLayerView *lay2=[[MyLayerView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    lay2.backgroundColor=[UIColor redColor];
//    [windw addSubview:lay2];
//
    
//}
#pragma mark 二叉树
//-(void)viewDidLoad{
//[super viewDidLoad];
//    BinaryTreeNode *bina=[BinaryTree createTreeWithValues:@[@(100),@(20),@(30),@(40),@(41),@(44),@(50),@(20),@(90)]];
//    NSLog(@"%@",bina);
//}
#pragma mark 队列线程
//-(void)viewDidLoad{
//    dispatch_queue_t q = dispatch_queue_create("dantesx", DISPATCH_QUEUE_CONCURRENT);
//
//    // 2. 同步执行
//    for (int i = 0; i<10; i++) {
//        dispatch_sync(q, ^{
//
//            NSLog(@"%@ %d", [NSThread currentThread], i);
//        });
//
//    }
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"%@ 一部队列", [NSThread currentThread]);
//    });
//}
#pragma mark 消息转发机制
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    Person *pe=[Person new];
//    [pe performSelector:@selector(eatwht)];
//}
//#pragma mark responder
//-(void)loadView{
//    MysubView *subView1=[[MysubView alloc] initWithFrame:CGRectMake(0, 0, 30, 100)];
//    subView1.backgroundColor=[UIColor redColor];
//    self.view = subView1;
//
//}
//#pragma mark responder
//-(void)viewDidLoad{
//    [super viewDidLoad];
////    MysubView *subView1=[[MysubView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
////    subView1.backgroundColor=[UIColor redColor];
////    self.view = subView1;
////    [self.view addSubview:subView1];
//}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//}
#pragma mark autoreleasedPool
//__weak Person *pe1;
//
//-(void)viewDidLoad{
//    [super viewDidLoad];
//
////    NSString *str1=[NSString stringWithFormat:@"a方法水电费水电费的说法是的发放sadfasdfd"];
//////    Person *pe = [Person person];
//////    pe.age=@"1";
////    pe1=str1;
////    NSLog(@"%@",pe1);
//    for (int i=0; i<1024*1024*1024; i++) {
//         @autoreleasepool {
//         Person *pe=[Person person];
//        pe1 = pe;
//         NSLog(@"%p",pe1);
//         }
////        @autoreleasepool {
////            UIImageView *pe=[[UIImageView alloc] init];
////            pe.image= [UIImage imageNamed:@"eee"];
////            [self.view addSubview:pe];
////            NSLog(@"%p",pe);
////        }
//
//    }
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//     NSLog(@"%p",pe1);
//}
#pragma mark pop animation
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    self.aniLayer = [[CALayer alloc] init];
//    _aniLayer.bounds = CGRectMake(0, 0, 100, 100);
//    _aniLayer.position = self.view.center;
//    _aniLayer.backgroundColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:_aniLayer];
//
//    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"position"];
////    //设置代理
////    basicAni.delegate = self;
////    //到达位置
////    basicAni.toValue = [NSValue valueWithCGPoint:CGPointZero];
////    //延时执行
////    //basicAni.beginTime = CACurrentMediaTime() + 2;
////    //动画时间
////    basicAni.duration = 3;
////    //动画节奏
////    basicAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
////    //动画速率
////    //basicAni.speed = 0.1;
////    //图层是否显示执行后的动画执行后的位置以及状态
////    basicAni.removedOnCompletion = NO;
////    basicAni.fillMode = kCAFillModeForwards;
////    [basicAni setValue:basicAni.toValue forKey:@"aaaa"];
////    [basicAni valueForKey:@"aaaa"];
//
//}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//     CGPoint positon = [touches.anyObject locationInView:self.view];
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    self.aniLayer.position = positon;
//    [CATransaction commit];
//}
#pragma mark NSCondition
//-(void)viewDidLoad{
//    [super viewDidLoad];
//
////    pthread_mutexattr_t attr;
////    pthread_mutexattr_init(&attr);
////    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
////
////    pthread_mutex_t lock;
////    pthread_mutex_init(&lock, &attr);    //设置属性
////
////    pthread_mutex_lock(&lock);    //上锁
////    //需要执行的代码
////    pthread_mutex_unlock(&lock);    //解锁
//}
#pragma mark kvo kvc
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    Person *pe=[[Person alloc] init];
////    [pe setValue:pe forKey:@"ccc"];
////    [pe setValue:nil forKey:@"kvoSelf"];
////    [pe setValue:nil forKey:@"age1"];
////    [pe setKvoSelf:@""];
//}
#pragma mark kvo readonly
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    Teacher *te=[[Teacher alloc] init];
//    [te addObserver:self forKeyPath:@"address" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//
//    [te setValue:@"福建" forKey:@"address"];
//}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//
//    NSLog(@"observeValueForKeyPath %@",change[NSKeyValueChangeNewKey]);
//
//
//}
#pragma mark kvo 手动监听
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    Person *te=[[Person alloc] init];
//    [te setValue:@"福建" forKey:@"kvoSelf"];
//    const char *name=object_getClassName(te);
//    Class cls=objc_getClass(name);
//    Class superCls=class_getSuperclass(cls);
//    Class superCls1=class_getSuperclass(superCls);
//    Class superCls2=class_getSuperclass(superCls1);
//    Class superCls3=class_getSuperclass(superCls2);
//
//
//
////    NSLog(@"%@--%@  %@  %@  %@",cls,superCls,superCls1,superCls2,superCls3);
//
//    Class metacls=objc_getMetaClass(name);
//    Class metaclssuperCls=class_getSuperclass(metacls);
//    Class metaclssuperCls2=class_getSuperclass(metaclssuperCls);
//    Class metaclssuperCls3=class_getSuperclass(metaclssuperCls2);
//
//
//    Class isaMeta=objc_getClass(object_getClassName(metaclssuperCls));
//                unsigned int countMethod = 0;
//    Method * methods = class_copyMethodList(metacls, &countMethod);
//    [self printMethod:countMethod methods:methods ];
//
////        NSLog(@"%@",isaMeta);
////    NSLog(@"%@--%@  %@  %@",metacls,metaclssuperCls,metaclssuperCls2,metaclssuperCls3);
////    Class meta=objc_getClass([NSStringFromClass(cls) UTF8String]);
////    Class scls=class_getSuperclass([Person class]);
////    Class cls=objc_getMetaClass([NSStringFromClass([Person class]) UTF8String]);
////    Class cls1=objc_getMetaClass(class_getName(cls));
////    NSLog(@"%p--%p",cls,meta);
//}
//- (void)printMethod:(int)count methods:(Method *) methods{
//    for (int j = 0; j < count; j++) {
//        Method method = methods[j];
//        SEL methodSEL = method_getName(method);
//        const char * selName = sel_getName(methodSEL);
//        if (methodSEL) {
//            NSLog(@"sel------%s", selName);
//        }
//    }
//}
#pragma mark kvo 手动监听
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    Person *te=[[Person alloc] init];
//    [te addObserver:self forKeyPath:@"kvoSelf" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//
//    [te setValue:@"福建" forKey:@"kvoSelf"];
//}
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    NSLog(@"%@, --%@",change,keyPath);
//}
#pragma mark 多线程
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    [self performSelector:@selector(run:) withObject:@"测试" afterDelay:2.0];
//    NSLog(@"a");
//}
//-(void)run:(NSString *)param{
//    NSLog(@"%@",[NSThread currentThread]);
//}
#pragma mark leak
//-(void)testLeak{
//    UIButton *searchBtn=[[UIButton alloc] initWithFrame:CGRectMake(50, 100,150, 40)];
//    [self.view addSubview:searchBtn];
//    [searchBtn setTitle:@"新增" forState:UIControlStateNormal];
//    searchBtn.layer.cornerRadius = 20;
//    searchBtn.backgroundColor=[UIColor blueColor];
//    [searchBtn addTarget:self action:@selector(searchclick) forControlEvents:UIControlEventTouchUpInside];
//
//}
//-(void)searchclick{
//
//    LeakView *leakV=[[LeakView alloc] initWithFrame:CGRectMake(0, 50, 300, 500)];
//    leakV.myBlock = ^{
//        NSLog(@"%s",__func__);
//    };
//    [self.view addSubview:leakV];
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self testLeak];
//
//}
#pragma mark autoreleasePool
//- (void)viewDidLoad {
//    [super viewDidLoad];
////    [self autoreleasePool];
//        int lagerNum = 1024 * 1024 * 200 ;
//    for(int i = 0 ; i < lagerNum; i++){
//        NSString *str=[[NSString alloc] init];
//
//    }
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
//
//__weak id string_weak_ = nil;
//- (void)viewDidLoad {
//    [super viewDidLoad];
////    @autoreleasepool {
//        NSString *string = [NSString stringWithFormat:@"leichdasdasdsadsadleichdasdasdsadsad"];
//        string_weak_ = string;
////        NSLog(@"string: %@", string_weak_);
////    }
//      NSLog(@"string: %@", string_weak_);
////    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)string));
//}
//- (void)viewWillAppear:(BOOL)animated {
//
//    [super viewWillAppear:animated];
//
//    NSLog(@"string: %@", string_weak_);
////       NSLog(@"viewWillAppear Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)string_weak_));
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//
//    [super viewDidAppear:animated];
//
//    NSLog(@"string: %@", string_weak_);
////       NSLog(@"viewDidAppear Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)string_weak_));
//}
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
