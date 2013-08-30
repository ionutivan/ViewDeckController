//
//  CenterViewController.m
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "CenterViewController.h"
#import "MTRViewDeckController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface CenterViewController ()

@property (nonatomic, weak) IBOutlet UIButton *actionButtonLeft;
@property (nonatomic, weak) IBOutlet UIButton *actionButtonRight;

@end

@implementation CenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (IBAction)buttonActionLeft:(id)sender {
  [UIView animateWithDuration:0.5
                        delay:0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     CGRect referenceFrame = _deckController.view.frame;
                     [[self deckController] leftController].view.frame = CGRectMake(CGRectGetMinX(referenceFrame),
                                                                                    CGRectGetMinY(referenceFrame),
                                                                                    CGRectGetWidth(referenceFrame)/3,
                                                                                    CGRectGetHeight(referenceFrame));
                      
                     
                     self.view.frame = CGRectMake(CGRectGetMaxX([[self deckController] leftController].view.frame),
                                                  CGRectGetMinY(referenceFrame),
                                                  CGRectGetWidth(referenceFrame),
                                                  CGRectGetHeight(referenceFrame));
                   }
                   completion:^(BOOL finished) {
                     CGRect referenceFrame = _deckController.view.frame;
                     NSLog(@"openLeft %@",NSStringFromCGRect(referenceFrame));
                   }]; 
}

- (IBAction)buttonActionRight:(id)sender {
  [UIView animateWithDuration:0.5
                        delay:0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     CGRect referenceFrame = _deckController.view.frame;
                     self.view.frame = CGRectMake(CGRectGetMinX(referenceFrame),
                                                  CGRectGetMinY(referenceFrame),
                                                  CGRectGetWidth(referenceFrame),
                                                  CGRectGetHeight(referenceFrame));
                     
                     [[self deckController] leftController].view.frame = CGRectMake(CGRectGetMaxX(referenceFrame)-CGRectGetWidth([[self deckController] rightController].view.frame),
                                                                                    CGRectGetMinY(referenceFrame),
                                                                                    CGRectGetWidth(referenceFrame)/3,
                                                                                    CGRectGetHeight(referenceFrame));
                     
                     
                   }
                   completion:^(BOOL finished) {
                     
                   }];
}

@end
