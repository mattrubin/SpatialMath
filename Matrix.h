//
//  Matrix.h
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#pragma once
#import <Cocoa/Cocoa.h>


@interface Matrix : NSObject {
	NSUInteger rows;
	NSUInteger columns;
	double* elements;
}

@property (readonly) double* elements;
@property (readonly) NSUInteger rows;
@property (readonly) NSUInteger columns;

// Initializers
- (id)initWithRows:(NSUInteger)numberOfRows columns:(NSUInteger)numberOfColumns;
- (id)initWithElements:(double*)elementArray rows:(NSUInteger)numberOfRows columns:(NSUInteger)numberOfColumns;
- (id)initWithMatrix:(Matrix*)matrix;
- (id)initWithMatrix:(Matrix*)matrix byRemovingRow:(NSUInteger)rowNumber column:(NSUInteger)columnNumber;
- (id)initIdentityMatrixWithSize:(NSUInteger)size;

// Generators
+ (id)matrixWithRows:(NSUInteger)numberOfRows columns:(NSUInteger)numberOfColumns;
+ (id)matrixWithElements:(double*)elementArray rows:(NSUInteger)numberOfRows columns:(NSUInteger)numberOfColumns;
+ (id)matrixWithMatrix:(Matrix*)matrix;
+ (id)matrixWithMatrix:(Matrix*)matrix byRemovingRow:(NSUInteger)rowNumber column:(NSUInteger)columnNumber;
+ (id)identityMatrixWithSize:(NSUInteger)size;

// Boolean Properties
- (bool)isSquare;
- (bool)isDiagonal;
- (bool)isSymmetric;
- (bool)isOrthogonal;
- (bool)isInvertible;
- (bool)isZero;

// Comparison Functions
- (bool)isEqualToMatrix:(Matrix *)matrix;
- (bool)isEqualToElements:(double*)elementArray rows:(NSUInteger)numberOfRows columns:(NSUInteger)numberOfColumns;

// Accessors
- (Matrix*)row:(NSUInteger)rowNumber;
- (Matrix*)column:(NSUInteger)columnNumber;
- (double)elementAtRow:(NSUInteger)rowNumber column:(NSUInteger)columnNumber;

@end


@interface Matrix (MatrixOperations)

- (Matrix*)multiplyByMatrix:(Matrix*)matrix;
- (Matrix*)multiplyByScalar:(double)scalar;
- (Matrix*)addScalar:(double)scalar;
- (Matrix*)addMatrix:(Matrix*)matrix;
- (Matrix*)directSumWithMatrix:(Matrix*)matrix;

- (double)determinant;

//- (Matrix*)inverse;

- (Matrix*)transpose;
- (double)cofactorOfRow:(NSUInteger)r column:(NSUInteger)c;

@end
