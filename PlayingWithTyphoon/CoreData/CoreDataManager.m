//
//  CoreDataManager.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "CoreDataStack.h"

@implementation CoreDataManager

+ (NSManagedObjectContext *)privateObjectContext
{
    static NSManagedObjectContext *privateContext = nil;
    if (!privateContext)
    {
        privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [privateContext setPersistentStoreCoordinator:[CoreDataManager persistenceStoreCordinator]];
    }
    return privateContext;
}

+ (NSManagedObjectContext *)managedObjectContext
{
    return [[CoreDataManager coreDataStack] managedObjectContext];
}

+ (NSPersistentStoreCoordinator *)persistenceStoreCordinator
{
    return [[CoreDataManager coreDataStack] persistentStoreCoordinator];
}

+ (CoreDataStack *)coreDataStack
{
    static CoreDataStack *coreDataStack = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        coreDataStack = [CoreDataStack new];
    });
    
    return coreDataStack;
}

@end
