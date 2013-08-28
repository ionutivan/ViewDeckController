//
//  CenterViewController.h
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTRViewDeckController;

@interface CenterViewController : UIViewController

@property (nonatomic, weak) MTRViewDeckController *deckController;

- (IBAction)buttonActionLeft:(id)sender;
- (IBAction)buttonActionRight:(id)sender;

@end
