//
//  Test_Matrix.h
//  SpatialMath
//
//  Created by Matt Rubin on 2/19/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "TestBundle.h"


@interface Test_Matrix : SenTestCase {}

- (void) isSquare;
- (void) isDiagonal;
- (void) isSymmetric;
- (void) isOrthogonal;
- (void) isEqualToMatrix;
- (void) isEqualToElements_rows_columns;

- (void) row;
- (void) column;
- (void) elementAtRow_column;


@end
