//
//  NotesInteractor.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesRepository.h"

@interface FetchAllNotesInteractor : NSObject

@property (nonatomic, strong) id<NotesRepository> notesRepository;

- (void)fetchAllNotesWithCompletionBlock:(void(^)(NSArray *notes))completionBlock;

@end
