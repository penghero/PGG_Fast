//
//  PGGMainViewController.m
//  PGG_Fast
//
//  Created by 陈鹏 on 2017/12/11.
//  Copyright © 2017年 penggege.CP. All rights reserved.
// https://github.com/penghero/PGG_Fast.git 代码地址

#import "PGGMainViewController.h"
#import "PGGFollowViewController.h"
#import "PGGFindViewController.h"
#import "PGGCityViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <MMDrawerBarButtonItem.h>
#import "LLSegmentBarVC.h"


@interface PGGMainViewController ()

@property (nonatomic,weak) LLSegmentBarVC * segmentVC;//

@end

@implementation PGGMainViewController
#pragma mark - segmentVC
- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
            // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    弹出按钮
    UIButton *moreCourse = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [moreCourse setImage:[UIImage imageNamed:@"main_nav_more"] forState:UIControlStateNormal];
    [moreCourse addTarget:self action:@selector(moreCourseAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreCourse];
//   录像按钮
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraAction)];
    self.navigationItem.rightBarButtonItem = cameraButton;
    
        // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(50, 0, kScreen_Width-100, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
        // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"关注", @"发现", @"同城"];
    PGGFollowViewController *follow = [[PGGFollowViewController alloc] init];
    PGGFindViewController *find = [[PGGFindViewController alloc] init];
    PGGCityViewController *city = [[PGGCityViewController alloc] init];
        // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[follow,find,city]];
        // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor lightGrayColor]).itemSelectColor([UIColor orangeColor]).indicatorColor([UIColor orangeColor]);
    }];
}
#pragma mark - 弹出抽屉
-(void)moreCourseAction {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
#pragma mark - 进入录像
- (void)cameraAction {
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
        //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
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
