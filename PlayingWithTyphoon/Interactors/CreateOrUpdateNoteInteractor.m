//
//  CreateOrUpdateNoteInteractor.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 1/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CreateOrUpdateNoteInteractor.h"
#import "NotesRepository.h"

@implementation CreateOrUpdateNoteInteractor

- (void)createOrUpdateNote:(Note *)note
{
    [self.notesRepository createOrUpdateNote:note];
}

@end
