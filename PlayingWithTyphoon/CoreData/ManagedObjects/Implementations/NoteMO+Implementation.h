//
//  NoteMO+Implementation.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 1/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "NoteMO.h"

@class Note;

extern NSString *const kNoteMOCreationDateProperty;

@interface NoteMO (Implementation)

+ (instancetype)noteMOWithNote:(Note *)note atManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
