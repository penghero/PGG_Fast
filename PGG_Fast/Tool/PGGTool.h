//
//  PGGTool.h
//  PGG_Fast
//
//  Created by 陈鹏 on 2017/12/11.
//  Copyright © 2017年 penggege.CP. All rights reserved.
// https://github.com/penghero/PGG_Fast.git 代码地址

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PGGTool : NSObject

/**
 返回纯色图片

 @param color <#color description#>
 @param rect <#rect description#>
 @return <#return value description#>
 */
+ (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)rect;
@end
