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
				sum += elements[r+k*columns] * matrix.elements[c*matrix.rows+k];
			result.elements[c*rows+r] = sum;
		}
	}
	return result;
}


@end
