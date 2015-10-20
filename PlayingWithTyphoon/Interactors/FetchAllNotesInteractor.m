//
//  NotesInteractor.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FetchAllNotesInteractor.h"

@implementation FetchAllNotesInteractor

- (void)fetchAllNotesWithCompletionBlock:(void(^)(NSArray *notes))completionBlock
{
	[self.notesRepository fetchAllNotes:^(NSArray *notes)
    {
        completionBlock(notes);
    }];
}

@end
