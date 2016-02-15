//
//  TwoDimentaionalArray.m
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-12.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import "TwoDimentaionalArray.h"

@implementation TwoDimentaionalArray

- (void)setValuesToArray : (int)rows cols:(int) col value:(id)value {
    // Initialize the 2D-array
    if (!twoDimensionalArray) {
        twoDimensionalArray = [[NSMutableDictionary alloc] init];
    }
    
    // Generate the key in format of "row#"Vs"col#", and assign the value
    NSString *strKey = [NSString stringWithFormat:@"%dVs%d", rows, col];
    [twoDimensionalArray setObject:value forKey:strKey];
}

- (id)getValueFromArray : (int)rows cols:(int) col {
    NSString *strKey = [NSString stringWithFormat:@"%dVs%d", rows, col];
    return [twoDimensionalArray valueForKey:strKey];
}

- (void)printTwoDimentionalArray : (int)rows cols:(int) col {
    
}

@end
