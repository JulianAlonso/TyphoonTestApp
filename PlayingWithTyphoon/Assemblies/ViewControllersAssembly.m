//
//  ViewControllersAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 29/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ViewControllersAssembly.h"
#import "ShowAllNotesViewController.h"
#import "RoutersAssembly.h"
#import "Typhoon.h"
#import "PresentersAssembly.h"
#import "EditNoteViewController.h"

@implementation ViewControllersAssembly

- (ShowAllNotesViewController *)showAllNotesViewController
{
    return [TyphoonDefinition withClass:[ShowAllNotesViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(router) with:[_routersAssembly showAllNotesRouter]];
        [definition injectProperty:@selector(presenter) with:[_presentersAssembly showAllNotesPresenter]];
    }];
}

- (EditNoteViewController *)editNoteViewController
{
    return [TyphoonDefinition withClass:[EditNoteViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(router) with:[_routersAssembly editNoteRouter]];
        [definition injectProperty:@selector(presenter) with:[_presentersAssembly editNotePresenter]];
    }];
}

@end
