//
//  ACObject.m
//  Messaging
//
//  Created by Arnaud Coomans on 2/23/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "ACObject.h"

@implementation ACObject

- (NSString*)description {
    return [NSString stringWithFormat:@"%@ - hello", [super description]];
}

@end
