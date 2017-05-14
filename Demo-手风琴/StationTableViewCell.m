//
//  StationTableViewCell.m
//  Demo-手风琴
//
//  Created by zjf on 2017/4/24.
//  Copyright © 2017年 zjf. All rights reserved.
//

#import "StationTableViewCell.h"

@implementation StationTableViewCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//     if(self) {
//         NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"StationTableViewCell" owner:nil options:nil];
//         self = [nibArray lastObject];
//         //[self initCell];
//     }
//     return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
