//
//  Test_GenericMatrix.h
//  SpatialMath
//
//  Created by Matt Rubin on 4/7/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "TestBundle.h"


@interface Test_GenericMatrix : SenTestCase {}

// Initializers
- (void) initWithRows_columns;
- (void) initWithElements_rows_columns;
- (void) initWithMatrix;
- (void) initWithMatrix_byRemovingRow_column;
- (void) initIdentityMatrixWithSize;


// Generators
- (void) matrixWithRows_columns;
- (void) matrixWithElements_rows_columns;
- (void) matrixWithMatrix;
- (void) matrixWithMatrix_byRemovingRow_column;
- (void) identityMatrixWithSize;

@end
