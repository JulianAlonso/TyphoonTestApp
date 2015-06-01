//
//  EditNoteViewController.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditNoteRouter;
@class EditNotePresenter;

@interface EditNoteViewController : UIViewController

@property (nonatomic, strong) EditNoteRouter *router;
@property (nonatomic, strong) EditNotePresenter *presenter;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end
