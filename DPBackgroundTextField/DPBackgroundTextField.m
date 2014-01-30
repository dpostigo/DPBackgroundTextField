//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPBackgroundTextField.h"
#import "CALayer+ConstraintUtils.h"
#import "DPBackgroundTextFieldCell.h"
#import "NSView+ConstraintFinders.h"
#import "NSLayoutConstraint+DPUtils.h"
#import "NSView+NewConstraint.h"
#import "DPLayerDelegate.h"

@implementation DPBackgroundTextField

@synthesize backgroundView;
@synthesize backgroundLayer;
@synthesize insets;

@synthesize isAwake;

- (void) setBackgroundView: (NSView *) backgroundView1 {
    if (backgroundView && backgroundView.superview) {
        [backgroundView removeFromSuperview];
    }
    backgroundView = backgroundView1;
    if (backgroundView) {
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        backgroundView.wantsLayer = YES;
        self.backgroundLayer = self.backgroundView.layer;
    }
}


- (void) setBackgroundLayer: (CALayer *) backgroundLayer1 {
    backgroundLayer = backgroundLayer1;

    if (backgroundLayer) {

        backgroundLayer.delegate = [DPLayerDelegate sharedDelegate];
        [backgroundLayer makeSuperlayer];

    }

}


- (void) awakeFromNib {
    [super awakeFromNib];

    isAwake = YES;
    self.inputCell.leftOffset = 50;

    if (backgroundView == nil) {
        [self setDefaultBackgroundView];

    } else {

    }

}

- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];

    if (isAwake && backgroundView == nil) {
        [self setDefaultBackgroundView];
    }

    if (self.superview != backgroundView) {
//        NSLog(@"Wrong superview.");
    }

}

- (void) checkBackgroundView {
}

- (void) setDefaultBackgroundView {
    if (self.superview) {
        self.backgroundView = [[NSView alloc] init];
        [self.superview addSubview: backgroundView];

        NSArray *constraints = [self.superview constraintsForItem: self];
        NSArray *modified = [NSLayoutConstraint replaceItem: self inConstraints: constraints withItem: backgroundView];
        [self.superview removeConstraints: constraints];
        [self.superview addConstraints: modified];

        [backgroundView addSubview: self];

        [self superConstrainWithInsets: insets];
        [self setNeedsUpdateConstraints: YES];
    }
}


- (CALayer *) makeBackingLayer {
    CALayer *ret = [super makeBackingLayer];
    ret.delegate = [DPLayerDelegate sharedDelegate];
    return ret;
}

#pragma mark Cell
//
//+ (Class) cellClass {
//    return [DPBackgroundTextFieldCell class];
//}
//
- (DPBackgroundTextFieldCell *) inputCell {
    return [self.cell isKindOfClass: [DPBackgroundTextFieldCell class]] ? [self cell] : nil;
}


- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        insets = NSEdgeInsetsMake(8, 10, 8, 10);
    }

    return self;
}


- (void) setInsets: (NSEdgeInsets) insets1 {
    insets = insets1;
    [self updateSuperConstraintsWithInsets: insets];
}


@end