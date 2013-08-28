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

- (id)initWithCenterViewController:(UIViewController *)centerViewController
               rightViewController:(UIViewController *)rightViewController
                leftViewController:(UIViewController *)leftViewController;

- (RightViewController *)rightController;
- (LeftViewController *)leftController;
- (CenterViewController *)centerController;

@end
