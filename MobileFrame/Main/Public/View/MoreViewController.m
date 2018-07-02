//
//  MoreViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/7/2.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "MoreViewController.h"

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
    _dataArray = [NSArray arrayWithObjects:@"AudioVideofunc", nil];
}

- (void)initView{
    
    if (_tableView) {
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
    //0.设置标识符
    static NSString *ID = @"moreView";
    //1.根据标识符在缓存池中复用uitableviewcell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ID];
    //2.如果cell为空，重新创建一个带有标识符的uitableviewcell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ID];
    }
    //3.覆盖数据
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
