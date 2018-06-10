//
//  KeypadViewController.h
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeypadView.h"
#import "PhoneNumberLable.h"

@interface KeypadViewController : UIViewController

@property (strong, nonatomic) IBOutlet KeypadView *keypad;
@property (weak, nonatomic) IBOutlet PhoneNumberLable *phoneNumber;

- (IBAction)dialpadButtonPressed:(id)sender;
- (IBAction)backspaceButtonPressed:(id)sender;

@end
