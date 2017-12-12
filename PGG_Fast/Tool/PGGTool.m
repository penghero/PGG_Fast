//
//  PGGTool.m
//  PGG_Fast
//
//  Created by 陈鹏 on 2017/12/11.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "PGGTool.h"
#import <UIKit/UIKit.h>


@implementation PGGTool

+ (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
