//
//  MainRouter.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "MainRouter.h"
#import "ShowAllNotesRouter.h"
#import "RoutersAssembly.h"

@implementation MainRouter

- (void)presentRootViewControllerAtWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    
    ShowAllNotesRouter *showAllNotesRouter = [self.routersAssembly showAllNotesRouter];
    [showAllNotesRouter presentViewControllerAt:navigationController];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
}

@end
