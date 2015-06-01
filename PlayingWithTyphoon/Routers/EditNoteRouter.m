//
//  EditNoteRouter.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "EditNoteRouter.h"
#import "EditNoteViewController.h"
#import "EditNotePresenter.h"

@implementation EditNoteRouter

- (void)pushFromNavigationController:(UINavigationController *)navigationController withNote:(Note *)note
{
    self.editNoteViewController.presenter.note = note;
    [navigationController pushViewController:self.editNoteViewController animated:YES];
}

@end
