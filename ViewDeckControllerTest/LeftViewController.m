//
//  LeftViewController.m
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@property (nonatomic, weak) IBOutlet UIButton *actionButton;

@end

@implementation LeftViewController

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
    self.viewWidth = width;
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
                     //close right panel
                     //move center panel to the left
                     UIView *centerView = self.deckController.centerView;
                     CGRect referenceFrame = self.deckController.view.frame;
                     centerView.frame = CGRectMake(CGRectGetMinX(referenceFrame)+CGRectGetWidth(self.deckController.leftView.frame),
                                                   CGRectGetMinY(referenceFrame),
                                                   CGRectGetWidth(centerView.frame),
                                                   CGRectGetHeight(centerView.frame));
                     
                   }
                   completion:^(BOOL finished) {
                     self.open = YES;
                   }];
  
}

- (IBAction)close:(id)sender {
  
  [UIView animateWithDuration:0.5
                   animations:^{
                     UIView *centerView = self.deckController.centerView;
                     CGRect referenceFrame = self.deckController.view.frame;
                     centerView.frame = CGRectMake(CGRectGetMinX(referenceFrame),
                                                   CGRectGetMinY(referenceFrame),
                                                   CGRectGetWidth(centerView.frame),
                                                   CGRectGetHeight(centerView.frame));
                   }
                   completion:^(BOOL finished) {
                     self.open = NO;
                   }];
  
}

@end
