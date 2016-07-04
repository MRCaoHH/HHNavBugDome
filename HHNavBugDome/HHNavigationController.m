//
//  HHNavigationController.m
//  HHNavBugDome
//
//  Created by caohuihui on 16/7/4.
//  Copyright © 2016年 caohuihui. All rights reserved.
//

#import "HHNavigationController.h"

@interface HHNavigationController ()<UINavigationControllerDelegate>
@end

@implementation HHNavigationController
-(void)viewDidLoad{
    [super viewDidLoad];
    //签订协议
    //self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.interactivePopGestureRecognizer.enabled = [self.viewControllers count] > 1 ;
    
}
@end
