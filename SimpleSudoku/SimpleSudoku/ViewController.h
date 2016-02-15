//
//  ViewController.h
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-12.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoDimentionalArray.h"
#import "SudokuSolver.h"
//#import "SudokuSolver.h"



@interface ViewController : UIViewController {

@private TwoDimentionalArray *array;
@private SudokuSolver *solver;
@private NSString *curSudoku;
    
}

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *board;

- (IBAction)resetButtonPressed:(id)sender;
- (IBAction)solveButtonPressed:(id)sender;
- (void)renderResults;
- (void)resetBoard:(NSString*)sudoku;
- (IBAction)gameIButtonPressed:(id)sender;
- (IBAction)gameIIButtonPressed:(id)sender;
- (IBAction)gameIIIButtonPressed:(id)sender;

@end

