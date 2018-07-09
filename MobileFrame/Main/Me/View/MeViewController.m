//
//  MeViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/7/9.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "MeViewController.h"

#import "IMePresenter.h"
#import "IMePresenterCompl.h"

@interface MeViewController ()

@property(nonatomic,strong) id<IMePresenter> mePresentrt;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)initView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
