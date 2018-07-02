//
//  AudioToolboxViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/7/2.
//  Copyright © 2018年 Benson. All rights reserved.
//
//知识点：
//1:System Sound Service是一种简单、底层的声音播放服务，但是它本身也存在着一些限制：
//音频播放时间不能超过30s
//数据必须是PCM或者IMA4格式
//音频文件必须打包成.caf、.aif、.wav中的一种

//2:使用System Sound Service 播放音效的步骤如下
//调用AudioServicesCreateSystemSoundID(   CFURLRef  inFileURL, SystemSoundID*   outSystemSoundID)函数获得系统声音ID。
//如果需要监听播放完成操作，则使用AudioServicesAddSystemSoundCompletion(  SystemSoundID inSystemSoundID,
//                                                      CFRunLoopRef  inRunLoop, CFStringRef  inRunLoopMode, AudioServicesSystemSoundCompletionProc  inCompletionRoutine, void*  inClientData)方法注册回调函数。
//调用AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID) 或者AudioServicesPlayAlertSound(SystemSoundID inSystemSoundID) 方法播放音效（后者带有震动效果）。


#import "AudioToolboxViewController.h"

#import <AudioToolbox/AudioToolbox.h>

@interface AudioToolboxViewController ()

@property(nonatomic,strong) UIButton *playBtn;

@end

@implementation AudioToolboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];

}


-(void)initView{
    
    if (_playBtn) {
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 20, 20)];
        [_playBtn setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

-(void)onClick:(UIButton *)btn{
    
    [self playSoundEffect:@"videoRing.caf"];
}


#pragma mark - AudioToolbox
/**
 *  播放完成回调函数
 *
 *  @param soundID    系统声音ID
 *  @param clientData 回调时传递的数据
 */
void soundCompleteCallback(SystemSoundID soundID,void * clientData){
    NSLog(@"播放完成...");
}

/**
 *  播放音效文件
 *
 *  @param name 音频文件名称
 */
-(void)playSoundEffect:(NSString *)name{
    NSString *audioFile=[[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *fileUrl=[NSURL fileURLWithPath:audioFile];
    //1.获得系统声音ID
    SystemSoundID soundID=0;
    /**
     * inFileUrl:音频文件url
     * outSystemSoundID:声音id（此函数会将音效文件加入到系统音频服务中并返回一个长整形ID）
     */
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    //如果需要在播放完之后执行某些操作，可以调用如下方法注册一个播放完成回调函数
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    //2.播放音频
    AudioServicesPlaySystemSound(soundID);//播放音效
    //    AudioServicesPlayAlertSound(soundID);//播放音效并震动
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
