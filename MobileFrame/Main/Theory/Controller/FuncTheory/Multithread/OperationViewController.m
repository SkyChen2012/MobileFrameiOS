//
//  OperationViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/23.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "OperationViewController.h"

@interface OperationViewController ()



@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"NSOperation";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    
    [btn setTitle:@"NSOperation" forState:UIControlStateNormal];
    [btn setTitle:@"viewDidLoad" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-100);
        make.left.equalTo(self.view.mas_left).offset(100);
    }];
    
    
    [self addOperationFormInvocation];
    [self addAsynsOperationFromInvocation];
    [self addOperationFormBlock];
    [self addAsnysOperationFormBlock];
    [self addMaxConcurrentOperation];
    [self addDependency];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------------------------------------------------------------------------------------------
//理论知识：
//NSOperation是苹果提供给我们的一套多线程解决方案。实际上NSOperation是基于GCD更高一层的封装，但是比GCD更简单易用、代码可读性也更高。
//NSOperation需要配合NSOperationQueue来实现多线程。因为默认情况下，NSOperation单独使用时系统同步执行操作，并没有开辟新线程的能力，只有配合NSOperationQueue才能实现异步执行

//------------------------------------------------------------------------------------------
//步骤3
//创建任务：先将需要执行的操作封装到一个NSOperation对象中。
//创建队列：创建NSOperationQueue对象。
//将任务加入到队列中：然后将NSOperation对象添加到NSOperationQueue中。

//------------------------------------------------------------------------------------------
//创建队列
//NSOperationQueue一共有两种队列：主队列、其他队列
//主队列 NSOperationQueue *queue = [NSOperationQueue mainQueue]; 凡是添加到主队列中的任务（NSOperation），都会放到主线程中执行
//其他队列（非主队列） NSOperationQueue *queue = [[NSOperationQueue alloc] init]; 就会自动放到子线程中执行 同时包含了：串行、并发功能

//------------------------------------------------------------------------------------------
//NSOperation是个抽象类，并不能封装任务。我们只有使用它的子类来封装任务。我们有三种方式来封装任务。
//
//使用子类NSInvocationOperation
//使用子类NSBlockOperation
//定义继承自NSOperation的子类，通过实现内部相应的方法来封装任务

//------------------------------------------------------------------------------------------
//其它知识点
//- (void)cancel; NSOperation提供的方法，可取消单个操作
//- (void)cancelAllOperations; NSOperationQueue提供的方法，可以取消队列的所有操作
//- (void)setSuspended:(BOOL)b; 可设置任务的暂停和恢复，YES代表暂停队列，NO代表恢复队列
//- (BOOL)isSuspended; 判断暂停状态
//------------------------------------------------------------------------------------------

#pragma mark - NSOperation

//一：NSInvocationOperation子类+主队列  (主线程中执行)
- (void)addOperationFormInvocation{
    
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(runAction:) object:@""];
    [op start];    
}
- (void)runAction:(NSString *)str{
    
    NSLog(@"当前NSInvocationOperation执行的线程为：%@ str = %@", [NSThread currentThread],str);
//  在没有使用NSOperationQueue、单独使用NSInvocationOperation的情况下，NSInvocationOperation在主线程执行操作，并没有开启新线程。
}

//二：NSInvocationOperation子类+非主队列  (新开线程中执行)
- (void)addAsynsOperationFromInvocation{
    NSOperationQueue *queue = [NSOperationQueue new];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(runAsynAction) object:nil];
    [queue addOperation:op];
}
- (void)runAsynAction{
    NSLog(@"当前addAsnysOperationFormInvocation执行的线程为：%@", [NSThread currentThread]);
//  创建NSOperationQueue队列，并把NSInvocationOperation加入则会新开一个线程来执行。
}

//三：使用子类- NSBlockOperation 主线程执行
-(void)addOperationFormBlock{
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperation当前的线程：%@", [NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        if (![NSThread currentThread].name) {
            [[NSThread currentThread] setName:@"22"];
        }
        NSLog(@"NSBlockOperation当前的线程2------%@", [NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        if (![NSThread currentThread].name) {
            [[NSThread currentThread] setName:@"11"];
        }
        NSLog(@"NSBlockOperation当前的线程2------%@", [NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        if (![NSThread currentThread].name) {
            [[NSThread currentThread] setName:@"22"];
        }
        NSLog(@"NSBlockOperation当前的线程2------%@", [NSThread currentThread]);
    }];
    
    [op start];
}


//四：使用子类- NSBlockOperation 子线程执行 加入非主队列
-(void)addAsnysOperationFormBlock{
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"addAsnysOperationFormBlock当前的线程：%@", [NSThread currentThread]);

    }];
    
    // 添加额外的任务（部分在新的子线程运行）
    [op addExecutionBlock:^{
        NSLog(@"addAsnysOperationFormBlock当前的线程2------%@", [NSThread currentThread]);
    }];
    [op addExecutionBlock:^{
        NSLog(@"addAsnysOperationFormBlock当前的线程3------%@", [NSThread currentThread]);
    }];
    [op addExecutionBlock:^{
        NSLog(@"addAsnysOperationFormBlock当前的线程4------%@", [NSThread currentThread]);
    }];
    
    [queue addOperation:op];
}

//五：maxConcurrentOperationCount设置 并发或串行
-(void)addMaxConcurrentOperation{
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    //并发操作的最大值：你可以设定NSOperationQueue可以并发运行的最大操作数。NSOperationQueue会选择去运行任何数量的并发操作，但是不会超过最大值
    queue.maxConcurrentOperationCount = 10;
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        // 在子线程
        NSLog(@"addMaxConcurrentOperation当前的线程：%@", [NSThread currentThread]);
    }];
    
    // 添加额外的任务（部分在新的子线程运行）
    [op addExecutionBlock:^{
        NSLog(@"addMaxConcurrentOperation当前的线程2------%@", [NSThread currentThread]);
    }];
    [op addExecutionBlock:^{
        NSLog(@"addMaxConcurrentOperation当前的线程3------%@", [NSThread currentThread]);
    }];
    [op addExecutionBlock:^{
        NSLog(@"addMaxConcurrentOperation当前的线程4------%@", [NSThread currentThread]);
    }];
    
    [queue addOperation:op];
    
//    说明：
//    maxConcurrentOperationCount默认情况下为-1，表示不进行限制，默认为并发执行。
//    当maxConcurrentOperationCount为1时，进行串行执行。
//    当maxConcurrentOperationCount大于1时，进行并发执行，当然这个值不应超过系统限制，即使自己设置一个很大的值，系统也会自动调整

}

//六：定义继承自NSOperation的子类
-(void)addChildNSOperation{
    
}

//七：操作依赖
-(void)addDependency
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"addDependency1当前线程%@", [NSThread  currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"addDependency2当前线程%@", [NSThread  currentThread]);
    }];
    
    [op1 addDependency:op2];    // 让op1 依赖于 op2，则先执行op2，在执行op1
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    
    
    //输出
    //    addDependency2当前线程<NSThread: 0x60000027c200>{number = 12, name = (null)}
    //    addDependency1当前线程<NSThread: 0x608000262900>{number = 9, name = (null)}
}
@end
