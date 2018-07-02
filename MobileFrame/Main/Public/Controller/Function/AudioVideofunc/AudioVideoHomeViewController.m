//
//  AudioVideoHomeViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/7/2.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "AudioVideoHomeViewController.h"
#import "AudioToolboxViewController.h"
#import "AVFoundationViewController.h"
#import "PlayerViewController.h"
#import "VideoClipViewController.h"
#import "VideoRecordingViewController.h"

@interface AudioVideoHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray             *dataArray;
@property (nonatomic,strong) UITableView         *myTableView;

@end

@implementation AudioVideoHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    
    
}

-(void)initData{
    _dataArray = [NSArray arrayWithObjects:@"音效(AudioToolbox)运用",@"音乐AVFoundation运用",@"音乐库中的音乐MPMediaPickerController",@"视频剪编效果的实例",@"视频录制合成实例", nil];
}

-(void)initView{
    
    if (_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0.5, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.view addSubview:_myTableView];
        [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}

#pragma mark - UITableView DataSource Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"audioVideo"; 
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出 
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]; 
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc;
    
    switch (indexPath.row) {
        case 0:
            vc = [[AudioToolboxViewController alloc] init];
            break;
        case 1:
            vc = [[AVFoundationViewController alloc] init];
            break;
        case 2:
            vc = [[PlayerViewController alloc] init];
            break;
        case 3:
            vc = [[VideoClipViewController alloc] init];
            break;
        case 4:
            vc = [[VideoRecordingViewController alloc] init];
            break;
        default:
            break;
    }
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - 重写BaseViewController设置内容

//设置导航栏背景色
-(UIColor*)set_colorBackground
{
    return [UIColor RandomColor];
}

//设置标题
-(NSMutableAttributedString*)setTitle
{
    return [self changeTitle:@"音视频功能集合"];
}

//设置左边按键
-(UIButton*)set_leftButton
{
    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
    return left_button;
}

//设置左边事件
-(void)left_button_event:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 自定义代码区

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    return title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
