//
//  NotesRepository.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NotesRepository <NSObject>

- (void)fetchAllNotes:(void(^)(NSArray *notes))completionBlock;

@end
