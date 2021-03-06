//
//  RightViewController.m
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@property (nonatomic, weak) IBOutlet UIButton *actionButton;

@end

@implementation RightViewController

@synthesize deckController;
@synthesize open;
@synthesize viewWidth;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.viewWidth = -1;
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil constraint:(CGFloat)width {
  
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    viewWidth = width;
  }
  
  return self;
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)open:(id)sender {
  
  [UIView animateWithDuration:0.5
                   animations:^{
                     CGRect referenceFrame = self.deckController.view.bounds;
                     UIView *rightView = self.deckController.rightView;
                     rightView.frame = CGRectMake(CGRectGetMaxX(referenceFrame)-CGRectGetWidth(rightView.frame),
                                                  CGRectGetMinY(referenceFrame),
                                                  CGRectGetWidth(rightView.frame),
                                                  CGRectGetHeight(rightView.frame));
                   }
                   completion:^(BOOL finished) {
                     self.open = YES;
                   }];
  
}

- (IBAction)close:(id)sender {
  
  [UIView animateWithDuration:0.5
                   animations:^{
                     CGRect referenceFrame = self.deckController.view.bounds;
                     UIView *rightView = self.deckController.rightView;
                     rightView.frame = CGRectMake(CGRectGetMaxX(referenceFrame),
                                                 CGRectGetMinY(referenceFrame),
                                                 CGRectGetWidth(rightView.frame),
                                                 CGRectGetHeight(rightView.frame));
                   }
                   completion:^(BOOL finished) {
                     self.open = NO;
                   }];
  
}

@end
