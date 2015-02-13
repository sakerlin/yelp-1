//
//  CheckBoxCell.m
//  yelp
//
//  Created by Yingming Chen on 2/12/15.
//  Copyright (c) 2015 Yingming Chen. All rights reserved.
//

#import "CheckBoxCell.h"

@interface CheckBoxCell ()
- (IBAction)onTouch:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (nonatomic, assign) BOOL arrowState;
@end

// unchecked icon color: B0B0B0
// checked icon color: 45C7FF
@implementation CheckBoxCell

- (void)awakeFromNib {
    // Initialization code
    self.checked = NO;
    self.arrowState = NO;
    //[self.checkButton.imageView setImage:[UIImage imageNamed:@"unchecked-32"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onTouch:(id)sender {
    if (!self.arrowState) {
        [self setChecked:!self.checked];
        // Trigger the event to delegate
        [self.delegate checkBoxCell:self didUpdateValue:self.checked];
    }
}

- (void)setChecked:(BOOL)checked {
    self.arrowState = NO;
    _checked = checked;
    if (self.checked) {
        [self.checkButton.imageView setImage:[UIImage imageNamed:@"checkbox-dot-32"]];
    } else {
        [self.checkButton.imageView setImage:[UIImage imageNamed:@"unchecked-32"]];
    }
}

- (void)setArrowDown {
    [self.checkButton.imageView setImage:[UIImage imageNamed:@"arrow-32"]];
    self.arrowState = YES;
}

@end
