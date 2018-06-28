//
//  FMDBViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/6/28.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "FMDBViewController.h"
#import "FMDBHelper.h"

@interface FMDBViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) FMDBHelper *fmdbHelper;
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    
    // Do any additional setup after loading the view.
}

-(void)initData{
    _fmdbHelper = [FMDBHelper sharedFMDBHelper];
    
    _dataArray = [[NSMutableArray alloc] init];
}

-(void)initView{
    
    if (!self.tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0.5, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
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

-(UIButton *)set_rightButton{
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor RandomColor];
    return btn;
}

-(void)right_button_event:(UIButton *)sender{
    NSLog(@"add ...");
}


////设置标题
-(NSMutableAttributedString*)setTitle
{
    return [self changeTitle:@"FMDB"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    return title;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //方案 一
    static NSString *CellIdentifier = @"Cell"; 
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出 
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
    }
    //方案 二
//    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d%d", [indexPath section], [indexPath row]];//以indexPath来唯一确定cell 
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell 
//    if (cell == nil) { 
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
//    }
    
    
    cell.backgroundColor = [UIColor RandomColor];
    
    return cell;
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
