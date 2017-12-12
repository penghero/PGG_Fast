//
//  PGGCHViewController.m
//  PGG_Fast
//
//  Created by 陈鹏 on 2017/12/11.
//  Copyright © 2017年 penggege.CP. All rights reserved.
// https://github.com/penghero/PGG_Fast.git 代码地址

#import "PGGCHViewController.h"
#import "PGGTool.h"
#import "PGGButton.h"
#import "PGGTableViewCell.h"
#import "PGGCityViewController.h"
#import "PGGFindViewController.h"
#import <UIViewController+MMDrawerController.h>

static NSString *PGGTableCellID = @"https://github.com/penghero";
@interface PGGCHViewController ()<UITableViewDataSource,UITableViewDelegate>
/*各个属性*/
@property(nonatomic,retain,strong)UIView * toolView;
@property(nonatomic,retain,strong)PGGButton * icon_people;
@property(nonatomic,retain,strong)PGGButton * icon_ba;
@property(nonatomic,retain,strong)PGGButton * icon_msg;
@property(nonatomic,retain,strong)PGGButton * icon_smsg;
@property(nonatomic,retain,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * cell_img;
@property(nonatomic,strong)NSMutableArray * cell_title;


@end

@implementation PGGCHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createBG];
    [self addSubViewWithUI];
}
#pragma mark - 懒加载
- (NSMutableArray *)cell_title {
    if (!_cell_title) {
        _cell_title = [NSMutableArray arrayWithObjects:@"查找",@"设置",@"本地作品集",@"扫一扫", nil];
    }
    return _cell_title;
}
- (NSMutableArray *)cell_img {
    if (!_cell_img) {
        _cell_img = [NSMutableArray arrayWithObjects:@"search",@"setting",@"retweet",@"setting", nil];
    }
    return _cell_img;
}
- (UIView *)toolView {
    if (!_toolView) {
        _toolView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width-100, kScreen_Width-100)];
        _toolView.backgroundColor = [UIColor colorWithPatternImage:[PGGTool createImageWithColor:[UIColor whiteColor] frame:_toolView.frame]];
        _toolView.userInteractionEnabled = YES;
    }
    return _toolView;
}
- (PGGButton *)icon_people {
    if (!_icon_people) {
         _icon_people = [PGGButton buttonWithType:UIButtonTypeCustom];
        [_icon_people setImage:[UIImage imageNamed:@"head"] forState:UIControlStateNormal];
        [_icon_people setTitle:@"🔥鹏哥哥🔥" forState:UIControlStateNormal];
        _icon_people.titleLabel.font = [UIFont systemFontOfSize:20];
        [_icon_people setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _icon_people.titleLabel.textAlignment = NSTextAlignmentCenter;
        _icon_people.imageRect = CGRectMake(20, 10, 80, 80);
        _icon_people.titleRect = CGRectMake(0, 90, 120, 30);
        _icon_people.frame = CGRectMake((kScreen_Width-100-120)/2, 40, 120, 120);
    }
    return _icon_people;
}
- (PGGButton *)icon_ba {
    if (!_icon_ba) {
        _icon_ba = [PGGButton buttonWithType:UIButtonTypeCustom];
        [_icon_ba setImage:[UIImage imageNamed:@"post"] forState:UIControlStateNormal];
        [_icon_ba setTitle:@"八卦" forState:UIControlStateNormal];
        _icon_ba.titleLabel.font = [UIFont systemFontOfSize:20];
        [_icon_ba setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _icon_ba.titleLabel.textAlignment = NSTextAlignmentCenter;
        _icon_ba.imageRect = CGRectMake(25, 0, 20, 20);
        _icon_ba.titleRect = CGRectMake(0, 35, 70, 20);
        _icon_ba.frame = CGRectMake(10, (kScreen_Width - 100-120), 70, 70);
    }
    return _icon_ba;
}
- (PGGButton *)icon_msg {
    if (!_icon_msg) {
        _icon_msg = [PGGButton buttonWithType:UIButtonTypeCustom];
        [_icon_msg setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [_icon_msg setTitle:@"消息" forState:UIControlStateNormal];
        _icon_msg.titleLabel.font = [UIFont systemFontOfSize:20];
        [_icon_msg setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _icon_msg.titleLabel.textAlignment = NSTextAlignmentCenter;
        _icon_msg.imageRect = CGRectMake(25, 0, 20,20);
        _icon_msg.titleRect = CGRectMake(0, 35, 70, 20);
        _icon_msg.frame = CGRectMake(100, (kScreen_Width - 100-120), 70, 70);
    }
    return _icon_msg;
}
- (PGGButton *)icon_smsg {
    if (!_icon_smsg) {
        _icon_smsg = [PGGButton buttonWithType:UIButtonTypeCustom];
        [_icon_smsg setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [_icon_smsg setTitle:@"私信" forState:UIControlStateNormal];
        _icon_smsg.titleLabel.font = [UIFont systemFontOfSize:20];
        [_icon_smsg setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _icon_smsg.titleLabel.textAlignment = NSTextAlignmentCenter;
        _icon_smsg.imageRect = CGRectMake(25, 0, 20, 20);
        _icon_smsg.titleRect = CGRectMake(0, 35, 70, 20);
        _icon_smsg.frame = CGRectMake(200, (kScreen_Width - 100-120), 70, 70);
    }
    return _icon_smsg;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreen_Width-100, kScreen_Width-100, kScreen_Width-100) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = NO;
        _tableView.scrollEnabled = NO;
//        [_tableView registerClass:[PGGTableViewCell class] forCellReuseIdentifier:PGGTableCellID];
        [_tableView registerNib:[UINib nibWithNibName:@"PGGTableViewCell" bundle:nil]  forCellReuseIdentifier:PGGTableCellID];
    }
    return _tableView;
}

#pragma mark - 背景
- (void)createBG {
    self.view.backgroundColor = [UIColor greenColor];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [PGGTool createImageWithColor:[UIColor whiteColor] frame:self.view.frame];
    [self.view addSubview:imageview];
}
#pragma mark - 布局
- (void) addSubViewWithUI {
    [self.view addSubview:self.toolView];
    [self.toolView addSubview:self.icon_people];
    [self.toolView addSubview:self.icon_ba];
    [self.toolView addSubview:self.icon_msg];
    [self.toolView addSubview:self.icon_smsg];
    [self.view addSubview:self.tableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PGGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PGGTableCellID forIndexPath:indexPath];
    cell.titleImg.image = [UIImage imageNamed:self.cell_img[indexPath.row]];
    cell.titleLab.text = self.cell_title[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    通过indexPath.row 判定选中的cell 进行各自的页面跳转
    switch (indexPath.row) {
        case 0:{
            PGGCityViewController *city = [[PGGCityViewController alloc] init];
                //拿到我们的导航控制器，让它去push
            UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
            [nav pushViewController:city animated:NO];
                //当我们push成功之后，关闭我们的抽屉
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                    //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
                [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
            }];
            break;
        }
        case 1:{
            PGGFindViewController *find = [[PGGFindViewController alloc] init];
            UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
            [nav pushViewController:find animated:NO];
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
            }];
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
