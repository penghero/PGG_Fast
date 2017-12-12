//
//  PGGButton.m
//  PGG_Fast
//
//  Created by 陈鹏 on 2017/12/12.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "PGGButton.h"

@implementation PGGButton
/* 去掉button高亮状态 */
- (void)setHighlighted:(BOOL)highlighted{
    
}
/* 对文字重布局 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}
/* 对图片重布局 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
