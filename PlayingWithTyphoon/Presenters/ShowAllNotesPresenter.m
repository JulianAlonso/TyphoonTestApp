//
//  ShowAllNotesPresenter.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ShowAllNotesPresenter.h"
#import "FetchAllNotesInteractor.h"
#import "ShowAllNotesViewController.h"
#import "DeleteNoteInteractor.h"

@implementation ShowAllNotesPresenter

- (void)updateView
{
    [self.fetchAllNotesInteractor fetchAllNotesWithCompletionBlock:^(NSArray *notes) {
        
        self.showAllNotesViewController.notes = notes;
        
    }];
}

- (void)didPressOnDeleteButtonWithNote:(Note *)note
{
    NSMutableArray *notes = self.showAllNotesViewController.notes.mutableCopy;
    [notes removeObject:note];
    self.showAllNotesViewController.notes = notes;
    
    [self.deleteNoteInteractor deleteNote:note completionBlock:nil];
}

@end
