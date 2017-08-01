//
//  ViewController.m
//  FoldCell
//
//  Created by wsk on 17/7/28.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "MineModel.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, foldDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *selectedIndexs;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   NSString *contentString = @"其实我很早就说过，把我们的故事和经历写出来，等你出轨了甩在你脸上，然后潇洒而去，让你余生在后悔中度过。看吧，我从未变过，还是你初识的那个小太妹，霸道，强势，一点都不温柔。甚至你都拒绝我的追求。说起这些我还是心有不甘，人生就谈过一个对象，还是自己追的。对此我后悔莫及。你总是说我身在福中不知福。好吧！我勉强承认";
    for (NSInteger i = 0; i < 5 ; i ++) {
        MineModel *model = [[MineModel alloc] init];
        model.content = contentString;
        [model calculateHeight];
        [self.dataList addObject:model];
    }
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineModel *model = self.dataList[indexPath.row];
    if ([self.selectedIndexs containsObject:indexPath]) {
        return model.height + 20;
    }else
        return model.defaultHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TableViewCell class]) owner:nil options:nil].lastObject;
    MineModel *model = self.dataList[indexPath.row];
    cell.commentLabel.text = model.content;
    cell.delegate = self;
    cell.indexPath = indexPath;
    if ([self.selectedIndexs containsObject:indexPath]) {
        [cell.foldBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    }else {
        [cell.foldBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)foldCellContent:(NSIndexPath *)indexPath {
    if ([self.selectedIndexs containsObject:indexPath]) {
        [self.selectedIndexs removeObject:indexPath];
    }else {
        [self.selectedIndexs addObject:indexPath];
    }
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}


#pragma mark --getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
        
    }
    return _tableView;
}

- (NSMutableArray *)selectedIndexs {
    if (!_selectedIndexs) {
        _selectedIndexs = [NSMutableArray array];
    }
    return _selectedIndexs;
}

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
