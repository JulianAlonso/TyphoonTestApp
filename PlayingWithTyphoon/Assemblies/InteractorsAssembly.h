//
//  InteractorsAssembly.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class FetchAllNotesInteractor;
@class RepositoriesAssembly;
@class CreateOrUpdateNoteInteractor;

@interface InteractorsAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) RepositoriesAssembly *repositoriesAssembly;

- (FetchAllNotesInteractor *)fetchAllNotesInteractor;
- (CreateOrUpdateNoteInteractor *)createOrUpdateNoteInteractor;

@end
