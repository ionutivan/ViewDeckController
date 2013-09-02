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
  
  RightViewController *rightPanel = [[self deckController] rightController];
  LeftViewController *leftPanel = [[self deckController] leftController];
  
  if ([leftPanel isOpen]) {
    [leftPanel close:nil];
  } else {
    //close right panel
    if ([rightPanel isOpen]) {
      [rightPanel close:nil];
    }
    //open left panel
    [leftPanel open:nil];
  }
  
}

- (IBAction)buttonActionRight:(id)sender {
  
  RightViewController *rightPanel = [[self deckController] rightController];
  LeftViewController *leftPanel = [[self deckController] leftController];
  
  if ([rightPanel isOpen]) {
    //close right panel
    [rightPanel close:nil];
  } else {
      //close left panel if open
    if ([leftPanel isOpen]) {
      [leftPanel close:nil];
    }
    
      //open right panel
    [rightPanel open:nil];
  }
  
  
}

@end
