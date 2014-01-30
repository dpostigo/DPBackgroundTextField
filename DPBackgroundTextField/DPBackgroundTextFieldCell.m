//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPBackgroundTextFieldCell.h"

@implementation DPBackgroundTextFieldCell

#define BORDER_SIZE 5
#define IMAGE_SIZE 64

@synthesize leftOffset;

@synthesize attributedLabelString;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {[self setup];}
    return self;
}

- (void) setup {
    self.focusRingType = NSFocusRingTypeNone;
    self.backgroundColor = [NSColor clearColor];
}


- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    NSRect titleRect = [self labelRectForBounds: cellFrame];
    NSAttributedString *label = self.attributedLabelString;

    if (label.length > 0) {
        [label drawInRect: titleRect];
    }

}






#pragma mark Rects

- (void) setLeftOffset: (CGFloat) leftOffset1 {
    leftOffset = leftOffset1;
    [self.controlView setNeedsDisplay: YES];
}


- (CGFloat) topOffset {
    return 0.0;
}

- (NSRect) labelRectForBounds: (NSRect) bounds {
    NSRect ret = bounds;
    NSRect titleRect = [self titleRectForBounds: bounds];
    CGFloat padding = 3;

    ret.size.width = titleRect.origin.x - padding;
    ret.origin.y -= self.topOffset;
    return ret;
}


- (NSRect) titleRectForBounds: (NSRect) bounds {
    NSRect ret = [super titleRectForBounds: bounds];
    ret.origin.x += leftOffset;

    //    NSAttributedString *title = self.attributedStringValue;
    //    NSLog(@"title = %@", title);
    //    if (title) {
    //        ret.size = [title size];
    //    } else {
    //        ret.size = NSZeroSize;
    //    }

    CGFloat maxX = NSMaxX(bounds);
    CGFloat maxWidth = maxX - NSMinX(ret);
    if (maxWidth < 0) {
        maxWidth = 0;
    }

    ret.size.width = MIN(NSWidth(ret), maxWidth);
    ret.origin.y += self.topOffset;
    //    NSLog(@"ret = %@, bounds = %@", NSStringFromRect(ret), NSStringFromRect(bounds));

    return ret;
}



#pragma mark Overrides

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    cellFrame = [self titleRectForBounds: cellFrame];
    [super drawInteriorWithFrame: cellFrame inView: controlView];
}

- (void) selectWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject start: (NSInteger) selStart length: (NSInteger) selLength {
    aRect = [self titleRectForBounds: aRect];
    [super selectWithFrame: aRect inView: controlView editor: textObj delegate: anObject start: selStart length: selLength];
}


#pragma mark Label / placeholder


- (NSAttributedString *) attributedLabelString {
    if (attributedLabelString == nil) {
        attributedLabelString = [self.placeholderAttributedString mutableCopy];
    }
    return attributedLabelString;
}

- (NSAttributedString *) placeholderAttributedString {
    NSAttributedString *ret = [super placeholderAttributedString];
    if (ret == nil && self.placeholderString) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString: self.placeholderString];
        ret = string;
    }
    return ret;
}


@end