//
//  MatrixOperations.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Matrix.h"

@implementation Matrix (MatrixOperations)


- (Matrix*)transpose
{
	double buffer[columns*rows];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++)
			buffer[c*rows+r] = elements[r*columns+c];
	}
	Matrix* result = [Matrix matrixWithElements:buffer rows:columns columns:rows];
	return result;
}

- (Matrix*)multiplyByMatrix:(Matrix*)matrix{
	if(columns != matrix.rows) return nil;
	
	Matrix* result = [Matrix matrixWithRows:rows columns:matrix.columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<matrix.columns; c++){
			double sum = 0.0;
			for(NSUInteger k=0; k<columns; k++)
				sum += elements[r+k*rows] * matrix.elements[c*matrix.rows+k];
			result.elements[c*rows+r] = sum;
		}
	}
	return result;
}

- (Matrix*)multiplyByScalar:(double)scalar{
	Matrix* result = [Matrix matrixWithRows:rows columns:columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			result.elements[c*rows+r] = elements[c*rows+r]*scalar;
		}
	}
	return result;
}

- (Matrix*)addScalar:(double)scalar{
	Matrix* result = [Matrix matrixWithRows:rows columns:columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			result.elements[c*rows+r] = elements[c*rows+r]+scalar;
		}
	}
	return result;
}


- (Matrix*)addMatrix:(Matrix*)matrix{
	if(columns != matrix.columns || rows != matrix.rows) return nil;
	
	Matrix* result = [Matrix matrixWithRows:rows columns:matrix.columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			result.elements[c*rows+r] = elements[c*rows+r] + matrix.elements[c*rows+r];
		}
	}
	return result;
}

- (Matrix*)directSumWithMatrix:(Matrix*)B{
	Matrix *A = self;
	Matrix* result = [Matrix matrixWithRows:A.rows+B.rows columns:A.columns+B.columns];
	for(NSUInteger r=0; r<A.rows; r++){
		for(NSUInteger c=0; c<A.columns; c++){
			result.elements[c*result.rows+r] = A.elements[c*A.rows+r];
		}
	}
	for(NSUInteger r=0; r<B.rows; r++){
		for(NSUInteger c=0; c<B.columns; c++){
			result.elements[(A.columns+c)*result.rows+(A.rows+r)] = B.elements[c*B.rows+r];
		}
	}
	return result;
}


@end
