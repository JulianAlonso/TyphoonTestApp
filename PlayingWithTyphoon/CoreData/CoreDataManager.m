//
//  CoreDataManager.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CoreDataManager.h"
#import "CoreDataStack.h"

@implementation CoreDataManager

+ (CoreDataStack *)coreDataStack
{
    static CoreDataStack *coreDataStack;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        coreDataStack = [CoreDataStack new];
    });
    
    return coreDataStack;
}

@end
