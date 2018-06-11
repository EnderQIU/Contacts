//
//  ContactsTableViewCell.m
//  Contacts
//
//  Created by enderqiu on 2018/6/11.
//  Copyright © 2018年 enderqiu.cn. All rights reserved.
//

#import "ContactsTableViewCell.h"

@implementation ContactsTableViewCell

@synthesize title = _title;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        UILabel * lable = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        [lable setText:_title];
        [lable setTag:100];
        [self.contentView addSubview:lable];
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    UILabel * lable = (UILabel *) [self.contentView viewWithTag:100];
    [lable setText:title];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
