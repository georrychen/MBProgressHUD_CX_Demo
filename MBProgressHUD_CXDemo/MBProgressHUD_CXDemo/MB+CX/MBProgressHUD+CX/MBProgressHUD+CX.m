//
//  MBProgressHUD+CX.m
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/12/27.
//  Copyright © 2018 xuchen. All rights reserved.
//

#import "MBProgressHUD+CX.h"

@implementation MBProgressHUD (CX)

// MARK: - 提示文本

+ (void)cx_showTipText:(NSString *)text {
    [self cx_showTipText:text inView:nil autoHideTime:1.5 completionBlock:nil];
}
+ (void)cx_showTipText:(NSString *)text autoHideTime:(NSTimeInterval)second {
    [self cx_showTipText:text inView:nil autoHideTime:second completionBlock:nil];
}
+ (void)cx_showTipText:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second {
    [self cx_showTipText:text inView:view autoHideTime:second completionBlock:nil];
}
+ (void)cx_showTipText:(NSString *)text autoHideTime:(NSTimeInterval)second completionBlock:(void (^)(void))completionBlock {
    [self cx_showTipText:text inView:nil autoHideTime:second completionBlock:completionBlock];
}

+ (void)cx_showTipText:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    // HUD显示动画
    hud.animationType = MBProgressHUDAnimationZoom;
    // 文字边距
    hud.margin = 13;
    // 黑色背景框
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
    hud.bezelView.layer.cornerRadius = 3;
    // Label 属性
    hud.label.text = text;
    hud.label.textColor = UIColor.whiteColor;
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont systemFontOfSize:15];
    // 隐藏后回调
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:second];
}



// MARK: - 提示图片 + 文字
// MARK: - 成功提示

+ (void)cx_showSuccessTip:(NSString *)text {
    [self cx_showTipIcon:@"progress_success_22x22_" isEmptyView:NO isGifImage:NO text:text inView:nil autoHideTime:1.5 completionBlock:nil];
}
+ (void)cx_showSuccessTip:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock {
    [self cx_showTipIcon:@"progress_success_22x22_" isEmptyView:NO isGifImage:NO text:text inView:view autoHideTime:second completionBlock:completionBlock];
}

// MARK: - 失败提示

+ (void)cx_showErrorTip:(NSString *)text {
    [self cx_showTipIcon:@"progress_fail_24x24_" isEmptyView:NO isGifImage:NO text:text inView:nil autoHideTime:1.5 completionBlock:nil];
}
+ (void)cx_showErrorTip:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock {
    [self cx_showTipIcon:@"progress_fail_24x24_" isEmptyView:NO isGifImage:NO text:text inView:view autoHideTime:second completionBlock:completionBlock];
}

// MARK: - 警告提示

+ (void)cx_showWarningTip:(NSString *)text {
    [self cx_showTipIcon:@"progress_warning" isEmptyView:NO isGifImage:NO text:text inView:nil autoHideTime:1.5 completionBlock:nil];
}
+ (void)cx_showWarningTip:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock {
    [self cx_showTipIcon:@"progress_warning" isEmptyView:NO isGifImage:NO text:text inView:view autoHideTime:1.5 completionBlock:completionBlock];
}


// MARK: - 加载中提示

+ (void)cx_showLoading {
    [self cx_showTipIcon:nil isEmptyView:NO isGifImage:YES text:@"正在加载..." inView:nil autoHideTime:0 completionBlock:nil];
}
+ (void)cx_showLoadingInView:(UIView *)view {
    [self cx_showTipIcon:nil isEmptyView:NO isGifImage:YES text:@"正在加载..." inView:view autoHideTime:0 completionBlock:nil];
}
+ (void)cx_showLoadingTip:(NSString *)text {
    [self cx_showTipIcon:nil isEmptyView:NO isGifImage:YES text:text inView:nil autoHideTime:0 completionBlock:nil];
}
+ (void)cx_showLoadingTip:(NSString *)text inView:(UIView *)view {
    [self cx_showTipIcon:nil isEmptyView:NO isGifImage:YES text:text inView:view autoHideTime:0 completionBlock:nil];

}

// MARK: - 空白页的加载中提示

+ (void)cx_showEmptyLoadingInView:(UIView *)view {
    [self cx_showTipIcon:nil isEmptyView:YES isGifImage:YES text:@"努力加载中..." inView:view autoHideTime:0 completionBlock:nil];
}

+ (void)cx_showEmptyLoadingTip:(NSString *)text inView:(UIView *)view {
    [self cx_showTipIcon:nil isEmptyView:YES isGifImage:YES text:text inView:view autoHideTime:0 completionBlock:nil];
}


// MARK: - 隐藏HUD

+ (void)cx_hideHUDForView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self hideHUDForView:view animated:YES];
}

+ (void)cx_hideHUDForView {
    [self cx_hideHUDForView:nil];
}


+ (void)cx_showTipIcon:(NSString *)iconName isEmptyView:(BOOL)isEmptyView isGifImage:(BOOL)isGif text:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void (^)(void))completionBlock {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *showImageView = [[UIImageView alloc] init];
    if (isGif) {
        
        // 加载GIF图 - 这里用的图片组，也可用其它方法直接加载gif
        NSMutableArray *gifArray = [NSMutableArray array];
        for (int i = 0; i < 6; i ++) {
            NSString *imageName = [NSString stringWithFormat:@"%@%02d", @"CX_MBProgressHUD.bundle/run_loading_", i];
            UIImage *image = [UIImage imageNamed:imageName];
            
            [gifArray addObject:image];
        }
        [showImageView setAnimationImages:gifArray];
        [showImageView setAnimationDuration:0.5];
        [showImageView setAnimationRepeatCount:0];
        [showImageView startAnimating];
        
    } else {
        // 图片添加帧动画显示
        showImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"CX_MBProgressHUD.bundle/%@", iconName]];
        [self cx_addLayerDSPopUpAnimationToView:showImageView];
        
        [hud hideAnimated:YES afterDelay:second];
    }
    hud.customView = showImageView;
    
    // 黑色背景框
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    if (isEmptyView) { // 空白页的加载中提示样式与普通的有所区别
        hud.bezelView.color = UIColor.clearColor;
        hud.backgroundColor = UIColor.whiteColor;
        hud.label.textColor = UIColor.grayColor;
        // HUD显示动画
        hud.animationType = MBProgressHUDAnimationFade;
        // 文字边距， 修改 MB 中的参数 MBDefaultPadding 可改变图片和文字间距
        hud.margin = 20;
    } else {
        hud.bezelView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        hud.bezelView.layer.cornerRadius = 3;
        hud.label.textColor = UIColor.whiteColor;
        // HUD显示动画
        hud.animationType = MBProgressHUDAnimationZoom;
        // 文字边距， 修改 MB 中的参数 MBDefaultPadding 可改变图片和文字间距
        hud.margin = 15;
    }
    
    // 标签
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont systemFontOfSize:15];
    // 隐藏后回调
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
    
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)cx_addLayerDSPopUpAnimationToView:(UIView *)view {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D scale1 = CATransform3DMakeScale(0.3, 0.3, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.3;
    [view.layer addAnimation:animation forKey:@"DSPopUpAnimation"];
}

@end
