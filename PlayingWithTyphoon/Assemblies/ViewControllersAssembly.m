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

@implementation ViewControllersAssembly

- (ShowAllNotesViewController *)showAllNotesViewController
{
    return [TyphoonDefinition withClass:[ShowAllNotesViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(router) with:[_routersAssembly showAllNotesRouter]];
    }];
}

@end
