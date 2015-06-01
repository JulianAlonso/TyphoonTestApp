//
//  NoteMO+Implementation.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 1/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "NoteMO+Implementation.h"
#import "Note.h"

NSString *const kNoteMOCreationDateProperty = @"noteCreationDate";

@implementation NoteMO (Implementation)

+ (instancetype)noteMOWithNote:(Note *)note atManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NoteMO *noteMO = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([NoteMO class]) inManagedObjectContext:managedObjectContext];
    
    noteMO.noteText = note.noteText;
    noteMO.noteCreationDate = note.noteCreationDate;
    
    return noteMO;
}

@end
