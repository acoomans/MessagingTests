//
//  ACMessagingTests.m
//  Messaging
//
//  Created by Arnaud Coomans on 2/23/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "ACMessagingTests.h"
#import "ACObject.h"
#import "Messaging.h"

@implementation ACMessagingTests

- (void)setUp {
    NSLog(@"setUp");
    save_object_description_method();
}

- (void)tearDown {
    NSLog(@"tearDown");
    restore_object_description_method();
}

- (void)testDescription {
    ACObject *object = [[ACObject alloc] init];
    NSLog(@"---------- %@", object); // expected : "object - hello"
}

- (void)testReplaceDescription {
    ACObject *object = [[ACObject alloc] init];
    replace_object_description_method();
    NSLog(@"---------- %@", object); // expected : "object - bye"
}

- (void)testTransplantDescription {
    ACObject *object = [[ACObject alloc] init];
    transplant_object_description_method();
    NSLog(@"---------- %@", object); // expected : "object - hello - ciao"
}

- (void)testZMutateDescription {
    ACObject *object = [[ACObject alloc] init];
    mutate_object_description_method();
    NSLog(@"---------- %@", object); // expected : "mutant - hello"
}

@end
