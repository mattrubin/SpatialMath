//
//  Test_Matrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 2/19/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_Matrix.h"
#import <SpatialMath/SpatialMath.h>

#define LOOP(max, code) for(int i=0; i<max; i++){ code; }


@implementation Test_Matrix

- (void)test_initWithRows_columns {
	LOOP(100, [self initWithRows_columns]);
}
- (void) test_initWithElements_rows_columns {
	LOOP(10, [self initWithElements_rows_columns]);
}
- (void) test_initWithMatrix {
	LOOP(10, [self initWithMatrix]);
}
- (void) test_initWithMatrix_byRemovingRow_column {
	LOOP(100, [self initWithMatrix_byRemovingRow_column]);
}
- (void) test_initIdentityMatrixWithSize {
	LOOP(100, [self initIdentityMatrixWithSize]);
}

- (void) test_matrixWithRows_columns {
	LOOP(100, [self matrixWithRows_columns]);
}
- (void) test_matrixWithElements_rows_columns {
	LOOP(100, [self matrixWithElements_rows_columns]);
}
- (void) test_matrixWithMatrix {
	LOOP(100, [self matrixWithMatrix]);
}
- (void) test_matrixWithMatrix_byRemovingRow_column {
	LOOP(100, [self matrixWithMatrix_byRemovingRow_column]);
}
- (void) test_identityMatrixWithSize {
	LOOP(100, [self identityMatrixWithSize]);
}

- (void) test_isSquare {
	LOOP(100, [self isSquare]);
}
- (void) test_isDiagonal {
	LOOP(100, [self isDiagonal]);
}
- (void) test_isSymmetric {
	LOOP(100, [self isSymmetric]);
}
- (void) test_isOrthogonal {
	LOOP(100, [self isOrthogonal]);
}
- (void) test_isEqualToMatrix {
	LOOP(100, [self isEqualToMatrix]);
}
- (void) test_isEqualToElements_rows_columns {
	LOOP(100, [self isEqualToElements_rows_columns]);
}

- (void) test_row {
	LOOP(100, [self row]);
}
- (void) test_column {
	LOOP(100, [self column]);
}
- (void) test_elementAtRow_column {
	LOOP(100, [self elementAtRow_column]);
}

#pragma mark -

- (void)initWithRows_columns
{
	NSUInteger rows = arc4random()%100 + 1;
	NSUInteger columns = arc4random()%100 + 1;
	Matrix *m = [[Matrix alloc] initWithRows:rows columns:columns];
	
    STAssertEquals(m.rows, rows, @"Wrong number of rows");
    STAssertEquals(m.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(m.elements[i], 0.0, @"Elements must initialize to zero (Failed for element %i)", i);
	}
}
- (void) initWithElements_rows_columns {
	NSUInteger rows = arc4random()%20 + 1;
	NSUInteger columns = arc4random()%20 + 1;
	double buffer[rows*columns];
	LOOP(rows*columns, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Matrix *m = [[Matrix alloc] initWithElements:buffer rows:rows columns:columns];
	
    STAssertEquals(m.rows, rows, @"Wrong number of rows");
    STAssertEquals(m.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(m.elements[i], buffer[i], @"Elements must initialize to zero (Failed for element %i)", i);
	}
}
- (void) initWithMatrix {
	NSUInteger rows = arc4random()%20 + 1;
	NSUInteger columns = arc4random()%20 + 1;
	double buffer[rows*columns];
	LOOP(rows*columns, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Matrix *m = [[Matrix alloc] initWithElements:buffer rows:rows columns:columns];
	Matrix *n = [[Matrix alloc] initWithMatrix:m];
	
    STAssertEquals(n.rows, rows, @"Wrong number of rows");
    STAssertEquals(n.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(n.elements[i], buffer[i], @"Elements must initialize to zero (Failed for element %i)", i);
	}
}
- (void) initWithMatrix_byRemovingRow_column {}
- (void) initIdentityMatrixWithSize {}

- (void) matrixWithRows_columns {}
- (void) matrixWithElements_rows_columns {}
- (void) matrixWithMatrix {}
- (void) matrixWithMatrix_byRemovingRow_column {}
- (void) identityMatrixWithSize {}

- (void) isSquare {}
- (void) isDiagonal {}
- (void) isSymmetric {}
- (void) isOrthogonal {}
- (void) isEqualToMatrix {}
- (void) isEqualToElements_rows_columns {}

- (void) row {}
- (void) column {}
- (void) elementAtRow_column {}


@end
