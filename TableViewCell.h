//
//  TableViewCell.h
//  FoldCell
//
//  Created by wsk on 2017/8/1.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol foldDelegate <NSObject>

- (void)foldCellContent:(NSIndexPath *)indexPath;

@end

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *foldBtn;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) id<foldDelegate>delegate;

@end
