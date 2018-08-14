//
//  ViewController.m
//  SHAnimation
//
//  Created by CSH on 2018/2/26.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "ViewController.h"
#import "SHAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(0, 0, 200, 50);
    self.btn.center = self.view.center;
    self.btn.backgroundColor = [UIColor orangeColor];
    [self.btn setTitle:@"抖 动" forState:0];
    
    [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.btn];
}

- (void)btnAction{
    
    [SHAnimation addAnimationShakeWithView:self.btn];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SHAnimation removeAnimationShakeWithView:self.btn];
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //    transform.scale = 比例转换(x.y不存在就是中心点)
    //    transform.rotation = 旋转(x.y.z不存在就是中心点)
    //    opacity = 透明度
    //    margin = 边距
    //    position ＝ 位移
    //    backgroundColor = 背景颜色
    //    cornerRadius = 圆角
    //    borderWidth ＝ 边框宽度
    //    bounds ＝ 位置，体积
    //    contents ＝ 内容
    //    contentsRect ＝ 面积
    //    frame ＝ 位置，体积
    //    hidden ＝ 是否隐藏
    //    mask ＝ 任务
    //    masksToBounds
    //    shadowColor ＝ 阴影颜色
    //    shadowOffset ＝ 阴影偏移
    //    shadowOpacity ＝ 阴影透明
    //    shadowRadius ＝ 阴影半径
    
    [self.btn setTitle:@"" forState:0];
    
    //圆角
    CABasicAnimation *animation1 = [[CABasicAnimation alloc]init];
    //动画效果
    animation1.keyPath = @"cornerRadius";
    //动画执行周期
    animation1.duration = 1;
    //进行改变
    animation1.toValue = @(self.btn.frame.size.height/2);
    //保持动画结束之后的状态
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    
    //位置(向上平移100)
    CABasicAnimation *animation2 = [[CABasicAnimation alloc]init];
    //动画效果
    animation2.keyPath = @"position";
    //动画执行周期
    animation2.duration = 1;
    //开始时间
    animation2.beginTime = animation1.beginTime + animation1.duration;
    //进行改变
    animation2.toValue = [NSValue valueWithCGPoint:CGPointMake(self.btn.center.x, self.btn.center.y - 100)];
    //保持动画结束之后的状态
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    //翻转(X轴)
    CABasicAnimation *animation3 = [[CABasicAnimation alloc]init];
    //动画效果
    animation3.keyPath = @"transform.rotation.x";
    //动画执行周期
    animation3.duration = 1;
    //开始时间
    animation3.beginTime = animation2.beginTime;
    //进行改变
    animation3.toValue = @(2*M_PI);
    //保持动画结束之后的状态
    animation3.fillMode = kCAFillModeForwards;
    animation3.removedOnCompletion = NO;
    
    //bounds(等高)
    CABasicAnimation *animation4 = [[CABasicAnimation alloc]init];
    //动画效果
    animation4.keyPath = @"bounds";
    //动画执行周期
    animation4.duration = 1;
    //开始时间
    animation4.beginTime = animation3.beginTime + animation3.duration;
    //进行改变
    animation4.toValue = [NSValue valueWithCGRect:CGRectMake(self.btn.frame.origin.x + (self.btn.frame.size.width - self.btn.frame.size.height)/2, self.btn.frame.origin.y, self.btn.frame.size.height, self.btn.frame.size.height)];
    //保持动画结束之后的状态
    animation4.fillMode = kCAFillModeForwards;
    animation4.removedOnCompletion = NO;
    
    //旋转
    CABasicAnimation *animation5 = [[CABasicAnimation alloc]init];
    //动画效果
    animation5.keyPath = @"transform.rotation";
    //动画执行周期
    animation5.duration = 1;
    //开始时间
    animation5.beginTime = animation4.beginTime;
    //进行改变
    animation5.toValue = @(2*M_PI);
    //保持动画结束之后的状态
    animation5.fillMode = kCAFillModeForwards;
    animation5.removedOnCompletion = NO;
    
    //淡入淡出
    CABasicAnimation *animation6 = [[CABasicAnimation alloc]init];
    //动画效果
    animation6.keyPath = @"opacity";
    //动画执行周期
    animation6.duration = 1;
    //开始时间
    animation6.beginTime = animation5.beginTime + animation5.duration;
    //进行改变
    animation6.fromValue = @0;
    animation6.toValue = @1;
    //保持动画结束之后的状态
    animation6.fillMode = kCAFillModeForwards;
    animation6.removedOnCompletion = NO;
    
    //背景颜色
    CABasicAnimation *animation7 = [[CABasicAnimation alloc]init];
    //动画效果
    animation7.keyPath = @"backgroundColor";
    //动画执行周期
    animation7.duration = 1;
    //开始时间
    animation7.beginTime = animation6.beginTime + animation6.duration;
    //进行改变
    animation7.toValue = (id)[UIColor greenColor].CGColor;
    //保持动画结束之后的状态
    animation7.fillMode = kCAFillModeForwards;
    animation7.removedOnCompletion = NO;
    
    //创建动画组
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc]init];
    //动画执行周期
    animationGroup.duration = animation7.beginTime + animation7.duration;
    //添加动画到动画组
    animationGroup.animations = @[animation1,animation2,animation3,animation4,animation5,animation6,animation7];
    //保持动画结束之后的状态
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    
    //视图添加动画
    [self.btn.layer addAnimation:animationGroup forKey:@"animation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

