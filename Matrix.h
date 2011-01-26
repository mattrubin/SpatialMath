//
//  Matrix.h
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Matrix : NSObject {
	NSUInteger rows;
	NSUInteger columns;
	double* elements;
}

@property (readonly) double* elements;
@property (readonly) NSUInteger rows;
@property (readonly) NSUInteger columns;

- (id)initWithRows:(NSUInteger)r columns:(NSUInteger)c;
- (id)initWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c;
- (id)initWithMatrix:(Matrix*)m;
- (id)initWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)r column:(NSUInteger)c;
- (id)initIdentityMatrixWithSize:(NSUInteger)size;

+ (id)matrixWithRows:(NSUInteger)r columns:(NSUInteger)c;
+ (id)matrixWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c;
+ (id)matrixWithMatrix:(Matrix*)m;
+ (id)matrixWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)r column:(NSUInteger)c;
+ (id)identityMatrixWithSize:(NSUInteger)size;

- (bool)isSquare;
- (bool)isDiagonal;
- (bool)isSymmetric;
- (bool)isEqualToMatrix:(Matrix *)matrix;
- (bool)isEqualToElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c;

- (Matrix*)row:(NSUInteger)r;
- (Matrix*)column:(NSUInteger)c;
- (double)elementAtRow:(NSUInteger)r column:(NSUInteger)c;

@end


@interface Matrix (MatrixOperations)

- (Matrix*)multiplyByMatrix:(Matrix*)matrix;
- (Matrix*)multiplyByScalar:(double)scalar;
- (Matrix*)addScalar:(double)scalar;
- (Matrix*)addMatrix:(Matrix*)matrix;
- (Matrix*)directSumWithMatrix:(Matrix*)matrix;

//- (double)determinant;

//- (Matrix*)inverse;

- (Matrix*)transpose;

@end