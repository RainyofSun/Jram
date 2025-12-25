//
//  SEMineViewController.m
//  股票18
//
//  Created by 周群 on 2019/7/13.
//  Copyright © 2019 周群. All rights reserved.
//

#import "FTOrderVC.h"
#import "FTNoDataView.h"
#import "FTOrderCell.h"

@interface FTOrderVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *s_titBtnArr;
@property (nonatomic, strong)UITableView    *s_tableView;
@property (nonatomic, strong)NSArray        *s_dataArr;
@property (nonatomic, strong)FTNoDataView   *s_noDataView;
@property (nonatomic, assign)BOOL            s_hasBool;
@property (nonatomic, assign)int             s_index;

@end

@implementation FTOrderVC

- (void)configWithStr:(NSString *)index
{
    if (self.s_hasBool) {
        for (int k = 0; k < self.s_titBtnArr.count; k++) {
            UIButton *btn = [self.s_titBtnArr safe_objectAtIndex:k];
            btn.selected = NO;
            if (index.intValue == k) {
                btn.selected = YES;
            }
        }
        [self.s_tableView.mj_header beginRefreshing];
    }else{
        self.s_index = index.intValue;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.s_hasBool = YES;
    [self initNaviBarWithTitle:@"Order" LeftImage:nil leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    [self addSubViews];
}

- (FTNoDataView *)s_noDataView
{
    if (!_s_noDataView) {
        _s_noDataView = [[FTNoDataView alloc]initWithFrame:self.s_tableView.bounds];
        [_s_noDataView configWithPlaceTextStr:@"There are no orders yet." placeImageStr:@"Order_no_place_Image"];
        [self.s_tableView addSubview:_s_noDataView];
    }
    return _s_noDataView;
}

- (UITableView *)s_tableView{
    if (!_s_tableView) {
        _s_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavBarHeight + 32 + 15 + 15, kSCREEN_WIDTH, kSCREEN_HEIGHT - (NavBarHeight + 32 + 15 + 15)) style:UITableViewStylePlain] ;
        _s_tableView.showsHorizontalScrollIndicator = NO;
        _s_tableView.backgroundColor = [UIColor clearColor];
        [_s_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _s_tableView.showsVerticalScrollIndicator = NO;
        _s_tableView.delegate = self;
        _s_tableView.dataSource = self;
        _s_tableView.estimatedRowHeight = 0;
        _s_tableView.estimatedSectionHeaderHeight = 0;
        _s_tableView.estimatedSectionFooterHeight = 0;
        _s_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _s_tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 0)];
        _s_tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 0)];
        if (@available(iOS 15.0, *)) {
            _s_tableView.sectionHeaderTopPadding = 0;
        }
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(snowssmith)];
        header.stateLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        
        _s_tableView.mj_header = header;
        [self snowssmith];
    }
    return _s_tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.s_dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *celldequeuntifier = @"FTOrderCell";
    FTOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:celldequeuntifier];
    if (!cell) {
        cell = [[FTOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celldequeuntifier];
    }
    cell.m_dic = [self.s_dataArr safe_objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.s_dataArr safe_objectAtIndex:indexPath.row];
    NSString *str = [dic stringForKey:@"rap"];
    if ([str containsString:@"http"]) {
        FTWebViewVC *vc = [FTWebViewVC new];
        vc.m_urlStr = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([str containsString:@"setting"]){
        FTSettingVC *vc = [FTSettingVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([str containsString:@"main"]){
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        MainTabViewController *vc = (MainTabViewController *)appDelegatE.window.rootViewController;
        vc.selectedIndex = 0;
    }else if ([str containsString:@"login"]){
        [FTCommonObject loginAction];
    }else if ([str containsString:@"order"]){
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        MainTabViewController *vc = (MainTabViewController *)appDelegatE.window.rootViewController;
        vc.selectedIndex = 1;
    }else{
        NSArray *arr = [str componentsSeparatedByString:@"?"];
        NSString *lastStr = arr.lastObject;
        NSArray *lastArr = [lastStr componentsSeparatedByString:@"="];
        FTDetailVC *vc = [FTDetailVC new];
        vc.m_productIdStr = lastArr.lastObject;
        WEAK_SELF
        vc.block = ^(NSString * _Nonnull str) {
            STRONG_SELF
            FTWebViewVC *vc = [FTWebViewVC new];
            vc.m_urlStr = str;
            [self.navigationController pushViewController:vc animated:YES];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [self.s_dataArr safe_objectAtIndex:indexPath.row];
    NSArray *arr = [dic arrayForKey:@"official"];
    return arr.count * 28 + 125;
}

- ( UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = UIColorFromRGB(MainGrayBackGroundColor);
    return headerView;
}


- (void)snowssmith
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (UIButton *btn in self.s_titBtnArr) {
        if (btn.selected) {
            if (btn.tag == 0) {
                [dic safe_setObject:@"7" forKey:@"hosts"];
            }else if (btn.tag == 1) {
                [dic safe_setObject:@"6" forKey:@"hosts"];
            }else if (btn.tag == 2) {
                [dic safe_setObject:@"5" forKey:@"hosts"];
            }
        }
    }
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowssmith parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        [self.s_tableView.mj_header endRefreshing];
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            self.s_dataArr = [dic arrayForKey:@"alicent"];
        }
        [self.s_tableView reloadData];
        self.s_noDataView.hidden = self.s_dataArr.count > 0;
    } failure:^(NSError *error) {
        STRONG_SELF
        self.s_noDataView.hidden = self.s_dataArr.count > 0;
    }];
}

- (void)addSubViews
{
    self.s_titBtnArr = [NSMutableArray array];
    NSArray *titArr = [NSArray arrayWithObjects:@"Apply",@"Repayment",@"Finished", nil];
    CGFloat x = 15;
    for (int k = 0; k < titArr.count; k++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x,NavBarHeight + 15, (kSCREEN_WIDTH - 30 - 20)/3, 32)];
        [btn setBackgroundColor:UIColorFromRGB(0x49C9A5) forState:UIControlStateSelected];
        [btn setBackgroundColor:UIColorFromRGB(MainWhiteColor) forState:UIControlStateNormal];
        [btn.titleLabel setFont:FTBoldFont(14)];
        [btn setTitleColor:UIColorFromRGB(MainWhiteColor) forState:UIControlStateSelected];
        [btn setTitleColor:UIColorFromRGB(0x006D54) forState:UIControlStateNormal];
        [btn roundedRect:10 borderWidth:0.6 borderColor:UIColorFromRGB(0xe3e3e3)];
        [btn setTitle:[titArr safe_objectAtIndex:k] forState:UIControlStateNormal];
        [self.s_titBtnArr safe_addObject:btn];
        btn.tag = k;
        [btn addTarget:self action:@selector(titBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        if (self.s_index > 0) {
            btn.selected = k == self.s_index;
        }else{
            btn.selected = k == 0;
        }
        x = btn.right + 10;
        
    }
    
    [self.view addSubview:self.s_tableView];
    [self.s_tableView.mj_header beginRefreshing];
    
}

- (void)titBtnAction:(UIButton *)btn
{
    for (UIButton *bbttnn in self.s_titBtnArr) {
        bbttnn.selected = NO;
    }
    btn.selected = YES;
    [self.s_tableView.mj_header beginRefreshing];
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
