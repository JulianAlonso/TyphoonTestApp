//
//  NoteCollectionViewCell.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "NoteCollectionViewCell.h"

@implementation NoteCollectionViewCell

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapped)]];
}

- (void)didTapped
{
    [self.delegate didTapAtCell:self];
}
                               
@end