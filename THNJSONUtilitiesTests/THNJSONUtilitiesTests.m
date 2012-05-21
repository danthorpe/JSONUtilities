//
//  THNJSONUtilitiesTests.m
//  THNJSONUtilitiesTests
//
//  Created by Daniel Thorpe on 21/05/2012.
//  Copyright (c) 2012 Blinding Skies Limited. All rights reserved.
//

#import "THNJSONUtilities.h"
#import "THNJSONUtilitiesTests.h"

@implementation THNJSONUtilitiesTests

- (void)testJSON {
    
    id validJSON = [NSArray arrayWithObject:
                    [NSDictionary dictionaryWithObjectsAndKeys:
                     @"this is a string value", @"string key",
                     [NSNumber numberWithInteger:42], @"the answer",
                     [NSNumber numberWithBool:YES], @"true value",
                     [NSNumber numberWithFloat:5.468792], @"float value",
                     [NSArray arrayWithObjects:@"cat", @"dog", @"fish", nil], @"animals",
                     nil]];

    // We don't need to test that the result is exactly the same just that it throws no
    // errors and returns a non nil
    id result = nil;
    STAssertNoThrow(result = THNJSONDecode(THNJSONEncode(validJSON, NULL), NULL), @"Should not throw any exceptions.");
    STAssertNotNil(result, @"The result should not be nil");
}


@end
