//
//  StationTableViewCell.h
//  Demo-手风琴
//
//  Created by zjf on 2017/4/24.
//  Copyright © 2017年 zjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UIImageView *facility1Img;
@property (weak, nonatomic) IBOutlet UIImageView *facility2Img;
@property (weak, nonatomic) IBOutlet UIImageView *facility3Img;
@property (weak, nonatomic) IBOutlet UIImageView *facility4Img;
@property (weak, nonatomic) IBOutlet UIImageView *facility5Img;


@end
