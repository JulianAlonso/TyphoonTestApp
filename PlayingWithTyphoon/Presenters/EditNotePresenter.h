//
//  EditNotePresenter.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 1/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;
@class CreateOrUpdateNoteInteractor;
@class EditNoteViewController;

@interface EditNotePresenter : NSObject

@property (nonatomic, weak) EditNoteViewController *editNoteViewController;
@property (nonatomic, strong) CreateOrUpdateNoteInteractor *createOrUpdateNoteInteractor;
@property (nonatomic, strong) Note *note;

- (void)updateView;
- (void)endEditingwithText:(NSString *)text;

@end
