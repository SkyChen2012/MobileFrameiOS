//
//  TheoryViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "TheoryViewController.h"

#import "LifeCycleViewController.h"
#import "MultithreadViewController.h"
#import "RunTimeViewController.h"
#import "ProtocolOptionalViewController.h"
#import "BlockLoopViewController.h"
#import "DataSourceViewController.h"
#import "CADisplayLinkViewController.h"
#import "UIBezierPathViewController.h"
#import "CGContextViewController.h"
#import "AnimationHomeViewController.h"
#import "FMDBViewController.h"

@interface TheoryViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray    *dataArray;
@property (nonatomic,strong) UITableView    *myTableView;

@property (nonatomic,strong) DelegateCodeStandards *codeStandards,*otherCodeStandards;

@end

@implementation TheoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    self.navigationItem.title=@"基础知识点";
    
    [self setupTableController];
    
}

- (void)setupTableController{
    
    if (!self.dataArray) {
        self.dataArray=@[@"viewController生命周期",@"运行时RunTime知识运用",@"多线程知识运用",@"Protocol实现类",@"Block内存释放知识点",@"TableViewDataSource提取",@"CADisplayLink知识运用",@"CAShapeLayer与UIBezierPath知识运用",@"CGContext知识点运用",@"Animation动画",@"FMDB 数据库"];
    }
    
    //初始化表格
    if (!_myTableView) {
        _myTableView                                = [[UITableView alloc] initWithFrame:CGRectMake(0,0.5, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
        _myTableView.showsVerticalScrollIndicator   = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.dataSource                     = self;
        _myTableView.delegate                       = self;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.view addSubview:_myTableView];
        [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource, UITableViewDelegate相关内容

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", [indexPath section], [indexPath row]];//以indexPath来唯一确定cell 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell 
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text   = self.dataArray[indexPath.row];
    cell.backgroundColor = [UIColor RandomColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc;
    
    switch (indexPath.row) {
        
        case 0:
            vc = [[LifeCycleViewController alloc] init];
            break;
        
        case 1:
            vc = [[RunTimeViewController alloc] init];
            break;
        
        case 2:
            vc = [[MultithreadViewController alloc] init];
            break;
        
        case 3:
            vc = [[ProtocolOptionalViewController alloc] init];
            break;
        
        case 4:
            vc = [[BlockLoopViewController alloc] init];
            break;
        
        case 5:
            vc = [[DataSourceViewController alloc] init];
            break;
        
        case 6:
            vc = [[CADisplayLinkViewController alloc] init];
            break;
        
        case 7:
            vc = [[UIBezierPathViewController alloc] init];
            break;
        
        case 8:
            vc = [[CGContextViewController alloc] init];
            break;
            
        case 9:
            vc = [[AnimationHomeViewController alloc] init];
            break;
            
        case 10:
            vc = [[FMDBViewController alloc] init];
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - CodeStandardsDelegate

-(NSString *)selectIndexFetcher:(DelegateCodeStandards *)codestandards withIndex:(NSInteger)index
{
    if (codestandards ==_codeStandards) {
        DDLogInfo(@"_codeStandards 当前的值为：%ld",index);
        DDLogInfo(@"_codeStandards 当前的名字为：%@",codestandards.userName);
        return codestandards.userName;
    }
    else if (codestandards==_otherCodeStandards)
    {
        DDLogInfo(@"_otherCodeStandards 当前的值为：%ld",index);
        DDLogInfo(@"_otherCodeStandards 当前的名字为：%@",codestandards.userName);
        return codestandards.userName;
    }
    return @"";
}

-(void)networkFetcher:(DelegateCodeStandards *)codestandards didReceiveName:(NSString *)name
{
    DDLogInfo(@"networkFetcher %@",name);
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
