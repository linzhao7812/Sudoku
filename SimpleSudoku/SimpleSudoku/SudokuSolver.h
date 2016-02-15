//
//  SudokuSolver.h
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-13.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoDimentionalArray.h"

/**
 * The implementation of the search algorithm to solve a 9x9 Sudoku game.
 */
@interface SudokuSolver : NSObject {

}

- (BOOL)solve : (TwoDimentionalArray *)array;
- (void)printTwoDimentionalArray : (TwoDimentionalArray *)array;

@end
