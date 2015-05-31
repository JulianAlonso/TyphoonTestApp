//
//  CoreDataNotesRepository.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CoreDataNotesRepository.h"
#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "NoteMO.h"
#import "NoteParser.h"

@interface CoreDataNotesRepository ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataNotesRepository

#pragma mark - Init methods.
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _managedObjectContext = [CoreDataManager managedObjectContext];
    }
    
    return self;
}

#pragma mark - NotesRepository methods.
- (void)fetchAllNotes:(void (^)(NSArray *))completionBlock
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([NoteMO class])];
    
    NSError *error;
    NSArray *notes = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error)
    {
        completionBlock([NSArray array]);
    }
    else
    {
        completionBlock([NoteParser notesFromNoteMOs:notes]);
    }
}

@end
