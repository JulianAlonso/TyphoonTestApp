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
#import "Note.h"
#import "NoteMO+Implementation.h"

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
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:kNoteMOCreationDateProperty ascending:YES]];
    
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

- (void)createOrUpdateNote:(Note *)note
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([NoteMO class])];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kNoteMOCreationDateProperty, note.noteCreationDate];
    
    NSError *error;
    NoteMO *foundNote = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error].firstObject;
    
    if (foundNote)
    {
        foundNote.noteText = note.noteText;
    }
    else
    {
        foundNote = [NoteMO noteMOWithNote:note atManagedObjectContext:self.managedObjectContext];
    }
    
    [self.managedObjectContext save:&error];
}

- (void)deleteNote:(Note *)note withCompletionblock:(void (^)())completionBlock
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([NoteMO class])];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kNoteMOCreationDateProperty, note.noteCreationDate];
    
    NSError *error;
    NoteMO *foundNote = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error].firstObject;
    
    if (foundNote)
    {
        [self.managedObjectContext deleteObject:foundNote];
        [self.managedObjectContext save:&error];
    }
    
    if (completionBlock)
    {
        completionBlock();
    }

}

@end
