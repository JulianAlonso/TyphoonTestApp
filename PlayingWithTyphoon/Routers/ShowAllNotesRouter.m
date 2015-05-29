//
//  ShowAllNotesRouter.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ShowAllNotesRouter.h"
#import "ShowAllNotesViewController.h"

@implementation ShowAllNotesRouter

- (void)presentViewControllerAt:(UINavigationController *)navigationController
{
    navigationController.viewControllers = @[self.showAllNotesViewController];
}

@end
