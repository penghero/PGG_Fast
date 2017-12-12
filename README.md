# PGG_Fast
仿照快手
高仿快手架构布局 简单易懂 适合新手学习 
# 展示
![image](https://github.com/penghero/PGG_Fast/blob/master/gif/Untitle2.gif)
# 部分讲解
APPDelegate代码 布局侧滑
static void createWindow(AppDelegate *object) {

    object.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    object.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:[[PGGMainViewController alloc] init]];
    centerNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    centerNav.navigationBar.tintColor = [UIColor lightGrayColor];
    centerNav.navigationBar.barTintColor = [UIColor whiteColor];
    PGGCHViewController *left = [[PGGCHViewController alloc] init];
    object.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNav leftDrawerViewController:left];
    [object.drawerController setShowsShadow:NO];//设置是否有阴影
    [object.drawerController setShouldStretchDrawer:NO];//设置是否回弹效果
    [object.drawerController setMaximumLeftDrawerWidth:kScreen_Width-100];//最大距离
    [object.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [object.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [object.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {      
    }];
    object.window.rootViewController = object.drawerController;
    [object.window makeKeyWindow];
}

主页代码 布局segment滑动控制器

    UIButton *moreCourse = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [moreCourse setImage:[UIImage imageNamed:@"main_nav_more"] forState:UIControlStateNormal];
    [moreCourse addTarget:self action:@selector(moreCourseAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreCourse];
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
    
 自定义Button的应用 图片文字共存  类PGGButton中是自定义Button代码
 
        _icon_smsg = [PGGButton buttonWithType:UIButtonTypeCustom];
        [_icon_smsg setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [_icon_smsg setTitle:@"私信" forState:UIControlStateNormal];
        _icon_smsg.titleLabel.font = [UIFont systemFontOfSize:20];
        [_icon_smsg setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _icon_smsg.titleLabel.textAlignment = NSTextAlignmentCenter;
        _icon_smsg.imageRect = CGRectMake(25, 0, 20, 20);
        _icon_smsg.titleRect = CGRectMake(0, 35, 70, 20);
        _icon_smsg.frame = CGRectMake(200, (kScreen_Width - 100-120), 70, 70);
        
# 联系
有问题可与我联系 896733185@qq.com 
# 感谢
感谢 MMDrawerController侧滑的作者优秀代码 cocoapods可直接倒入使用 
感谢 LLSegmentBarConfig作者的优秀代码 
有你们开源更精彩 ！！！
