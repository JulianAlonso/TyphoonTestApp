//
//  CoreDataAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "CoreDataAssembly.h"
#import "CoreDataStack.h"

@implementation CoreDataAssembly

//- (CoreDataStack *)coreDataStack
//{
//    return [TyphoonDefinition withClass:[CoreDataStack class]];
//}
//
//- (NSManagedObjectContext *)managedObjectContext
//{
//    return [TyphoonDefinition withClass:[NSManagedObjectContext class] configuration:^(TyphoonDefinition *definition)
//    {
//        [definition useInitializer:@selector(initWithConcurrencyType:) parameters:^(TyphoonMethod *initializer)
//        {
//            [initializer injectParameterWith:@(NSPrivateQueueConcurrencyType)];
//        }];
//        
//        [definition injectProperty:@selector(persistentStoreCoordinator) with:[self persistenceStoreCoordinator]];
//    }];
//}

//- (NSPersistentStoreCoordinator *)persistenceStoreCoordinator
//{
//    return [self coreDataStack].persistentStoreCoordinator;
//}

@end
