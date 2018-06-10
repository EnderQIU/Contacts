//
//  PhoneNumberLable.m
//  Contacts
//
//  Created by enderqiu on 2018/6/10.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "PhoneNumberLable.h"

@implementation PhoneNumberLable

@synthesize text = _text;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)appendNumber:(NSString *)number{
    if (_text.length == 11 ) return;
    else if (_text.length == 3 || _text.length == 8) _text = [NSString stringWithFormat:@"%@ %@", _text, number];
    else _text = [NSString stringWithFormat:@"%@%@", _text, number];
}

- (void)popNumber{
    if (_text.length == 0) return;
    else if (_text.length == 10 || _text.length == 5) _text = [_text substringToIndex:_text.length - 2];
    else _text = [_text substringToIndex:_text.length - 1];
}

@end
