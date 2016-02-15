//
//  TwoDimentionalArray.m
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-12.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import "TwoDimentionalArray.h"
#import "Constants.h"

@implementation TwoDimentionalArray

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

- (int)getRowNumber : (int)num {
    if (num >= 0 && num < TOTAL_CELL_NUM) {
        return num / ROW_COLUMN_CELL_NUM;
    }
    
    return -1;
}

- (int)getColNumber : (int)num {
    if (num >= ROW_COLUMN_CELL_NUM) {
        return num % ROW_COLUMN_CELL_NUM;
    }
    
    return num;
}

- (void)printTwoDimentionalArray : (int)rows cols:(int) col {
}

@end
