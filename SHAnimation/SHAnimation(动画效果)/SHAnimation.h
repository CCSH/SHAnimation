//
//  SHAnimation.h
//  SHAnmation
//
//  Created by CSH on 2018/6/27.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHAnimation : NSObject


/**
 添加抖动动画
 
 @param view 添加的视图
 */
+ (void)addAnimationShakeWithView:(UIView *)view;

/**
 移除抖动动画

 @param view 移除的视图
 */
+ (void)removeAnimationShakeWithView:(UIView *)view;

@end
