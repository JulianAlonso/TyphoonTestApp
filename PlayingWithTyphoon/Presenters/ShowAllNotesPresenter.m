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

@implementation ShowAllNotesPresenter

- (void)updateView
{
    [self.fetchAllNotesInteractor fetchAllNotesWithCompletionBlock:^(NSArray *notes) {
        
        self.showAllNotesViewController.notes = notes;
        
    }];
}

@end
