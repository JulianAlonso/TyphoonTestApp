//
//  NoteParser.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;
@class NoteMO;

@interface NoteParser : NSObject

+ (NSArray *)notesFromNoteMOs:(NSArray *)noteMOs;

+ (Note *)noteFromNoteMO:(NoteMO *)noteMO;

@end
