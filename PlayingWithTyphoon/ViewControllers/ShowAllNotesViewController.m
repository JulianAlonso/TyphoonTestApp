//
//  ShowAllNotesViewController.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ShowAllNotesViewController.h"
#import "Note.h"
#import "NoteCollectionViewCellController.h"
#import "NoteCollectionViewCell.h"
#import "ShowAllNotesPresenter.h"
#import "ShowAllNotesRouter.h"
#import "CustomFlowLayout.h"

NSString *const kShowAllNotesViewControllerNotesProperty = @"notes";

@interface ShowAllNotesViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, NoteCollectionViewCellControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *notesCollectionView;

@property (nonatomic, strong) NSArray *controllers;

@end

@implementation ShowAllNotesViewController

#pragma mark - Life Cycle methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configNotesCollectionView];
    [self registerObservers];
    [self configNavBar];
    
    self.title = @"All My Notes";
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.presenter updateView];
}

- (void)dealloc
{
    [self unregisterObservers];
}

#pragma mark - Config methods.
- (void)configNotesCollectionView
{
    self.notesCollectionView.delegate = self;
    self.notesCollectionView.dataSource = self;
    
    self.notesCollectionView.backgroundColor = [UIColor lightGrayColor];
    
    [self.notesCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NoteCollectionViewCell class]) bundle:nil]
               forCellWithReuseIdentifier:NSStringFromClass([NoteCollectionViewCell class])];
}

- (void)configNavBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(addButtonTapped)];
}


#pragma mark - Update methods.
- (void)updateControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    
    for (__unused Note *note in self.notes)
    {
        [controllers addObject:[NoteCollectionViewCellController new]];
    }
    
    self.controllers = controllers;
}

#pragma mark - Observe methods.
- (void)registerObservers
{
    [self addObserver:self
           forKeyPath:kShowAllNotesViewControllerNotesProperty
              options:NSKeyValueObservingOptionInitial
              context:nil];
}

- (void)unregisterObservers
{
    [self removeObserver:self
              forKeyPath:kShowAllNotesViewControllerNotesProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kShowAllNotesViewControllerNotesProperty])
    {
        [self updateControllers];
        [self.notesCollectionView reloadData];
    }
}

#pragma mark - Action methods.
- (void)addButtonTapped
{
    [self.router navigateToEditNoteViewControllerWithNote:nil];
}

#pragma mark - NoteCollectionViewCellControllerDelegate methods.
- (void)didSelectionCell:(UICollectionViewCell *)colletionViewCell withNote:(Note *)note
{
    [self.router navigateToEditNoteViewControllerWithNote:note];
}

- (void)selectCell:(UICollectionViewCell *)collectionViewCell
{
    [self.notesCollectionView selectItemAtIndexPath:[self.notesCollectionView indexPathForCell:collectionViewCell]
                                           animated:YES
                                     scrollPosition:UICollectionViewScrollPositionNone];
}

- (void)deleteCell:(UICollectionViewCell *)collectionViewCell withNote:(Note *)note
{
    [self.notesCollectionView performBatchUpdates:^{
        [self.presenter didPressOnDeleteButtonWithNote:note];
        [self.notesCollectionView deleteItemsAtIndexPaths:@[[self.notesCollectionView indexPathForCell:collectionViewCell]]];
    } completion:^(BOOL finished) {
        [self.notesCollectionView reloadData];
    }];
}

#pragma mark - UICollectionViewDataSource methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NoteCollectionViewCell class])
                                                                             forIndexPath:indexPath];
    
    NoteCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    controller.note = self.notes[indexPath.item];
    controller.delegate = self;
    
    return [controller configuredCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.notes.count;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width  = (CGRectGetWidth(self.notesCollectionView.frame) / 2);
    CGFloat heihgt = width * 1.4f;
    
    return CGSizeMake(width, heihgt);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end

