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

@implementation PresentersAssembly

- (ShowAllNotesPresenter *)showAllNotesPresenter
{
    return [TyphoonDefinition withClass:[ShowAllNotesPresenter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(fetchAllNotesInteractor) with:[_interactorAssembly fetchAllNotesInteractor]];
        [definition injectProperty:@selector(showAllNotesViewController) with:[_viewControllerAssembly showAllNotesViewController]];
    }];
}

@end
