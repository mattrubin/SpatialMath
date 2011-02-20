//
//  Test_Matrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 2/19/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_Matrix.h"
#import <SpatialMath/SpatialMath.h>

@implementation Test_Matrix

- (void)test_initWithRows_columns
{
	NSUInteger rows = 9;
	NSUInteger columns = 15;
	Matrix *m = [[Matrix alloc] initWithRows:rows columns:columns];
	
    STAssertEquals(m.rows, rows, @"Wrong number of rows");
    STAssertEquals(m.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(m.elements[i], 0.0, @"Elements must initialize to zero (Failed for element %i)", i);
	}
}

- (void) test_initWithElements_rows_columns {}
- (void) test_initWithMatrix {}
- (void) test_initWithMatrix_byRemovingRow_column {}
- (void) test_initIdentityMatrixWithSize {}

- (void) test_matrixWithRows_columns {}
- (void) test_matrixWithElements_rows_columns {}
- (void) test_matrixWithMatrix {}
- (void) test_matrixWithMatrix_byRemovingRow_column {}
- (void) test_identityMatrixWithSize {}

- (void) test_isSquare {}
- (void) test_isDiagonal {}
- (void) test_isSymmetric {}
- (void) test_isOrthogonal {}
- (void) test_isEqualToMatrix {}
- (void) test_isEqualToElements_rows_columns {}

- (void) test_row {}
- (void) test_column {}
- (void) test_elementAtRow_column {}

@end
