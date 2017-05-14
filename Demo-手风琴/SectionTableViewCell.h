//
//  SectionTableViewCell.h
//  Demo-手风琴
//
//  Created by zjf on 2017/4/25.
//  Copyright © 2017年 zjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *sectionHeadImg;
@property (weak, nonatomic) IBOutlet UILabel *sectionTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *sectionBtn;


@end
