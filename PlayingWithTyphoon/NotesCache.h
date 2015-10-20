//
//  NotesCache.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 20/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;

@interface NotesCache : NSObject

@property (nonatomic, strong) NSArray<Note *> notes;

- (void)updateNote:(Note *)note;

- (void)updateWithNotes:(NSArray<Note *> *)notes;

@end
