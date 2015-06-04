//
//  NoteCollectionViewCell.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "NoteCollectionViewCell.h"

@interface NoteCollectionViewCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewTopSpaceConstraint;
@property (weak, nonatomic) IBOutlet UIView *cancelButtonContentView;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end

@implementation NoteCollectionViewCell

#pragma mark - Override methods.
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                       action:@selector(didTapped)]];
    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                             action:@selector(didLongPress)]];
    [self.cancelButtonContentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                               action:@selector(cancelDeleteButton)]];
    [self configDeleteButton];
}

- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        [self updateTopContentViewConstraintTo:-CGRectGetHeight(self.cancelButtonContentView.bounds)];
    }
    else
    {
        [self updateTopContentViewConstraintTo:10.0f];
    }
}


#pragma mark - Config methods.
- (void)configDeleteButton
{
    [self.deleteButton addTarget:self
                          action:@selector(didTappedAtDeleteButton)
                forControlEvents:UIControlEventTouchUpInside];
    
    self.deleteButton.layer.cornerRadius = CGRectGetHeight(self.deleteButton.frame) / 2;
}

#pragma mark - Delegation methods.
- (void)didTapped
{
    [self.delegate didTapAtCell:self];
}

- (void)didLongPress
{
    [self.delegate didLongPressAtCell:self];
}

- (void)didTappedAtDeleteButton
{
    [self.delegate didTappedAtDeleteButton];
}

#pragma mark - Action methods.
- (void)cancelDeleteButton
{
    [self setSelected:false];
}

#pragma mark - Update methods.
- (void)updateTopContentViewConstraintTo:(CGFloat)cgfloat
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.contentViewTopSpaceConstraint.constant = cgfloat;
                         [self setNeedsLayout];
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                        
                     }];
}

@end