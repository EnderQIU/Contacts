//
//  ContactsManager.m
//  Contacts
//
//  Created by 邱添爽 on 2018/6/11.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "ContactsManager.h"

@implementation ContactsManager

static ContactsManager *shared = nil;
+(ContactsManager *)shared
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        shared = [[self alloc] init];
        [shared createEditableCopyOfDatabaseIfNeeded];
    });
    return shared;
}

- (NSString *)applicationDocumentsDirectoryFile{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:DBFILE_NAME];
    return path;
}

- (void)createEditableCopyOfDatabaseIfNeeded{
    NSString * writableDBPath = [self applicationDocumentsDirectoryFile];
    if (sqlite3_open([writableDBPath UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(NO, @"Database open failure.");
    }else{
        char * err;
        NSString * createSQL = [NSString stringWithFormat:@"create table main.contacts if not exist contacts (contacts_id int autoincrement primary key not null, name text, phone_number text, address text, weixin_number text;"];
        if (sqlite3_exec(db, [createSQL UTF8String], NULL, NULL, &err) != SQLITE_OK){
            sqlite3_close(db);
            NSAssert(NO, @"Table creation failure.");
        }
        sqlite3_close(db);
    }
}

- (int) create:(Contacts *)model{
    NSString * writableDBPath = [self applicationDocumentsDirectoryFile];
    if (sqlite3_open([writableDBPath UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(NO, @"Database open failure.");
    }else{
        char * err;
        NSString * sql = [NSString stringWithFormat:@"insert into main.contacts values (%@, %@, %@, %@);", model.name, model.phone_number, model.address, model.weixin_number];
        if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK){
            sqlite3_close(db);
            NSAssert(NO, @"model creation failure.");
        }
        sqlite3_close(db);
    }
    return 1;
}

- (int) modify:(Contacts *)model{
    NSString * writableDBPath = [self applicationDocumentsDirectoryFile];
    if (sqlite3_open([writableDBPath UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(NO, @"Database open failure.");
    }else{
        char * err;
        NSString * sql = [NSString stringWithFormat:@"update main.contacts set (name='%@', phone_number='%@', address='%@', weixin_number='%@') where contacts_id = %i;", model.name, model.phone_number, model.address, model.weixin_number, model.contact_id];
        if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK){
            sqlite3_close(db);
            NSAssert(NO, @"model modification failure.");
        }
        sqlite3_close(db);
    }
    return 1;
}

- (int) remove:(Contacts *)model{
    NSString * writableDBPath = [self applicationDocumentsDirectoryFile];
    if (sqlite3_open([writableDBPath UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(NO, @"Database open failure.");
    }else{
        char * err;
        NSString * sql = [NSString stringWithFormat:@"delete from main.contacts where contacts_id = %i", model.contact_id];
        if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK){
            sqlite3_close(db);
            NSAssert(NO, @"model removement failure.");
        }
        sqlite3_close(db);
    }
    return 1;
}

- (NSMutableArray *) findAll{
    NSMutableArray *contacts = nil;
    const char *sql = "select * from main.contacts;";
    sqlite3_stmt *stmt = NULL;
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        contacts = [NSMutableArray array];
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Contacts *contact = [[Contacts alloc] init];
            contact.contact_id = sqlite3_column_int(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            contact.name = [NSString stringWithUTF8String:(const char *)name];
            const unsigned char *phone_number = sqlite3_column_text(stmt, 1);
            contact.phone_number = [NSString stringWithUTF8String:(const char *)phone_number];
            const unsigned char *address = sqlite3_column_text(stmt, 1);
            contact.address = [NSString stringWithUTF8String:(const char *)address];
            const unsigned char *weixin_number = sqlite3_column_text(stmt, 1);
            contact.weixin_number = [NSString stringWithUTF8String:(const char *)weixin_number];
            [contacts addObject:contact];
        }
        
    } else {
        NSLog(@"select sql syntax error.");
    }
    return contacts;
}

- (NSMutableArray *) findByName: (NSString* ) condition{
    NSMutableArray *contacts = nil;
    const char *sql = [[NSString stringWithFormat:@"select * from main.contacts where name like '%%%@%%';", condition] UTF8String];
    sqlite3_stmt *stmt = NULL;
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        contacts = [NSMutableArray array];
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Contacts *contact = [[Contacts alloc] init];
            contact.contact_id = sqlite3_column_int(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            contact.name = [NSString stringWithUTF8String:(const char *)name];
            const unsigned char *phone_number = sqlite3_column_text(stmt, 1);
            contact.phone_number = [NSString stringWithUTF8String:(const char *)phone_number];
            const unsigned char *address = sqlite3_column_text(stmt, 1);
            contact.address = [NSString stringWithUTF8String:(const char *)address];
            const unsigned char *weixin_number = sqlite3_column_text(stmt, 1);
            contact.weixin_number = [NSString stringWithUTF8String:(const char *)weixin_number];
            [contacts addObject:contact];
        }
        
    } else {
        NSLog(@"select sql syntax error.");
    }
    return contacts;
}

- (Contacts *) findById:(int) condition{
    Contacts *contact = [[Contacts alloc] init];
    const char *sql = [[NSString stringWithFormat:@"select * from main.contacts where contacts_id = %i;", condition] UTF8String];
    sqlite3_stmt *stmt = NULL;
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        contact.contact_id = sqlite3_column_int(stmt, 0);
        const unsigned char *name = sqlite3_column_text(stmt, 1);
        contact.name = [NSString stringWithUTF8String:(const char *)name];
        const unsigned char *phone_number = sqlite3_column_text(stmt, 1);
        contact.phone_number = [NSString stringWithUTF8String:(const char *)phone_number];
        const unsigned char *address = sqlite3_column_text(stmt, 1);
        contact.address = [NSString stringWithUTF8String:(const char *)address];
        const unsigned char *weixin_number = sqlite3_column_text(stmt, 1);
        contact.weixin_number = [NSString stringWithUTF8String:(const char *)weixin_number];
    } else {
        NSLog(@"select sql syntax error.");
    }
    return contact;
}

@end
