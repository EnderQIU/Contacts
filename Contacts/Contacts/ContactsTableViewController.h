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
#import "ContactsSearchBar.h"

@interface ContactsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet ContactsSearchBar *searchBar;

@property (strong, nonatomic) IBOutlet ContactsTableView *contactsTable;

- (IBAction)shareButtonPressed:(id)sender;

@end
