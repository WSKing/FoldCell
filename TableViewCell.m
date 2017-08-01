//
//  TableViewCell.m
//  FoldCell
//
//  Created by wsk on 2017/8/1.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)foldAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(foldCellContent:)]) {
        [self.delegate foldCellContent:self.indexPath];
    }
}

@end
