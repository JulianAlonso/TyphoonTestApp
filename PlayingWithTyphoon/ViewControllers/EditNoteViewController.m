//
//  EditNoteViewController.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "EditNoteViewController.h"
#import "EditNotePresenter.h"

typedef NS_ENUM(NSUInteger, EditNoteViewControllerState)
{
    EditNoteViewControllerEditingState = 0,
    EditNoteViewControllerReadingState = 1,
};

NSString *const kEditNoteViewControllerStateProperty = @"state";

@interface EditNoteViewController () <UITextViewDelegate>

@property (nonatomic, assign) EditNoteViewControllerState state;
@property (nonatomic, strong) UIBarButtonItem *doneButton;

@end

@implementation EditNoteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configNoteTextView];
    [self registerObservers];
    [self configDoneButton];
    [self.presenter updateView];
    self.state = EditNoteViewControllerReadingState;
}

- (void)dealloc
{
    [self unregisterObservers];
}

#pragma mark - Config methods.
- (void)configNoteTextView
{
    self.noteTextView.delegate = self;
    self.noteTextView.alwaysBounceVertical = YES;
}

- (void)configDoneButton
{
    self.doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                    target:self
                                                                    action:@selector(doneButtonTapped)];
}

#pragma mark - Update methods.
- (void)updateState
{
    if (self.state == EditNoteViewControllerEditingState)
    {
        [self showDoneButton];
    }
    else
    {
        [self hideDoneButton];
    }
}

#pragma mark - Observe methods.
- (void)registerObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [self addObserver:self
           forKeyPath:kEditNoteViewControllerStateProperty
              options:NSKeyValueObservingOptionInitial
              context:nil];
}

- (void)unregisterObservers
{
    [self removeObserver:self
              forKeyPath:kEditNoteViewControllerStateProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kEditNoteViewControllerStateProperty])
    {
        [self updateState];
    }
}

#pragma mark - Text View Delegate methods.
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.state = EditNoteViewControllerEditingState;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.state = EditNoteViewControllerReadingState;
}

#pragma mark - Action methods.
- (void)doneButtonTapped
{
    [self.noteTextView resignFirstResponder];
    [self.presenter endEditingwithText:self.noteTextView.text];
}

- (void)showDoneButton
{
    self.navigationItem.rightBarButtonItem = self.doneButton;
}

- (void)hideDoneButton
{
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - KeyBoard methods.
- (void)keyboardWasShown:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(self.topLayoutGuide.length, 0.0f, kbSize.height, 0.0f);
    self.noteTextView.contentInset = insets;
    self.noteTextView.scrollIndicatorInsets = insets;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

- (void)keyboardWillBeHidden:(NSNotification *)notification
{
    UIEdgeInsets insets = UIEdgeInsetsMake(self.topLayoutGuide.length, 0.0f, 0.0f, 0.0f);
    self.noteTextView.contentInset = insets;
    self.noteTextView.scrollIndicatorInsets = insets;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

@end
