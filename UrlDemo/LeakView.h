//
//  LeakView.h
//  UrlDemo
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeakView : UIView<CAAnimationDelegate>
@property (nonatomic, copy) void(^myBlock)(void);
@end

NS_ASSUME_NONNULL_END
