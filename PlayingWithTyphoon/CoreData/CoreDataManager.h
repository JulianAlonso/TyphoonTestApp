//
//  CoreDataManager.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataStack;

@interface CoreDataManager : NSObject

+ (NSManagedObjectContext *)privateObjectContext;

+ (NSManagedObjectContext *)managedObjectContext;

+ (NSPersistentStoreCoordinator *)persistenceStoreCordinator;

+ (CoreDataStack *)coreDataStack;

@end
