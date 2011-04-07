//
//  Test_Matrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 2/19/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_Matrix.h"


@implementation Test_Matrix


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
