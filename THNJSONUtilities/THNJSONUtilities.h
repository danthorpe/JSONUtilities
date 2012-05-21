//
//  THNJSONUtilities.h
//  THNJSONUtilities
//
//  Created by Daniel Thorpe on 21/05/2012.
//  Copyright (c) 2012 Blinding Skies Limited. All rights reserved.
//

// This is heavily inspired by AFNetworking's JSONUtilities
// functions. See: https://github.com/AFNetworking/AFNetworking
// The purpose to create a generic pair of functions
// to execute JSON coding, which removes the requirements to
// include JSON libraries in library code such as Facebook & 
// Amazon's SDk.

#import <Foundation/Foundation.h>

extern NSData * THNJSONEncode(id obj, NSError **error);
extern id THNJSONDecode(NSData *data, NSError **error);

@interface THNJSONUtilities : NSObject
@end
