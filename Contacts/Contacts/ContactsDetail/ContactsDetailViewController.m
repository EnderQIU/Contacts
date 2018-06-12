//
//  ContactsDetailViewController.m
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "ContactsDetailViewController.h"

@interface ContactsDetailViewController ()

@property int c_id;

@end

@implementation ContactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int contacts_id = [defaults integerForKey:@"contacts_id"];
    Contacts * contect = [[ContactsManager shared] findById:contacts_id];
    _c_id = contect.contact_id;
    _nameTextField.text = contect.name;
    _phoneNumberTextField.text = contect.phone_number;
    _addressTextField.text = contect.address;
    _weixinNumberTextField.text = contect.weixin_number;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//
//}

- (IBAction)backOff:(id)sender {
    Contacts * contact = [Contacts initWithName:_nameTextField.text andPhoneNumber:_phoneNumberTextField.text andAddress:_addressTextField.text andWeixinNumber:_weixinNumberTextField.text];
    contact.contact_id = _c_id;
    [[ContactsManager shared]modify:contact];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
