//
//  RepositoriesAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RepositoriesAssembly.h"
#import "CoreDataNotesRepository.h"

@implementation RepositoriesAssembly

- (id<NotesRepository>)notesRepository
{
    return [TyphoonDefinition withClass:[CoreDataNotesRepository class]];
}

@end
