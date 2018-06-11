//
//  Contacts.m
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "Contacts.h"

@implementation Contacts

+ (instancetype)initWithName:(NSString*)name andPhoneNumber:(NSString*)phoneNumber andAddress:(NSString*)address andWeixinNumber:(NSString*)weixinNumber{
    Contacts * contact = [Contacts new];
    contact.name = name;
    contact.phone_number = phoneNumber;
    contact.address = address;
    contact.weixin_number = weixinNumber;
    return contact;
}

@end
