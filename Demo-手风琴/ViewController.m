//
//  ViewController.m
//  Demo-手风琴
//
//  Created by zjf on 2017/4/24.
//  Copyright © 2017年 zjf. All rights reserved.
//

#define STATUS_BAR_HEIGHT 20

#define KScreenWidth [[UIScreen mainScreen]bounds].size.width
#define KScreenHeight [[UIScreen mainScreen]bounds].size.height

#import "ViewController.h"
#import "StationTableViewCell.h"
#import "SectionTableViewCell.h"

static NSString * accordionIdentifier = @"accordionIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray * lineArr;
}
@property (nonatomic, strong) UITableView * accordionTableView;

@property (nonatomic, strong) NSMutableArray * sectionArr;
//判断手风琴某个section是否展开
@property (nonatomic, strong) NSMutableArray * flagArr;

@end

@implementation ViewController

- (NSMutableArray *)sectionArr {
    if (!_sectionArr) {
        _sectionArr = [NSMutableArray array];
    }
    return _sectionArr;
}

- (NSMutableArray *)flagArr {
    if (!_flagArr) {
        _flagArr = [[NSMutableArray alloc] init];
    }
    return _flagArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //init array
    lineArr = [NSArray arrayWithObjects:@"1号线", @"2号线", @"3号线", @"4号线", @"5号线", @"6号线", nil];
    for (NSInteger i = 0; i < lineArr.count; i++) {

        NSMutableArray * arr = [NSMutableArray array];
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        for (NSInteger j = 0; j < 4; j++) {
            [arr addObject:[NSString stringWithFormat:@"%@——地铁站%ld",lineArr[i], j]];
        }
        [dic setObject:arr forKey:lineArr[i]];

        [self.sectionArr addObject:dic];
        [self.flagArr addObject:@"0"];
    }
    
    //init TableView
    _accordionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, KScreenWidth, KScreenHeight - STATUS_BAR_HEIGHT)];
    _accordionTableView.delegate = self;
    _accordionTableView.dataSource = self;
    _accordionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    //注：对tableView的section进行重用机制时，需要在初始化UITableView的时候对Cell进行注册（如果不注册，界面首次加载后，第一个section不会显示）
    //注册方法一：使用registerClass注册section的cell（还需要在cell的实现文件中重写initWithStyle并加载自己的nib）
    //[_accordionTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"accordionIdentifier"];
    //注册方法二：使用registerNib注册section的cell
    [self.accordionTableView registerNib:[UINib nibWithNibName:@"SectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"sectionIdentifier"];
    
    [self.view addSubview:_accordionTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.flagArr[section] isEqualToString:@"0"]) {
        return 0;
    }
    else {
        // 如果是展开的则给这个分区加一个cell用来放此分区的标题cell
        return [[self.sectionArr[section] objectForKey:lineArr[section]] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * accordionIdentifier = @"accordionIdentifier";
    StationTableViewCell * cell = [_accordionTableView dequeueReusableCellWithIdentifier:accordionIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StationTableViewCell" owner:self options:nil]lastObject];
    }
    cell.headImgView.image = [UIImage imageNamed:@"stationImg"];
    cell.titleLabel.text = @"cell-123";
    cell.backgroundColor = [UIColor colorWithRed:0.98f green:0.98f blue:0.97f alpha:1.00f];
    //[self.sectionArr[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld个section的第%ld个cell", indexPath.section, indexPath.row);
}

//组的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString * sectionIdentifier = @"sectionIdentifier";
    SectionTableViewCell * sectionCell = [tableView dequeueReusableCellWithIdentifier:sectionIdentifier];
    BOOL selected = [self.flagArr[section] isEqualToString:@"1"];
    UIImage * img;
    if (selected) {
        img = [UIImage imageNamed:@"arrowdown@3x"];
    }
    else {
        img = [UIImage imageNamed:@"arrowright"];
    }
    sectionCell.sectionHeadImg.image = [UIImage imageNamed:@"lineImg"];
    [sectionCell.sectionBtn setImage:img forState:UIControlStateNormal];
    sectionCell.sectionTitleLabel.text = lineArr[section];
    sectionCell.backgroundColor = [UIColor whiteColor];
    sectionCell.tag = section + 1000;
    sectionCell.sectionBtn.selected = selected;
    
    //add tap gesture
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [sectionCell addGestureRecognizer:tap];
    
    return sectionCell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (void) tapAction:(UITapGestureRecognizer *)sender {
    SectionTableViewCell * cell = (SectionTableViewCell *)sender.view;
    
    [self.flagArr[cell.tag - 1000] isEqualToString:@"0"] ? [self.flagArr replaceObjectAtIndex:cell.tag - 1000 withObject:@"1"] : [self.flagArr replaceObjectAtIndex:cell.tag - 1000 withObject:@"0"];
    [self.accordionTableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
