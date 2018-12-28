//
//  CXMBHUDViewController.m
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/12/27.
//  Copyright © 2018 xuchen. All rights reserved.
//

#import "CXMBHUDViewController.h"
#import "MBProgressHUD+CX.h"

@interface CXMBHUDViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation CXMBHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)showHudProgress:(id)sender {
//    [MBProgressHUD cx_showLoadingTip:@"小猿正在帮您约课..."];
//    [MBProgressHUD cx_showLoading];
//    [MBProgressHUD cx_showLoadingTip:@"小猿正在帮您约课..." inView:self.testView];
    [MBProgressHUD cx_showLoadingInView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD cx_hideHUDForView:self.view];
    });
}

- (IBAction)shoHUD2:(id)sender {
//    [MBProgressHUD cx_hideHUDForView:self.testView];
//    [MBProgressHUD cx_hideHUDForView];
    
    
    // 空白页加载中， 只有首次进入页面时
    [MBProgressHUD cx_showEmptyLoadingInView:self.testView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD cx_hideHUDForView:self.testView];
    });
    
}


- (IBAction)showSuccess:(id)sender {
    [MBProgressHUD cx_showSuccessTip:@"缓存清除成功"];
}


- (IBAction)showFailure:(id)sender {
    [MBProgressHUD cx_showErrorTip:@"网络请求失败"];
}


- (IBAction)showAlert:(id)sender {
    [MBProgressHUD cx_showWarningTip:@"请填写完整后重试"];
}


- (IBAction)showSingleTitle:(id)sender {
    [MBProgressHUD cx_showTipText: @"请输入用户名"];
    
//    [MBProgressHUD cx_showTipText:@"请输入密码!" inView:self.view autoHideTime:1 completionBlock:^{
//        NSLog(@"消失了啊 ---");
//    }];
    
    //    [MBProgressHUD cx_showTipText:@"失败" inView:self.testView autoHideTime:5];
}


@end
