//
//  SHAnimation.m
//  SHAnmation
//
//  Created by CSH on 2018/6/27.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "SHAnimation.h"

#define kShakingRadian(R) ((R) / 180.0 * M_PI)

@implementation SHAnimation

#pragma mark - 添加抖动动画
+ (void)addAnimationShakeWithView:(UIView *)view{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"transform.rotation";
    
    animation.values = @[@(kShakingRadian(-5)),  @(kShakingRadian(5)), @(kShakingRadian(-5))];
    
    animation.duration = 0.25;
    
    // 动画的重复执行次数
    animation.repeatCount = MAXFLOAT;
    
    // 保持动画执行完毕后的状态
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    [view.layer addAnimation:animation forKey:@"sh_animation_shake"];
}

#pragma mark - 移除抖动动画
+ (void)removeAnimationShakeWithView:(UIView *)view{
    
    //结束动画
    [view.layer removeAnimationForKey:@"sh_animation_shake"];
}

@end
