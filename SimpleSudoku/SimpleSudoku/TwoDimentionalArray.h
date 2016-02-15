//
//  TwoDimentionalArray.h
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-12.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * A definition of a 2-D array implemented to describe the 9X9 sudoku board. 
 * It helps to set and get values to and from a specific cell.
 */
@interface TwoDimentionalArray : NSObject {
    NSMutableDictionary *twoDimensionalArray;
}

- (void)setValuesToArray : (int)rows cols:(int) col value:(id)value;
- (id)getValueFromArray : (int)rows cols:(int) col;
- (int)getRowNumber : (int)num;
- (int)getColNumber : (int)num;

@end
