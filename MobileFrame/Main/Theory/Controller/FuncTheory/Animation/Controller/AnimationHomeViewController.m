//
//  AnimationHomeViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/6/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "AnimationHomeViewController.h"
#import "AnimationViewController.h"
#import "KeyFrameAnimationController.h"
#import "GroupAnimationViewController.h"
#import "TransitionformAnimationViewController.h"
#import "AffineTransfromAnimationViewController.h"
#import "ComprehesiveCaseViewController.h"


@interface AnimationHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation AnimationHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"动画基础";
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initView{
    [self initData];
    
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0.5 , Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    
}

-(void)initData{
    if (!self.dataArray) {
        self.dataArray = [NSArray arrayWithObjects:@"基础动画",@"关键帧动画",@"组合动画",@"过渡动画",@"仿射变化动画",@"综合案例", nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
        {
            vc = [[AnimationViewController alloc] init];
            break;
        }
        case 1:
        {
            vc = [[KeyFrameAnimationController alloc] init];
            break;
        }
        case 2:
        {
            vc = [[GroupAnimationViewController alloc] init];
            break;
        }
        case 3:
        {
            vc = [[TransitionformAnimationViewController alloc] init];
            break;
        }
        case 4:
        {
            vc = [[AffineTransfromAnimationViewController alloc] init];
            break;
        }
        case 5:
        {
            vc = [[ComprehesiveCaseViewController alloc] init];
            break;
        }
        case 6:
        {
            break;
        }
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
