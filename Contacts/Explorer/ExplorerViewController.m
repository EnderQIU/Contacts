//
//  ExplorerViewController.m
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "ExplorerViewController.h"

@interface ExplorerViewController ()

@end

@implementation ExplorerViewController

@synthesize explorer = _explorer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [_explorer loadRequest:request];
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
