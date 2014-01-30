//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPBackgroundTextFieldCell : NSTextFieldCell {

    NSAttributedString *attributedLabelString;
    CGFloat leftOffset;
}

@property(nonatomic) CGFloat leftOffset;
@property(nonatomic, strong) NSAttributedString *attributedLabelString;
@end