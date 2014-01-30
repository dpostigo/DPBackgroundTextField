//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPBackgroundTextFieldCell;

@interface DPBackgroundTextField : NSTextField {

    IBOutlet NSView *backgroundView;
    CALayer *backgroundLayer;


    NSEdgeInsets insets;

    BOOL isAwake;
}

@property(nonatomic, strong) NSView *backgroundView;
@property(nonatomic, strong) CALayer *backgroundLayer;
@property(nonatomic) NSEdgeInsets insets;
@property(nonatomic) BOOL isAwake;


- (void) setDefaultBackgroundView;
- (DPBackgroundTextFieldCell *) inputCell;
@end