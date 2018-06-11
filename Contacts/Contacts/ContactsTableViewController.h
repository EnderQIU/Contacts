//
//  ContactsTableViewController.h
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsTableView.h"
#import "ContactsTableViewCell.h"
#import "Models/ContactsManager.h"

@interface ContactsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet ContactsTableView *contactsTable;

@end
