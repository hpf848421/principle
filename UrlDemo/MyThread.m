//
//  MyThread.m
//  UrlDemo
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019年 com. All rights reserved.
//

#import "MyThread.h"

@implementation MyThread
-(void)dealloc{
     NSLog(@"%@线程被释放了", self.name);
}
@end
