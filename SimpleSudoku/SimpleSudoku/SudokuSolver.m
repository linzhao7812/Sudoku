//
//  SudokuSolver.m
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-13.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import "SudokuSolver.h"
#import "Constants.h"

// Private methods definitions
@interface SudokuSolver ()
- (BOOL)isValid : (TwoDimentionalArray *)array rows:(int)r cols:(int)c;
- (BOOL)isRowValid : (TwoDimentionalArray *)array rows:(int)r;
- (BOOL)isColValid : (TwoDimentionalArray *)array cols:(int)c;
- (BOOL)isGridValid : (TwoDimentionalArray *)array rows:(int)r cols:(int)c;
@end

@implementation SudokuSolver

/**
 * Implementation of the searching algorithm in a recursive manner. Each recursice call takes care of
 * the first open space "." still to be handled. That will be replaced tentatively with a number (from
 * 1 to 9). If the number is valid, then go recurse which will try the next open space. If it fails, undo
 * the number replacement, and return false which forces the callers to try the next number. It returns true
 * only when the entire grid is fully solved.
 *
 * @param array A 2-D array pre-filled with a Sudoku game with "." indicating the open space.
 *
 * @return BOOL - YES if the game is solved
 *                 NO if the game is invalid
 */
- (BOOL)solve : (TwoDimentionalArray *)array {
    for (int row = 0; row < ROW_COLUMN_CELL_NUM; row ++) {
        for (int col = 0; col < ROW_COLUMN_CELL_NUM; col ++) {
            NSString *value = [array getValueFromArray:row cols:col];
            if ([value caseInsensitiveCompare:@"."] == NSOrderedSame) {
                for (int k = 1; k <= ROW_COLUMN_CELL_NUM; k ++) {
                    // Tentatively assign the number to the open space
                    [array setValuesToArray:row cols:col value:[NSString stringWithFormat:@"%i", k]];
                    // Validate the board and solve the next open space recursively
                    if ([self isValid:array rows:row cols:col] && [self solve:array]) {
                        return true;
                    } else {
                        // Undo the previous assignment
                        [array setValuesToArray:row cols:col value:@"."];
                    }
                }
                return false;
            }
        }
    }
    
    return true;
}

/**
 * Validate the Sudoku board based on the rules for rows and columns and 3x3 grids.
 *
 * @param array A 2-D array pre-filled with a Sudoku game with "." indicating the open space.
 * @param r row number
 * @param c column number
 *
 * @return BOOL - YES if the boear is still valid
 *                 NO otherwise
 */
- (BOOL)isValid : (TwoDimentionalArray *)array rows:(int)r cols:(int)c {
    // Check row
    if (![self isRowValid:array rows:r]) {
        return false;
    }
    
    // Check col
    if (![self isColValid:array cols:c]) {
        return false;
    }
    
    // Check 3x3 grid
    if (![self isGridValid:array rows:r cols:c]) {
        return false;
    }
    
    return true;
}

- (BOOL)isRowValid : (TwoDimentionalArray *)array rows:(int)r {
    NSMutableArray *row = [NSMutableArray arrayWithCapacity:ROW_COLUMN_CELL_NUM];
    BOOL b = NO;
    for (int idx = 0; idx < ROW_COLUMN_CELL_NUM; idx ++) {
        [row addObject:[NSNumber numberWithBool:b]];
    }
    
    for (int i = 0; i < ROW_COLUMN_CELL_NUM; i ++) {
        NSString *value = [array getValueFromArray:r cols:i];
        if ([value caseInsensitiveCompare:@"."] == NSOrderedSame) {
            continue;
        }
        
        int num = [value intValue];
        if (num >= 1 && num <= ROW_COLUMN_CELL_NUM) {
            int idx = num - 1;
            if ([[row objectAtIndex:idx] boolValue] == b) {
                [row replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:YES]];
            } else {
                return false;
            }
        }
    }
    
    return true;
}

- (BOOL)isColValid : (TwoDimentionalArray *)array cols:(int)c {
    NSMutableArray *col = [NSMutableArray arrayWithCapacity:ROW_COLUMN_CELL_NUM];
    BOOL b = NO;
    for (int idx = 0; idx < ROW_COLUMN_CELL_NUM; idx ++) {
        [col addObject:[NSNumber numberWithBool:b]];
    }
    
    for (int i = 0; i < ROW_COLUMN_CELL_NUM; i ++) {
        NSString *value = [array getValueFromArray:i cols:c];
        if ([value caseInsensitiveCompare:@"."] == NSOrderedSame) {
            continue;
        }
        
        int num = [value intValue];
        if (num >= 1 && num <= ROW_COLUMN_CELL_NUM) {
            int idx = num - 1;
            if ([[col objectAtIndex:idx] boolValue] == b) {
                [col replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:YES]];
            } else {
                return false;
            }
        }
    }
    
    return true;
}

- (BOOL)isGridValid : (TwoDimentionalArray *)array rows:(int)r cols:(int)c {
    NSMutableArray *grid = [NSMutableArray arrayWithCapacity:ROW_COLUMN_CELL_NUM];
    BOOL b = NO;
    for (int idx = 0; idx < ROW_COLUMN_CELL_NUM; idx ++) {
        [grid addObject:[NSNumber numberWithBool:b]];
    }
    
    for (int i = (r/GRID_SIZE)*GRID_SIZE; i < (r/GRID_SIZE)*GRID_SIZE+GRID_SIZE; i ++) {
        for (int j = (c/GRID_SIZE)*GRID_SIZE; j < (c/GRID_SIZE)*GRID_SIZE+GRID_SIZE; j ++) {
            NSString *value = [array getValueFromArray:i cols:j];
            if ([value caseInsensitiveCompare:@"."] == NSOrderedSame) {
                continue;
            }
            
            int num = [value intValue];
            if (num >= 1 && num <= ROW_COLUMN_CELL_NUM) {
                int idx = num - 1;
                if ([[grid objectAtIndex:idx] boolValue] == b) {
                    [grid replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:YES]];
                } else {
                    return false;
                }
            }
        }
    }
    
    return true;
}

- (void)printTwoDimentionalArray : (TwoDimentionalArray *)array {
    for (int i = 0; i < ROW_COLUMN_CELL_NUM; i ++) {
        for (int j = 0; j < ROW_COLUMN_CELL_NUM; j ++) {
            NSString *value = [array getValueFromArray:i cols:j];
            NSLog(@"row:%d, col:%d, value: %@", i, j, value);
        }
    }
}

@end
