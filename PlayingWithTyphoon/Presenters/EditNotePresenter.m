//
//  EditNotePresenter.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 1/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "EditNotePresenter.h"
#import "Note.h"
#import "CreateOrUpdateNoteInteractor.h"

@implementation EditNotePresenter

- (void)updateView
{
    if (!self.note)
    {
        self.note = [Note new];
    }
}

- (void)endEditingwithText:(NSString *)text
{
    self.note.noteText = text;
    [self.createOrUpdateNoteInteractor createOrUpdateNote:self.note];
}

@end
