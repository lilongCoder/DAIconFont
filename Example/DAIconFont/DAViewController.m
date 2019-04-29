//
//  DAViewController.m
//  DAIconFont
//
//  Created by leehonn on 04/29/2019.
//  Copyright (c) 2019 leehonn. All rights reserved.
//

#import "DAViewController.h"
#import "UIFont+IconFont.h"
#import "UIImage+TBCityIconFont.h"

@interface DAViewController ()

@end

@implementation DAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *lab = [UILabel new];
    lab.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:lab];
    lab.font = [UIFont iconFontOfSize:22];
    lab.text = @"\U0000e70c";
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 20, 20)];
    [self.view addSubview:imgV];
    TBCityIconInfo *info = [[TBCityIconInfo alloc] initWithText:@"\U0000e70c" size:40 color:[UIColor redColor]];
    imgV.image = [UIImage iconWithInfo:info];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
