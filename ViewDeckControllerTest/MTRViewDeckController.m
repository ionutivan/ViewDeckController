//
//  MTRViewDeckController.m
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "MTRViewDeckController.h"
#import "RightViewController.h"
#import "CenterViewController.h"
#import "LeftViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MTRViewDeckController ()

@property (nonatomic, strong) RightViewController *rightViewController;
@property (nonatomic, strong) LeftViewController *leftViewController;
@property (nonatomic, strong) CenterViewController *centerViewController;

@end

@implementation MTRViewDeckController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  
  if (self = [super initWithCoder:aDecoder]) {
    
  }
  
  return self;
  
}

- (id)initWithCenterViewController:(UIViewController *)centerViewController
               rightViewController:(UIViewController *)rightViewController
                leftViewController:(UIViewController *)leftViewController {
  
  if (self = [super initWithNibName:@"MTRViewDeck" bundle:nil]) {
    
    if ([leftViewController isKindOfClass:[UINavigationController class]]) {
      self.leftViewController = [[(UINavigationController *)leftViewController viewControllers] objectAtIndex:0];
    } else {
        self.leftViewController = (LeftViewController *)leftViewController;
    }
    
    if ([centerViewController isKindOfClass:[UINavigationController class]]) {
      self.centerViewController = [[(UINavigationController *)centerViewController viewControllers] objectAtIndex:0];
    } else {
      self.centerViewController = (CenterViewController *)centerViewController;
    }
    
    if ([rightViewController isKindOfClass:[UINavigationController class]]) {
      self.rightViewController = [[(UINavigationController *)rightViewController viewControllers] objectAtIndex:0];
    } else {
      self.rightViewController = (RightViewController *)rightViewController;
    }
    
    self.rightViewController.deckController = self;
    self.leftViewController.deckController = self;
    self.centerViewController.deckController = self;
    
    _rightViewController.view.backgroundColor = [UIColor redColor];
    _leftViewController.view.backgroundColor = [UIColor blueColor];
    _centerViewController.view.backgroundColor = [UIColor greenColor];
        
  }
  
  return self;
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  if (self.leftViewController.viewWidth > -1) {
    [self.leftView setFrame:CGRectMake(CGRectGetMinX(self.leftView.frame),
                                       CGRectGetMinY(self.leftView.frame),
                                       self.leftViewController.viewWidth,
                                       CGRectGetHeight(self.leftView.frame))];
  }
  [self.leftView addSubview:self.leftViewController.navigationController.view];
  [self addChildViewController:self.leftViewController.navigationController];
  self.leftViewController.open = NO;
  [self.leftViewController.navigationController didMoveToParentViewController:self];
  NSLog(@"left %@",NSStringFromCGRect(self.leftViewController.view.frame));
  
  if (self.rightViewController.viewWidth > -1) {
    [self.rightView setFrame:CGRectMake(CGRectGetMinX(self.rightView.frame),
                                        CGRectGetMinY(self.rightView.frame),
                                        self.rightViewController.viewWidth,
                                        CGRectGetHeight(self.rightView.frame))];
  }
  [self.rightView addSubview:self.rightViewController.navigationController.view];
  [self addChildViewController:self.rightViewController.navigationController];
  self.rightViewController.open = NO;
  [self.rightViewController.navigationController didMoveToParentViewController:self];
  NSLog(@"right %@",NSStringFromCGRect(self.rightViewController.view.frame));
  
  [self.centerView addSubview:self.centerViewController.navigationController.view];
  [self addChildViewController:self.centerViewController.navigationController];
  [self.centerViewController.navigationController didMoveToParentViewController:self];
  NSLog(@"center %@",NSStringFromCGRect(self.centerViewController.view.frame));
  
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
  
  [super viewDidAppear:animated];
  
  NSLog(@"viewDidAppear %@",NSStringFromCGRect(self.view.frame));
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:animated];

}

- (RightViewController *)rightController {
  return _rightViewController;
}

- (LeftViewController *)leftController {
  return _leftViewController;
}

- (CenterViewController *)centerController {
  return _centerViewController;
}

@end
