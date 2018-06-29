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
    
    self.dataArray = [[FMDBHelper sharedFMDBHelper] getAllPerson];

    _fmdbHelper = [FMDBHelper sharedFMDBHelper];
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
    
    [self addData];
    
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]; 
    }
    //方案 二
//    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d%d", [indexPath section], [indexPath row]];//以indexPath来唯一确定cell 
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell 
//    if (cell == nil) { 
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
//    }
    
    cell.backgroundColor = [UIColor RandomColor];
//    cell.imageView.backgroundColor = [UIColor RandomColor];
    cell.imageView.image = [UIImage imageNamed:@"alert_demo_love_icon"];
    Person *person = self.dataArray[indexPath.row];
    if (person.number == 0) {
        cell.textLabel.text = person.name;
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%@(第%ld次更新)",person.name,person.number];
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"age: %ld",person.age];

    return cell;
}


-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //添加一个删除按钮
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //先删数据 再删UI
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

    }];    
    //添加一个置顶按钮
    UITableViewRowAction *topAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
    }];
    topAction.backgroundColor = [UIColor blueColor];
    //添加一个编辑按钮
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    editAction.backgroundColor = [UIColor greenColor];
    
    return @[deleteAction, topAction, editAction];

}

//设置线条画满
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - 数据库操作

/**
 *  添加数据到数据库
 */
- (void)addData{
    
    NSLog(@"addData");
    
    int nameRandom = arc4random_uniform(1000);
    NSInteger ageRandom  = arc4random_uniform(100) + 1;
    
    NSString *name = [NSString stringWithFormat:@"person_%d号",nameRandom];
    NSInteger age = ageRandom;
    
    Person *person = [[Person alloc] init];
    person.name = name;
    person.age = age;
    
    [[FMDBHelper sharedFMDBHelper] addPerson:person];
    self.dataArray = [[FMDBHelper sharedFMDBHelper] getAllPerson];
    [self.tableView reloadData];
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
