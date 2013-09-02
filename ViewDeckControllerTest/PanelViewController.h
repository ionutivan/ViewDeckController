//
//  PanelViewController.h
//  ViewDeckControllerTest
//
//  Created by Ionut Ivan on 9/2/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanelViewController <NSObject>

@property (nonatomic, getter = isOpen) BOOL open;
@property (nonatomic, weak) MTRViewDeckController *deckController;
@property (nonatomic) CGFloat viewWidth;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil constraint:(CGFloat)width;

- (IBAction)close:(id)sender;
- (IBAction)open:(id)sender;

@end
