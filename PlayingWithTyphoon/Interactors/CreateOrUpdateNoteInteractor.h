//
//  CreateOrUpdateNoteInteractor.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 1/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesRepository.h"

@class Note;

@interface CreateOrUpdateNoteInteractor : NSObject

@property (nonatomic, strong) id<NotesRepository> notesRepository;

- (void)createOrUpdateNote:(Note *)note;

@end
