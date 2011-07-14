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

// Boolean Properties
- (BOOL)isSquare;
- (BOOL)isDiagonal;
- (BOOL)isSymmetric;
- (BOOL)isOrthogonal;
- (BOOL)isInvertible;
- (BOOL)isZero;
- (BOOL)isEmpty;

// Comparison Functions
- (BOOL)isEqualToMatrix:(Matrix *)matrix;
- (BOOL)isEqualToElements:(double*)elementArray rows:(NSUInteger)numberOfRows columns:(NSUInteger)numberOfColumns;

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
