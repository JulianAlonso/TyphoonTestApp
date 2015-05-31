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

NSString *const kShowAllNotesViewControllerNotesProperty = @"notes";

@interface ShowAllNotesViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

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
    
    self.notesCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.notesCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NoteCollectionViewCell class]) bundle:nil]
               forCellWithReuseIdentifier:NSStringFromClass([NoteCollectionViewCell class])];
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
    }
}

#pragma mark - UICollectionViewDataSource methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NoteCollectionViewCell class])
                                                                             forIndexPath:indexPath];
    
    NoteCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    controller.note = self.notes[indexPath.item];
    
    return [controller configuredCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.notes.count;
}

@end

