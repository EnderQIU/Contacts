//
//  ContactsSearchBar.m
//  Contacts
//
//  Created by 邱添爽 on 2018/6/12.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "ContactsSearchBar.h"

@implementation ContactsSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"create" object:self];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return YES;
}

@end
