//
//  NoteMO.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NoteMO : NSManagedObject

@property (nonatomic, retain) NSString * noteText;
@property (nonatomic, retain) NSDate * noteCreationDate;

@end
