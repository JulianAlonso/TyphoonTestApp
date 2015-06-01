//
//  NoteCollectionViewCellController.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "NoteCollectionViewCellController.h"
#import "NoteCollectionViewCell.h"
#import "Note.h"

@interface NoteCollectionViewCellController () <NoteCollectionViewCellDelegate>

@end

@implementation NoteCollectionViewCellController

- (UICollectionViewCell *)configuredCell
{
    self.cell.noteTextLabel.text = self.note.noteText;
    self.cell.delegate = self;
    
    return self.cell;
}

- (void)didTapAtCell:(UICollectionViewCell *)collectionViewCell
{
    [self.delegate didSelectionCell:collectionViewCell withNote:self.note];
}

@end
