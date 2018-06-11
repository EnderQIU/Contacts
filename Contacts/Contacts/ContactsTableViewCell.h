//
//  ContactsTableViewCell.h
//  Contacts
//
//  Created by enderqiu on 2018/6/11.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Models/ContactsManager.h"

@interface ContactsTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString* title;
@property Contacts* data;

@end
