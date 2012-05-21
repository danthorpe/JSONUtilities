//
//  THNJSONUtilities.m
//  THNJSONUtilities
//
//  Created by Daniel Thorpe on 21/05/2012.
//  Copyright (c) 2012 Blinding Skies Limited. All rights reserved.
//

#import "THNJSONUtilities.h"

NSData * THNJSONEncode(id obj, NSError **error) {
    NSData *data = nil;
    
    // Define the selectors & classes
    SEL JSONKitSelector = NSSelectorFromString(@"JSONDataWithOptions:error:");
    
    id NSJSONSerializationClass = NSClassFromString(@"NSJSONSerialization");
    SEL NSJSONSerializationSelector = NSSelectorFromString(@"dataWithJSONObject:options:error:");
    
    if (JSONKitSelector && [obj respondsToSelector:JSONKitSelector]) {
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[obj methodSignatureForSelector:JSONKitSelector]];
        invocation.target = obj;
        invocation.selector = JSONKitSelector;

        NSUInteger options = 0;
        [invocation setArgument:&options atIndex:2];
        
        if (error != NULL) {
            [invocation setArgument:error atIndex:3];
        }
        
        [invocation invoke];
        [invocation getReturnValue:&data];

    } else if (NSJSONSerializationClass && [NSJSONSerializationClass respondsToSelector:NSJSONSerializationSelector]) {

        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[NSJSONSerializationClass methodSignatureForSelector:NSJSONSerializationSelector]];
        invocation.target = NSJSONSerializationClass;
        invocation.selector = NSJSONSerializationSelector;
        
        [invocation setArgument:&obj atIndex:2];
        
        NSUInteger options = 0;
        [invocation setArgument:&options atIndex:3];

        if (error != NULL) {
            [invocation setArgument:error atIndex:4];
        }
        
        [invocation invoke];
        [invocation getReturnValue:&data];
        
    } else {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:NSLocalizedString(@"Please either target a platform that supports NSJSONSerialization or add one of the following libraries to your project: JSONKit", nil) forKey:NSLocalizedRecoverySuggestionErrorKey];
        [[NSException exceptionWithName:NSInternalInconsistencyException reason:NSLocalizedString(@"No JSON generation functionality available", nil) userInfo:userInfo] raise];
    }
    
    return data;
}

id THNJSONDecode(NSData *data, NSError **error) {
    id JSON = nil;
    
    // Define the selectors & classes
    SEL JSONKitSelector = NSSelectorFromString(@"objectFromJSONDataWithParseOptions:error:");
    
    id NSJSONSerializationClass = NSClassFromString(@"NSJSONSerialization");
    SEL NSJSONSerializationSelector = NSSelectorFromString(@"JSONObjectWithData:options:error:");
    
    if (JSONKitSelector && [data respondsToSelector:JSONKitSelector]) {
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[data methodSignatureForSelector:JSONKitSelector]];
        invocation.target = data;
        invocation.selector = JSONKitSelector;
        
        NSUInteger options = 0;
        [invocation setArgument:&options atIndex:2];
        
        if (error != NULL) {
            [invocation setArgument:error atIndex:3];
        }
        
        [invocation invoke];
        [invocation getReturnValue:&JSON];
        
    } else if (NSJSONSerializationClass && [NSJSONSerializationClass respondsToSelector:NSJSONSerializationSelector]) {
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[NSJSONSerializationClass methodSignatureForSelector:NSJSONSerializationSelector]];
        invocation.target = NSJSONSerializationClass;
        invocation.selector = NSJSONSerializationSelector;
        
        [invocation setArgument:&data atIndex:2];
        
        NSUInteger options = 0;
        [invocation setArgument:&options atIndex:3];
        
        if (error != NULL) {
            [invocation setArgument:error atIndex:4];
        }
        
        [invocation invoke];
        [invocation getReturnValue:&JSON];
        
    } else {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:NSLocalizedString(@"Please either target a platform that supports NSJSONSerialization or add one of the following libraries to your project: JSONKit", nil) forKey:NSLocalizedRecoverySuggestionErrorKey];
        [[NSException exceptionWithName:NSInternalInconsistencyException reason:NSLocalizedString(@"No JSON generation functionality available", nil) userInfo:userInfo] raise];
    }

    
    return JSON;
}

@implementation THNJSONUtilities
@end
