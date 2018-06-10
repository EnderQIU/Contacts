//
//  KeypadViewController.m
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "KeypadViewController.h"

@interface KeypadViewController ()

@end

@implementation KeypadViewController

@synthesize phoneNumber = _phoneNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)dialpadButtonPressed:(UIButton*)sender {
    NSString * number = [sender currentTitle];
    [_phoneNumber appendNumber:number];
}

- (IBAction)backspaceButtonPressed:(id)sender {
    [_phoneNumber popNumber];
}
@end
