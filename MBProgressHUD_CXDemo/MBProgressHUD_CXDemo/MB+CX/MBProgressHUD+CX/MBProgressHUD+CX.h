//
//  MBProgressHUD+CX.h
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/12/27.
//  Copyright © 2018 xuchen. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (CX)

// MARK: - 显示提示文字,自动消失

/**
 快速显示一个文本提示信息
 */
+ (void)cx_showTipText:(NSString *)text;
/**
 快速显示一个文本提示信息，几秒后消失
 */
+ (void)cx_showTipText:(NSString *)text autoHideTime:(NSTimeInterval)second;
/**
 快速显示一个文本提示信息，父视图,几秒后消失
 */
+ (void)cx_showTipText:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second;
/**
 快速显示一个文本提示信息，几秒后消失，消失回调
 */
+ (void)cx_showTipText:(NSString *)text autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock;
/**
 显示一个文本提示信息，父视图,几秒后消失，消失回调
 */
+ (void)cx_showTipText:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock;


// MARK: - 显示提示图片和文字,自动消失

// MARK: - 成功提示

/**
 快速显示一个成功提示
 */
+ (void)cx_showSuccessTip:(NSString *)text;
/**
 显示一个成功提示，父视图，几秒后消失，消失回调
 */
+ (void)cx_showSuccessTip:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock;


// MARK: - 失败提示

/**
 快速显示一个失败提示
 */
+ (void)cx_showErrorTip:(NSString *)text;
/**
 显示一个失败提示，父视图，几秒后消失，消失回调
 */
+ (void)cx_showErrorTip:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock;


// MARK: - 警告提示

/**
 快速显示一个警告提示
 */
+ (void)cx_showWarningTip:(NSString *)text;
/**
 显示一个警告提示，父视图，几秒后消失，消失回调
 */
+ (void)cx_showWarningTip:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock;


// MARK: - 加载中提示

/**
 快速显示一个带默认文本的加载中提示
 */
+ (void)cx_showLoading;
/**
 显示一个带默认文本加载中提示，父视图
 */
+ (void)cx_showLoadingInView:(UIView *)view;
/**
 显示一个带指定文本加载中提示
 */
+ (void)cx_showLoadingTip:(NSString *)text;
/**
 显示一个带指定文本加载中提示，父视图
 */
+ (void)cx_showLoadingTip:(NSString *)text inView:(UIView *)view;


// MARK: - 空白页的加载中提示

/**
 空白页的加载中默认文本提示，父视图
 */
+ (void)cx_showEmptyLoadingInView:(UIView *)view;
/**
 空白页的加载中指定文本提示，父视图
 */
+ (void)cx_showEmptyLoadingTip:(NSString *)text inView:(UIView *)view;


// MARK: - 隐藏HUD

+ (void)cx_hideHUDForView;
+ (void)cx_hideHUDForView:(UIView *)view;


///**
// 显示一个带有图片、文字的提示框
//
// @param iconName 图片名
// @param isGif 是否是GIF图
// @param text 文字
// @param view 父视图
// @param second 几秒后消失
// @param completionBlock 消失回调
// */
//+ (void)cx_showTipIcon:(NSString *)iconName isGifImage:(BOOL)isGif text:(NSString *)text inView:(UIView *)view autoHideTime:(NSTimeInterval)second completionBlock:(void(^)(void))completionBlock;



@end

