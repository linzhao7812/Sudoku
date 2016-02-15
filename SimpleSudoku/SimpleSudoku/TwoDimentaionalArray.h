//
//  TwoDimentaionalArray.h
//  SimpleSudoku
//
//  Created by Lin Zhao on 2016-02-12.
//  Copyright © 2016 Lin Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwoDimentionalArray : NSObject {
    NSMutableDictionary *twoDimensionalArray;
}

- (void)setValuesToArray : (int)rows cols:(int) col value:(id)value;
- (id)getValueFromArray : (int)rows cols:(int) col;
@end
