//
//  BinaryTree.h
//  UrlDemo
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface BinaryTree : NSObject
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values;
@end

NS_ASSUME_NONNULL_END
