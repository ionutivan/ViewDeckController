//
//  MTRViewDeckController.h
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 8/26/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RightViewController;
@class LeftViewController;
@class CenterViewController;

@interface MTRViewDeckController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *rightView;
@property (nonatomic, weak) IBOutlet UIView *leftView;
@property (nonatomic, weak) IBOutlet UIView *centerView;

- (id)initWithCenterViewController:(UIViewController *)centerViewController
               rightViewController:(UIViewController *)rightViewController
                leftViewController:(UIViewController *)leftViewController;

- (RightViewController *)rightController;
- (LeftViewController *)leftController;
- (CenterViewController *)centerController;

@end
