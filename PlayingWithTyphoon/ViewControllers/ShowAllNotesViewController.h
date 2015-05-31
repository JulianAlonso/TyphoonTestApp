//
//  ShowAllNotesViewController.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShowAllNotesRouter;
@class ShowAllNotesPresenter;

@interface ShowAllNotesViewController : UIViewController

@property (nonatomic, strong) ShowAllNotesRouter *router;
@property (nonatomic, strong) ShowAllNotesPresenter *presenter;
@property (nonatomic, strong) NSArray *notes;

@end
