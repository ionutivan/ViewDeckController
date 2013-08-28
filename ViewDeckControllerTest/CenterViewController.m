//
//  CenterViewController.m
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "CenterViewController.h"
#import "MTRViewDeckController.h"

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
                     self.view.frame = CGRectMake(CGRectGetWidth(self.view.frame)/3, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
                   }
                   completion:^(BOOL finished) {
                     
                   }];
 
//  [self transitionFromViewController:self
//                    toViewController:(UIViewController *)[self.deckController leftController]
//                            duration:0.5
//                             options:UIViewAnimationOptionCurveEaseInOut
//                          animations:^{
//                            self.view.frame = CGRectMake(200, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
//                          }
//                          completion:^(BOOL finished) {
//                            
//                          }];
}

- (IBAction)buttonActionRight:(id)sender {
  
}

@end
