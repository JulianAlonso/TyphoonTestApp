//
//  PresentersAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PresentersAssembly.h"
#import "ShowAllNotesPresenter.h"
#import "InteractorsAssembly.h"
#import "ViewControllersAssembly.h"
#import "EditNotePresenter.h"

@implementation PresentersAssembly

- (ShowAllNotesPresenter *)showAllNotesPresenter
{
    return [TyphoonDefinition withClass:[ShowAllNotesPresenter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(fetchAllNotesInteractor) with:[_interactorAssembly fetchAllNotesInteractor]];
        [definition injectProperty:@selector(showAllNotesViewController) with:[_viewControllerAssembly showAllNotesViewController]];
    }];
}

- (EditNoteViewController *)editNotePresenter
{
    return [TyphoonDefinition withClass:[EditNotePresenter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(createOrUpdateNoteInteractor) with:[_interactorAssembly createOrUpdateNoteInteractor]];
        [definition injectProperty:@selector(editNoteViewController) with:[_viewControllerAssembly editNoteViewController]];
    }];
}

@end
