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

@implementation InteractorsAssembly

- (FetchAllNotesInteractor *)fetchAllNotesInteractor
{
    return [TyphoonDefinition withClass:[FetchAllNotesInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(notesRepository) with:[_repositoriesAssembly notesRepository]];
    }];
}

@end
