//
//  RoutersAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RoutersAssembly.h"
#import "MainRouter.h"
#import "ShowAllNotesRouter.h"
#import "ViewControllersAssembly.h"

@implementation RoutersAssembly

- (MainRouter *)mainRouter
{
    return [TyphoonDefinition withClass:[MainRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(routersAssembly) with:self];
    }];
}

- (ShowAllNotesRouter *)showAllNotesRouter
{
    return [TyphoonDefinition withClass:[ShowAllNotesRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(showAllNotesViewController) with:[_viewControllersAssembly showAllNotesViewController]];
    }];
}

@end
