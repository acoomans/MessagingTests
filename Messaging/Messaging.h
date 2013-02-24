//
//  Messaging.h
//  Messaging
//
//  Created by Arnaud Coomans on 2/23/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "ACObject.h"

#import <objc/message.h>

void save_object_description_method();
void restore_object_description_method();

/* replace ACObject's description method with another description method
 */
void replace_object_description_method();

/* replace ACObject's description method with another description method; and with the new description method call the old description method
 */
void transplant_object_description_method();

/* replace ACObject's superclass's description method with another description method
 */
void mutate_object_description_method();