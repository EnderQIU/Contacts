//
//  AddContactsViewController.h
//  Contacts
//
//  Created by enderqiu on 2018/6/11.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/ContactsManager.h"

@interface AddContactsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *weixinNumberTextField;

- (IBAction)unwindToLastViewController:(UIStoryboardSegue *)unwindSegue;

@end
