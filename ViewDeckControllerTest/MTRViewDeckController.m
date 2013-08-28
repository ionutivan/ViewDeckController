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

- (id)initWithCenterViewController:(CenterViewController *)centerViewController
               rightViewController:(RightViewController *)rightViewController
                leftViewController:(LeftViewController *)leftViewController {
  
  if (self = [super initWithNibName:@"Empty" bundle:nil]) {
    
    NSLog(@"init %@",NSStringFromCGRect(self.view.frame));
    
    self.leftViewController = leftViewController;
    self.centerViewController = centerViewController;
    self.rightViewController = rightViewController;
    
    self.rightViewController.deckController = self;
    self.leftViewController.deckController = self;
    self.centerViewController.deckController = self;
    
    CGRect referenceFrame = self.view.frame;
    

    _rightViewController.view.backgroundColor = [UIColor redColor];
    _leftViewController.view.backgroundColor = [UIColor blueColor];
    _centerViewController.view.backgroundColor = [UIColor greenColor];
    
    self.leftViewController.view.frame = CGRectMake(CGRectGetMinX(referenceFrame),
                                                    CGRectGetMinY(referenceFrame),
                                                    CGRectGetWidth(referenceFrame)/3.0,
                                                    CGRectGetHeight(referenceFrame));
    
    self.centerViewController.view.frame = CGRectMake(CGRectGetMinX(referenceFrame),
                                                      CGRectGetMinY(referenceFrame),
                                                      CGRectGetWidth(referenceFrame),
                                                      CGRectGetHeight(referenceFrame));
    
    self.rightViewController.view.frame = CGRectMake(CGRectGetMaxX(referenceFrame)-CGRectGetWidth(referenceFrame)/3.0,
                                                     CGRectGetMinY(referenceFrame),
                                                     CGRectGetWidth(referenceFrame)/3.0,
                                                     CGRectGetHeight(referenceFrame));
    
    [self.view addSubview:self.leftViewController.view];
    [self addChildViewController:self.leftViewController];
    [self.leftViewController didMoveToParentViewController:self];
    NSLog(@"left %@",NSStringFromCGRect(self.leftViewController.view.frame));

    
    
    [self.view addSubview:self.centerViewController.view];
    [self addChildViewController:self.centerViewController];
    [self.centerViewController didMoveToParentViewController:self];
    NSLog(@"center %@",NSStringFromCGRect(self.centerViewController.view.frame));
    
    [self.view addSubview:self.rightViewController.view];
    [self addChildViewController:self.rightViewController];
    [self.rightViewController didMoveToParentViewController:self];
    NSLog(@"right %@",NSStringFromCGRect(self.rightViewController.view.frame));
    
  }
  
  return self;
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSLog(@"viewDidLoad %@",NSStringFromCGRect(self.view.frame));
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

  NSLog(@"viewWillAppear %@",NSStringFromCGRect(self.view.frame));
  
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
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
