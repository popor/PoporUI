//
//  ACVC.m
//  PoporUI_Example
//
//  Created by popor on 2020/5/30.
//  Copyright © 2020 wangkq. All rights reserved.
//

#import "ACVC.h"
#import "UIAlertController+pTool.h"

@interface ACVC ()

@end

@implementation ACVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * oneBT = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =  CGRectMake(100, 160, 80, 44);
        [button setTitle:@"TEST" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor brownColor]];
        
        // button.titleLabel.font = [UIFont systemFontOfSize:17];
        button.layer.cornerRadius = 5;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 1;
        button.clipsToBounds = YES;
        
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(btAction) forControlEvents:UIControlEventTouchUpInside];
        
        button;
    });
}

- (void)btAction {
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    
    ac.addCancel(@"取消",^(UIAlertAction * action){
        NSLog(@"取消");
        
    });
    
    ac.addDefault(@"默认",^(UIAlertAction * action){
        NSLog(@"默认");
        
    });
    ac.addDestructive(@"不推荐",^(UIAlertAction * action){
        NSLog(@"不推荐");
        
    });
    
    ac.addInput(@"输入账号",^(UITextField *textField){
        //[[textField rac_textSignal] subscribeNext:^(id x) {
        //    NSLog(@"%@",textField.text);
        //}];
    });
    
    [self presentViewController:ac animated:true completion:nil];
}


@end
