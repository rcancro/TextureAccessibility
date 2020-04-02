//
//  FirstViewController.m
//  stupidtest
//
//  Created by Ricky Cancro on 5/11/17.
//  Copyright © 2017 Ricky Cancro. All rights reserved.
//

#import "FirstViewController.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface BadgeButton : ASButtonNode
@property (nonatomic) ASDisplayNode *badge;
@end

@implementation BadgeButton

- (void)setBadgeString:(NSString *)string {
    if (self.badge == nil) {
        self.badge = [[ASDisplayNode alloc] init];
        [self addSubnode:self.badge];
        self.badge.backgroundColor = UIColor.blueColor;
        self.badge.clipsToBounds = YES;
    }
    
    self.badge.accessibilityLabel = @"hi";
    self.badge.layer.cornerRadius = 10;
}

- (void)layout
{
    [super layout];
    self.badge.frame = CGRectMake(-5, -5, 30, 20);
}

- (void)layoutDidFinish
{
    [super layoutDidFinish];
}
@end


@interface FirstViewController ()
@property (nonatomic) BadgeButton *button;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"first";
    
    BadgeButton *button = [[BadgeButton alloc] init];
    [button setAttributedTitle:[[NSAttributedString alloc] initWithString:@"a title"] forState:UIControlStateNormal];
    [button setBackgroundColor:UIColor.redColor];
    [self.view addSubnode:button];
    [button setBadgeString:@"12"];
//    button.isAccessibilityElement = YES;
//    BOOL accessibile = button.isAccessibilityElement;
    self.button = button;
    
    [self.button addTarget:self action:@selector(test) forControlEvents:ASControlNodeEventTouchUpInside];
    
}

- (void)test {
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.button.frame = CGRectMake(20, 80, 100, 24);
}



@end

