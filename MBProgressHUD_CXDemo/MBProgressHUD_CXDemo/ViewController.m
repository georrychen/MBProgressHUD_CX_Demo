//
//  ViewController.m
//  MBProgressHUD_CXDemo
//
//  Created by Xu Chen on 2018/12/28.
//  Copyright © 2018 xu.yzl. All rights reserved.
//

#import "ViewController.h"
#import "CXMBHUDViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CXMBHUDViewController *vc = [[CXMBHUDViewController alloc] initWithNibName:@"CXMBHUDViewController" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
