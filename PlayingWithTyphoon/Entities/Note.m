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

- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![self isKindOfClass:object])
    {
        return NO;
    }
    
    return [self isEqualToNote:object];
}

- (BOOL)isEqualToNote:(Note *)note
{
    return [self.noteCreationDate isEqualToDate:note.noteCreationDate];
}

@end
