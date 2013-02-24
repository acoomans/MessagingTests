//
//  Messaging.m
//  Messaging
//
//  Created by Arnaud Coomans on 2/23/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "Messaging.h"

NSString* newDescriptionIMP(id self, SEL _cmd) {
	return [NSString stringWithFormat:@"%@ - bye", [[self superclass] description]];
}

NSString* newDescriptionWithOldIMP(id self, SEL _cmd) {
	return [NSString stringWithFormat:@"%@ - ciao", [[self performSelector:@selector(description_old)] description]];
}

static IMP originalSuperclassDescription = nil;

NSString* mutantDescriptionIMP(id self, SEL _cmd) {
    if ([self class] == [ACObject class]) {
        return @"I'm mutant";
    } else {
        return [self performSelector:@selector(originalSuperclassDescription)];
    }
    return nil;
}


#pragma mark - restore functions

static IMP originalDescription = nil;

void save_object_description_method() {
    Class cls = NSClassFromString(@"ACObject");
    originalDescription = class_getMethodImplementation(cls, @selector(description));
}

void restore_object_description_method() {
    Class cls = NSClassFromString(@"ACObject");
    class_replaceMethod(cls, @selector(description), originalDescription, "v@:");
}

#pragma mark - change functions

void replace_object_description_method() {
    Class cls = NSClassFromString(@"ACObject");
    class_replaceMethod(cls, @selector(description), (IMP)newDescriptionIMP, "v@:");
}

void transplant_object_description_method() {
    Class cls = NSClassFromString(@"ACObject");
    IMP oldDescriptionImp = class_getMethodImplementation(cls, @selector(description));
    class_addMethod(cls, @selector(description_old), oldDescriptionImp, "v@:");
    class_replaceMethod(cls, @selector(description), (IMP)newDescriptionWithOldIMP, "v@:");
}

void mutate_object_description_method() {
    Class cls = NSClassFromString(@"ACObject");
    originalSuperclassDescription = class_getMethodImplementation([cls superclass], @selector(description));
    class_replaceMethod([cls superclass], @selector(description), (IMP)mutantDescriptionIMP, "v@:");
}
