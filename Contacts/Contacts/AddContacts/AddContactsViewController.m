//
//  AddContactsViewController.m
//  Contacts
//
//  Created by enderqiu on 2018/6/11.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "AddContactsViewController.h"

@interface AddContactsViewController ()

@end

@implementation AddContactsViewController

@synthesize nameTextField = _nameTextField;
@synthesize phoneNumberTextField = _phoneNumberTextField;
@synthesize addressTextField = _addressTextField;
@synthesize weixinNumberTextField = _weixinNumberTextField;

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

- (IBAction)backOff:(id)sender {
    Contacts * conect = [Contacts initWithName:_nameTextField.text andPhoneNumber:_phoneNumberTextField.text andAddress:_addressTextField.text andWeixinNumber:_weixinNumberTextField.text];
    [[ContactsManager shared] create:conect];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"create" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
