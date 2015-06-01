//
//  InteractorsAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "InteractorsAssembly.h"
#import "FetchAllNotesInteractor.h"
#import "RepositoriesAssembly.h"
#import "CreateOrUpdateNoteInteractor.h"

@implementation InteractorsAssembly

- (FetchAllNotesInteractor *)fetchAllNotesInteractor
{
    return [TyphoonDefinition withClass:[FetchAllNotesInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(notesRepository) with:[_repositoriesAssembly notesRepository]];
    }];
}

- (CreateOrUpdateNoteInteractor *)createOrUpdateNoteInteractor
{
    return [TyphoonDefinition withClass:[CreateOrUpdateNoteInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(notesRepository) with:[_repositoriesAssembly notesRepository]];
    }];
}

@end
