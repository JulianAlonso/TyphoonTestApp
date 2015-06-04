//
//  DeleteNoteInteractor.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 5/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesRepository.h"

@class Note;

@interface DeleteNoteInteractor : NSObject

@property (nonatomic, strong) id<NotesRepository> notesRepository;

- (void)deleteNote:(Note *)note completionBlock:(void(^)())completionBlock;

@end
