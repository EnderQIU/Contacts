//
//  ContactsManager.h
//  Contacts
//
//  Created by 邱添爽 on 2018/6/11.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Contacts.h"

#define DBFILE_NAME @"db.sqlite3"


@interface ContactsManager : NSObject
{
sqlite3 * db;
}

+ (ContactsManager *) shared;
- (NSString *) applicationDocumentsDirectoryFile;
- (void) createEditableCopyOfDatabaseIfNeeded;

- (int) create:(Contacts *) model;
- (int) remove:(Contacts *) model;
- (int) modify:(Contacts *) model;
- (NSMutableArray *) findAll;
- (NSMutableArray *) findByName: (NSString*) condition;
- (Contacts *) findById:(int) condition;

@end
