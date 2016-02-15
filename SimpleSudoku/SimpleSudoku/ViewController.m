//
//  ViewController.m
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-12.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"

// Private method definitions
@interface ViewController ()
- (void)renderResults;
- (void)resetBoard:(NSString*)sudoku;
- (void)showAlert;
@end

@implementation ViewController {
}

@synthesize board;

- (void)viewDidLoad {
    if (!array) {
        array = [[TwoDimentionalArray alloc] init];
    }
    
    if (!solver) {
        solver = [[SudokuSolver alloc] init];
    }
    
    [self resetBoard:SUDOKU];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetButtonPressed:(id)sender {
    [self resetBoard:curSudoku];
}

- (IBAction)solveButtonPressed:(id)sender {
    BOOL solved = [solver solve:array];
    NSLog(@"solved: %@", solved ? @"YES" : @"NO");
    
    if (solved) {
        [self renderResults];
    } else {
        [self showAlert];
    }
}

- (IBAction)gameIButtonPressed:(id)sender {
    [self resetBoard:GAME_I];
}

- (IBAction)gameIIButtonPressed:(id)sender {
    [self resetBoard:GAME_II];
}

- (IBAction)gameIIIButtonPressed:(id)sender {
    [self resetBoard:GAME_III];
}

/**
 * Show alert dialog if the Sudoku is invalid
 */
- (void)showAlert {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Error"
                                  message:@"Invalid Sudoku"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

/**
 * Reset the Sudoku grid with a pre-defined game
 */
- (void)resetBoard:(const NSString*)sudoku {
    curSudoku = [NSString stringWithFormat:@"%@", sudoku];
    
    for (int i = 0; i < [sudoku length]; i++) {
        NSString *title = [sudoku substringWithRange:NSMakeRange(i, 1)];
        
        UIButton *button = (UIButton*)[board objectAtIndex:i];
        int col = [array getColNumber:i];
        int row = [array getRowNumber:i];
        
        if (title.intValue == 0) {
            [array setValuesToArray:row cols:col value:@"."];
            [button setTitle:@" " forState:UIControlStateNormal];
        } else {
            [array setValuesToArray:row cols:col value:title];
            [button setTitle:title forState:UIControlStateNormal];
        }
    }
}

/**
 * Render the solution
 */
- (void)renderResults {
    for (int r = 0; r < ROW_COLUMN_CELL_NUM; r ++) {
        for (int c = 0; c < ROW_COLUMN_CELL_NUM; c ++) {
            NSString *value = [array getValueFromArray:r cols:c];
            UIButton *button = (UIButton*)[board objectAtIndex:(c+r*ROW_COLUMN_CELL_NUM)];
            [button setTitle:value forState:UIControlStateNormal];
        }
    }
}

@end
