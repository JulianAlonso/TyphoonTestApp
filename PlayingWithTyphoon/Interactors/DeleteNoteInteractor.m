//
//  DeleteNoteInteractor.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 5/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "DeleteNoteInteractor.h"

@implementation DeleteNoteInteractor

- (void)deleteNote:(Note *)note completionBlock:(void(^)())completionBlock
{
    [self.notesRepository deleteNote:note withCompletionblock:completionBlock];
}

@end
