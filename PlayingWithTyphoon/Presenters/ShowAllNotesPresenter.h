//
//  ShowAllNotesPresenter.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShowAllNotesViewController;
@class FetchAllNotesInteractor;
@class DeleteNoteInteractor;
@class Note;

@interface ShowAllNotesPresenter : NSObject

@property (nonatomic, weak) ShowAllNotesViewController *showAllNotesViewController;
@property (nonatomic, strong) FetchAllNotesInteractor *fetchAllNotesInteractor;
@property (nonatomic, strong) DeleteNoteInteractor *deleteNoteInteractor;

- (void)updateView;
- (void)didPressOnDeleteButtonWithNote:(Note *)note;

@end
