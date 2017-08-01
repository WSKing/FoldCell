//
//  MineModel.h
//  FoldCell
//
//  Created by wsk on 2017/8/1.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MineModel : NSObject
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSArray <UIImage *> *imgList;
@property (nonatomic, assign) CGFloat defaultHeight;

- (void)calculateHeight;
@end
