//
//  MyLayerView.m
//  UrlDemo
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019年 com. All rights reserved.
//

#import "MyLayerView.h"

@implementation MyLayerView
+ (Class)layerClass{
    return [super layerClass];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.layer.frame = CGRectMake(10, 10, 20, 20);
    }
    return self;
}
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    
//}
//- (void)drawRect:(CGRect)rect{
//
//}
+ (void)initialize
{
  
}
-(void)eat{
    NSLog(@"MyLayerView");
}
@end
