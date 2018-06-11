//
//  PhoneNumberLable.m
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "PhoneNumberLable.h"

@implementation PhoneNumberLable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)appendNumber:(NSString *)number{
    if (self.text == nil) self.text = @"";
    if (self.text.length == 13 ) return;
    else if (self.text.length == 3 || self.text.length == 8) self.text = [NSString stringWithFormat:@"%@ %@", self.text, number];
    else self.text = [NSString stringWithFormat:@"%@%@", self.text, number];
}

- (void)popNumber{
    if (self.text.length == 0) return;
    else if (self.text.length == 10 || self.text.length == 5) self.text = [self.text substringToIndex:self.text.length - 2];
    else self.text = [self.text substringToIndex:self.text.length - 1];
}

@end
