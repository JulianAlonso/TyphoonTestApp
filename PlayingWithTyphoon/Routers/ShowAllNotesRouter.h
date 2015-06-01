//
//  ShowAllNotesRouter.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShowAllNotesViewController;
@class RoutersAssembly;
@class Note;

@interface ShowAllNotesRouter : NSObject

@property (nonatomic, weak) ShowAllNotesViewController *showAllNotesViewController;
@property (nonatomic, strong) RoutersAssembly *routersAssembly;

- (void)presentViewControllerAt:(UINavigationController *)navigationController;

- (void)navigateToEditNoteViewControllerWithNote:(Note *)note;

@end
