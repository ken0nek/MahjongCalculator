//
//  MCPlayer.h
//  MahjongCalculator
//
//  Created by Ken Tominaga on 7/22/14.
//  Copyright (c) 2014 Tommy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MCPlayer : NSManagedObject

@property (nonatomic, retain) NSString * playerName;
@property (nonatomic, retain) NSNumber * playerID;
@property (nonatomic, retain) NSString * playerImage;

@end
