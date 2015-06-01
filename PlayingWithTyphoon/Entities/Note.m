//
//  Note.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Note.h"

@implementation Note

- (instancetype)init
{
    if (!(self = [super init])) return nil;
    
    self.noteCreationDate = [NSDate date];
    
    return self;
}

@end
