//
//  ShowAllNotesRouter.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShowAllNotesViewController;

@interface ShowAllNotesRouter : NSObject

@property (nonatomic, weak) ShowAllNotesViewController *showAllNotesViewController;

- (void)presentViewControllerAt:(UINavigationController *)navigationController;

@end
