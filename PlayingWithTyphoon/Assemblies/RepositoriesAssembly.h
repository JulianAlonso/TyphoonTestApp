//
//  RepositoriesAssembly.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import "NotesRepository.h"

@interface RepositoriesAssembly : TyphoonAssembly

- (id<NotesRepository>)notesRepository;

@end
