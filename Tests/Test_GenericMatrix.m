//
//  Test_GenericMatrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 4/7/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_GenericMatrix.h"


@implementation Test_GenericMatrix


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


- (void)initWithRows_columns
{
	NSUInteger rows = arc4random()%100 + 1;
	NSUInteger columns = arc4random()%100 + 1;
	Matrix *m = [[GenericMatrix alloc] initWithRows:rows columns:columns];
	
    STAssertEquals(m.rows, rows, @"Wrong number of rows");
    STAssertEquals(m.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(m.elements[i], 0.0, @"Elements must initialize to zero (Failed for element %i)", i);
	}
	
	[m release];
}
- (void) initWithElements_rows_columns {
	NSUInteger rows = arc4random()%20 + 1;
	NSUInteger columns = arc4random()%20 + 1;
	double buffer[rows*columns];
	LOOP(rows*columns, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Matrix *m = [[GenericMatrix alloc] initWithElements:buffer rows:rows columns:columns];
	
    STAssertEquals(m.rows, rows, @"Wrong number of rows");
    STAssertEquals(m.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(m.elements[i], buffer[i], @"Elements must initialize to zero (Failed for element %i)", i);
	}
	
	[m release];
}
- (void) initWithMatrix {
	NSUInteger rows = arc4random()%20 + 1;
	NSUInteger columns = arc4random()%20 + 1;
	double buffer[rows*columns];
	LOOP(rows*columns, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Matrix *m = [[GenericMatrix alloc] initWithElements:buffer rows:rows columns:columns];
	Matrix *n = [[GenericMatrix alloc] initWithMatrix:m];
	
    STAssertEquals(n.rows, rows, @"Wrong number of rows");
    STAssertEquals(n.columns, columns, @"Wrong number of columns");
	for(int i = 0; i < rows*columns; i++){
		STAssertEquals(n.elements[i], buffer[i], @"Elements must initialize to zero (Failed for element %i)", i);
	}
	
	[m release];
	[n release];
}
- (void) initWithMatrix_byRemovingRow_column {}
- (void) initIdentityMatrixWithSize {}


#pragma mark Generators
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

- (void) matrixWithRows_columns {}
- (void) matrixWithElements_rows_columns {}
- (void) matrixWithMatrix {}
- (void) matrixWithMatrix_byRemovingRow_column {}
- (void) identityMatrixWithSize {}


@end
