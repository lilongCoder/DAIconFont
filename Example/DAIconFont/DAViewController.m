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
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:label];
    label.font = [UIFont iconFontOfSize:22];
    label.text = @"\U0000e70c";
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 60, 60)];
    [self.view addSubview:imgView];
    TBCityIconInfo *info = [[TBCityIconInfo alloc] initWithText:@"\U0000e70c" size:60 color:[UIColor redColor]];
    imgView.image = [UIImage iconWithInfo:info];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
