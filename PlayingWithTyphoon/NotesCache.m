//
//  NotesCache.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 20/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "NotesCache.h"

static NSString *const kNotesProperty = @"notes";
static NSString *const kNotes = @"notesCacheKey";

@interface NotesCache ()

@property (nonatomic, strong) NSCache *cache;

@end


@implementation NotesCache

- (void)updateNote:(Note *)note
{
    NSMutableArray<Note *> *notes = [self.notes mutableCopy];
    
    [notes replaceObjectAtIndex:[notes indexOfObject:note] withObject:note];
    
    self.notes = notes;
}

- (void)updateWithNotes:(NSArray<Note *> *)notes
{
    
}

#pragma mark - Custom getters.
- (NSArray<Note *> *)notes
{
    return [self.cache objectForKey:kNotes];
}


- (void)setNotes:(NSArray<Note *> *)notes
{
    [self willChangeValueForKey:kNotesProperty];
    [self.cache setObject:notes forKey:kNotes];
    [self didChangeValueForKey:kNotesProperty];
}

@end
