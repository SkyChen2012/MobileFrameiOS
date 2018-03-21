//
//  XAspect-UIViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "AppDelegate.h"
#import "XAspect.h"

#define AtAspect UIViewController

#define AtAspectOfClass UIViewController
@classPatchField(UIViewController)

@synthesizeNucleusPatch(Default, -, void, viewDidLoad);
//@synthesizeNucleusPatch(Default, -, void, viewDidAppear:(BOOL)animated);

AspectPatch(-, void, viewDidLoad){
    
    NSLog(@"[Benson]: %@'s view did load.", NSStringFromClass([self class]));
    
    return XAMessageForward(viewDidLoad);
}

//AspectPatch(-, void, viewDidAppear:(BOOL)animated){
//    
//    NSLog(@"[CocoaLumberjack Log]: %@'s view did appear.", NSStringFromClass([self class]));
//    
//    return XAMessageForward(viewDidAppear:(BOOL)animated);
//}

@end

#undef AtAspectOfClass
#undef AtAspect
