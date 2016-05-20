//
//  ViewController.m
//  MutiImageTableViewTest
//
//  Created by 刘豪亮 on 16/3/29.
//  Copyright © 2016年 邵创. All rights reserved.
//

#import "ViewController.h"
#import "YMTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray* dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = @[@(1),@(2),@(3),@(4),@(5),@(6),@(7),@(8),@(9)];
    [self.tableView registerNib:[UINib nibWithNibName:@"YMTableViewCell" bundle:nil] forCellReuseIdentifier:@"YMTableViewCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger imageCount = [self.dataArr[indexPath.row] integerValue];
        return [YMTableViewCell cellHeightWithImageCount:imageCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger imageCount = [self.dataArr[indexPath.row] integerValue];
    YMTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"YMTableViewCell" forIndexPath:indexPath];
    [cell updateWithImageCount:imageCount];
    return cell;
}

@end
