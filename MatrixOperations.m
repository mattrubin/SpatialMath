//
//  MatrixOperations.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Matrix.h"
#import "GenericMatrix.h"

@implementation Matrix (MatrixOperations)


- (Matrix*)transpose
{
	double buffer[columns*rows];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++)
			buffer[r*columns+c] = elements[c*rows+r];
	}
	Matrix* result = [GenericMatrix matrixWithElements:buffer rows:columns columns:rows];
	return result;
}

- (Matrix*)multiplyByMatrix:(Matrix*)matrix{
	if(columns != matrix.rows) return nil;
	
	Matrix* result = [GenericMatrix matrixWithRows:rows columns:matrix.columns];
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
	Matrix* result = [GenericMatrix matrixWithRows:rows columns:columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			result.elements[c*rows+r] = elements[c*rows+r]*scalar;
		}
	}
	return result;
}

- (Matrix*)addScalar:(double)scalar{
	Matrix* result = [GenericMatrix matrixWithRows:rows columns:columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			result.elements[c*rows+r] = elements[c*rows+r]+scalar;
		}
	}
	return result;
}


- (Matrix*)addMatrix:(Matrix*)matrix{
	if(columns != matrix.columns || rows != matrix.rows) return nil;
	
	Matrix* result = [GenericMatrix matrixWithRows:rows columns:matrix.columns];
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			result.elements[c*rows+r] = elements[c*rows+r] + matrix.elements[c*rows+r];
		}
	}
	return result;
}

- (Matrix*)directSumWithMatrix:(Matrix*)B{
	Matrix *A = self;
	Matrix* result = [GenericMatrix matrixWithRows:A.rows+B.rows columns:A.columns+B.columns];
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





- (double)cofactorOfRow:(NSUInteger)r column:(NSUInteger)c
{
	NSLog(@"calculationg cofactor of (%i,%i) in a %ix%i matrix:", r,c, rows, columns);
	Matrix *cofactorMatrix = [GenericMatrix matrixWithMatrix:self byRemovingRow:r column:c];
	NSLog(@"%@", cofactorMatrix);
	double cofactor = [cofactorMatrix determinant];
	if((r+c)%2!=0) cofactor *= -1;
	NSLog(@"     ...%f", cofactor);
	return cofactor;
}

double determinant(Matrix *m)
{
	double det = 0.0;
	switch (m.rows) {
		case 1:
			return m.elements[0];
			break;
		case 2:
			return m.elements[0]*m.elements[3]-m.elements[2]*m.elements[1];
			break;
		default:
			for(NSUInteger c=0; c<m.columns; c++)
				det += [m elementAtRow:0 column:c]*[m cofactorOfRow:0 column:c];
			return det;
			break;
	}
}

- (double)determinant
{
	NSAssert([self isSquare], @"Cannot calculate the determinant of a non-square matrix");
	return determinant(self);
}


@end
