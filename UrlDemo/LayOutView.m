//
//  LayOutView.m
//  UrlDemo
//
//  Created by apple on 2019/1/4.
//  Copyright © 2019年 com. All rights reserved.
//

#import "LayOutView.h"

@implementation LayOutView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"%s %p",_cmd,self);
    
    
}

@end
