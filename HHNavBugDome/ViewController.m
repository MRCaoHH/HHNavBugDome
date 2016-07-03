//
//  ViewController.m
//  HHNavBugDome
//
//  Created by caohuihui on 16/7/3.
//  Copyright © 2016年 caohuihui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initNavBar];
    
    //设置背景颜色，用于区分控制器
    CGFloat r = (CGFloat)(random()%255 + 1)/255;
    CGFloat g = (CGFloat)(random()%255 + 1)/255;
    CGFloat b = (CGFloat)(random()%255 + 1)/255;
    self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    //bug代码，若无这行代码返回手势不可用，若有这行代码会出现文章中所描述的Bug
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化导航栏
-(void)initNavBar{
    if ([self.navigationController.viewControllers count] > 1) {
        UIBarButtonItem * backItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackEvent)];
        self.navigationItem.leftBarButtonItem = backItem;
    }
    
    UIBarButtonItem * pushItem = [[UIBarButtonItem alloc]initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(clickPushEvent)];
    self.navigationItem.rightBarButtonItem = pushItem;
}


#pragma mark - 交互
-(void)clickBackEvent{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickPushEvent{
    ViewController * vc = [[ViewController alloc]init];
    vc.title = [NSString stringWithFormat:@"%li",self.title.integerValue + 1];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
