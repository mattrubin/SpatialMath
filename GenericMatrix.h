//
//  GenericMatrix.h
//  SpatialMath
//
//  Created by Matt Rubin on 4/2/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#pragma once
#import "Matrix.h"


@interface GenericMatrix : Matrix {}

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

@end
