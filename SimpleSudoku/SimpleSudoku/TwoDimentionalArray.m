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

/**
 * Set up the array with the value for a specific cell
 */
- (void)setValuesToArray : (int)rows cols:(int) col value:(id)value {
    // Initialize the 2D-array
    if (!twoDimensionalArray) {
        twoDimensionalArray = [[NSMutableDictionary alloc] init];
    }
    
    // Generate the key in format of "row#"Vs"col#", and assign the value
    NSString *strKey = [NSString stringWithFormat:@"%dVs%d", rows, col];
    [twoDimensionalArray setObject:value forKey:strKey];
}


/**
 * Retrieve the value from a specific cell
 */
- (id)getValueFromArray : (int)rows cols:(int) col {
    NSString *strKey = [NSString stringWithFormat:@"%dVs%d", rows, col];
    return [twoDimensionalArray valueForKey:strKey];
}

/**
 * Get the row number from the index of the pre-defined Sudoku string
 */
- (int)getRowNumber : (int)num {
    if (num >= 0 && num < TOTAL_CELL_NUM) {
        return num / ROW_COLUMN_CELL_NUM;
    }
    
    return -1;
}

/**
 * Get the column number from the index of the pre-defined Sudoku string
 */
- (int)getColNumber : (int)num {
    if (num >= ROW_COLUMN_CELL_NUM) {
        return num % ROW_COLUMN_CELL_NUM;
    }
    
    return num;
}

@end
