//
//  Contacts.h
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Contacts : NSObject

@property int contact_id;  // pk
@property NSString * name;
@property NSString * phone_number;
@property NSString * address;
@property NSString * weixin_number;

+ (instancetype)initWithName:(NSString*)name andPhoneNumber:(NSString*)phoneNumber andAddress:(NSString*)address andWeixinNumber:(NSString*)weixinNumber;

@end
