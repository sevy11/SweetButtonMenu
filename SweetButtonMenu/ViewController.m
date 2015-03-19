//
//  ViewController.m
//  SweetButtonMenu
//
//  Created by Michael Sevy on 3/19/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIButton *mainButton;
@property UIButton *buttonOne;
@property UIButton *buttonTwo;
@property UIButton *buttonThree;
@property UIDynamicAnimator *dynamicAnimator;
@property BOOL areButtonsfanned;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonOne = [self createButtonWithTitle:@"1"];
    self.buttonTwo = [self createButtonWithTitle:@"2"];
    self.buttonThree = [self createButtonWithTitle:@"3"];
    self.mainButton = [self createButtonWithTitle:@"P"];

    [self.mainButton addTarget:self action:@selector(fanButtons:) forControlEvents:UIControlEventTouchUpInside];
    //[self.buttonOne addTarget:self action:@selector(fanButtons:) forControlEvents:UIControlEventTouchUpInside];
    //[self.buttonTwo addTarget:self action:@selector(fanButtons:) forControlEvents:UIControlEventTouchUpInside];


    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

}
-(UIButton *)createButtonWithTitle:(NSString *)title    {
//custom Method returns UIButton/ method name/ parameter 1 (Type NSString) parameter1 name

    CGRect frame = self.view.frame;

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 50, frame.size.height - 50, 50, 50)];


    //alloc and init button
    button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    //configuring button
    button.layer.cornerRadius = button.bounds.size.width / 2;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    //adding to view as a subview
    [self.view addSubview:button];

    return button;
}
-(void)fanButtons:(id)sender{

    [self.dynamicAnimator removeAllBehaviors];

    if (self.areButtonsfanned) {
        [self fanIn];
    } else{
        [self fanOut];
    }
    self.areButtonsfanned = !self.areButtonsfanned;

}
-(void)fanOut{
    CGPoint point;
    UISnapBehavior *snapBehavior;

    point = CGPointMake(self.mainButton.frame.origin.x - 50, self.mainButton.frame.origin.y +20);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.buttonOne snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x - 45, self.mainButton.frame.origin.y -45);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.buttonTwo snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x + 20, self.mainButton.frame.origin.y - 50);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.buttonThree snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];
}

-(void)fanIn{
        UISnapBehavior *snapBehavior;

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.buttonOne snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.buttonTwo snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.buttonThree snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

}

@end
