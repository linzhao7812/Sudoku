//
//  SudokuSolver.h
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-13.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoDimentionalArray.h"


@interface SudokuSolver : NSObject {

}

- (BOOL)solve : (TwoDimentionalArray *)array;
- (BOOL)isValid : (TwoDimentionalArray *)array rows:(int)r cols:(int)c;

- (BOOL)isRowValid : (TwoDimentionalArray *)array rows:(int)r;
- (BOOL)isColValid : (TwoDimentionalArray *)array cols:(int)c;
- (BOOL)isGridValid : (TwoDimentionalArray *)array rows:(int)r cols:(int)c;

- (void)printTwoDimentionalArray : (TwoDimentionalArray *)array;

@end
