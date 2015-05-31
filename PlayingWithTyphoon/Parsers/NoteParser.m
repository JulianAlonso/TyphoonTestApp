//
//  NoteParser.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "NoteParser.h"
#import "Note.h"
#import "NoteMO.h"

@implementation NoteParser

+ (NSArray *)notesFromNoteMOs:(NSArray *)noteMOs
{
    NSMutableArray *notes = [NSMutableArray array];
    
    for (NoteMO *noteMO in noteMOs)
    {
        [notes addObject:[NoteParser noteFromNoteMO:noteMO]];
    }
    
    return notes;
}

+ (Note *)noteFromNoteMO:(NoteMO *)noteMO
{
    Note *note = [Note new];
    
    note.noteText = noteMO.noteText;
    note.noteCreationDate = noteMO.noteCreationDate;
    
    return note;
}

@end
