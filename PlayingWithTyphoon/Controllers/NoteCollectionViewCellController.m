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

#pragma mark - NoteCollectionViewCellDelegate methods.
- (void)didTapAtCell:(UICollectionViewCell *)collectionViewCell
{
    [self.delegate didSelectionCell:collectionViewCell withNote:self.note];
}

- (void)didLongPressAtCell:(UICollectionViewCell *)collectionViewCell
{
    [self.delegate selectCell:collectionViewCell];
}

- (void)didTappedAtDeleteButton
{
    [self.delegate deleteCell:self.cell withNote:self.note];
}

@end
