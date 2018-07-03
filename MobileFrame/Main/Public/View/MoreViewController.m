//
//  MoreViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/7/2.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "MoreViewController.h"

#import "AudioVideoHomeViewController.h"

@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong ) NSArray  *dataArray;
@property (nonatomic ,strong ) UITableView  *tableView; 
 
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initView];
    
}
    

- (void)initData{
    if (!_dataArray) {
        _dataArray = @[@"AudioVideofunc"];
    }
}

- (void)initView{
    
    self.view.backgroundColor=[UIColor clearColor];
    
    if (!_tableView) {
        _tableView                                = [[UITableView alloc] initWithFrame:CGRectMake(0,0.5, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator   = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.dataSource                     = self;
        _tableView.delegate                       = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

#pragma mark 每当有一个cell进入桌面 调用方法，返回当前行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc;
    
    switch (indexPath.row) {
        case 0:
            vc = [[AudioVideoHomeViewController alloc] init];
            break;
            
        default:
            break;
    }
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
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
