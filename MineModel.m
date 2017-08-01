//
//  MineModel.m
//  FoldCell
//
//  Created by wsk on 2017/8/1.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import "MineModel.h"

@implementation MineModel
- (void)calculateHeight {
   self.height = [self.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
}

- (CGFloat)defaultHeight {
    if (self.imgList.count) {
        return 80 + 80;
    }else {
        return 80;
    }
}
@end
