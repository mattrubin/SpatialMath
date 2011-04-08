//
//  Matrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Matrix.h"
#import "GenericMatrix.h"
#import "GenericVector.h"

@implementation Matrix

#pragma mark Properties
@synthesize elements, rows, columns;


#pragma mark Initializers
/**
 * Initialize an empty matrix.
 */
- (id)init
{
	if((self = [super init])){
		rows = 0;
		columns = 0;
		elements = NULL;
	}
	return self;
}

#pragma mark Boolean Properties
/**
 * Returns true if the matrix has an equal number of rows and columns.
 */
- (bool)isSquare
{
	return rows==columns;
}

/**
 * Returns true if all elements outside the main diagonal are zero.
 * A matrix must be square to be diagonal.
 */
- (bool)isDiagonal
{
	if(rows!=columns) return FALSE;
	
	for(NSUInteger r=1; r<rows; r++){
		for(NSUInteger c=0; c<r; c++){
			if(elements[r*columns+c]!=0 || elements[c*columns+r]!=0) return FALSE;
		}
	}
	return TRUE;
}

/**
 * Returns true if the matrix is equal to its transpose (symmetric with respect to the main diagonal).
 * A matrix must be square to be symmetric.
 */
- (bool)isSymmetric
{
	if(rows!=columns) return FALSE;
	
	for(NSUInteger r=1; r<rows; r++){
		for(NSUInteger c=0; c<r; c++){
			if(elements[r*columns+c]!=elements[c*columns+r]) return FALSE;
		}
	}
	return TRUE;
}

/**
 * Returns true if the columns and rows are orthogonal unit vectors (i.e., orthonormal vectors).
 * A matrix must be square to be orthogonal.
 */
- (bool)isOrthogonal
{
	Vector *v[columns];
	for(NSUInteger c=0; c<columns; c++){
		v[c] = [GenericVector vectorWithDimensions:rows elements:[self column:c].elements];
		if(![v[c] isUnitVector]) return FALSE;
	}
	for(NSUInteger i=0; i<columns-1; i++){
		for(NSUInteger j=i+1; j<columns; j++){
			if(![v[i] isOrthogonalToVector:v[j]]) return FALSE;
		}
	}
	return TRUE;
}

/**
 * Returns true if the determinant of the matrix is not equal to zero.
 */
- (bool)isInvertible
{
	// TODO: An orthogonal matrix Q is necessarily square and invertible... (easier?)
	return [self determinant]!=0;
}

/**
 * Returns true if every element of the matrix is zero.
 */
- (bool)isZero
{
	for(NSUInteger r=0; r<rows; r++){
		for(NSUInteger c=0; c<columns; c++){
			if([self elementAtRow:r column:c]!=0) return FALSE;
		}
	}
	return TRUE;
}

/**
 * Returns true if one or both of the matrix dimensions is zero.
 */
- (bool)isEmpty
{
	return (rows==0 || columns==0);
}


#pragma mark Comparison Functions
/**
 * Returns true if equal to the given matrix.
 */
- (bool)isEqualToMatrix:(Matrix *)matrix
{
	return (self.rows==matrix.rows && self.columns==matrix.columns && memcmp(self.elements, matrix.elements, sizeof(double)*self.rows*self.columns)==0);
}

/**
 * Returns true if equal to the given array of elements.
 */
- (bool)isEqualToElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c
{
	return (self.rows==r && self.columns==c && memcmp(self.elements, e, sizeof(double)*self.rows*self.columns)==0);
}


#pragma mark Accessors
/**
 * Return the given row as a 1-by-columns matrix.
 */
- (Matrix*)row:(NSUInteger)r
{
	Matrix* m = [GenericMatrix matrixWithRows:1 columns:self.columns];
	for(NSUInteger c=0; c<self.columns; c++){
		m.elements[c] = self.elements[c*self.rows+r];
	}
	return m;
}

/**
 * Return the given column as a rows-by-1 matrix.
 */
- (Matrix*)column:(NSUInteger)c;
{
	Matrix* m = [GenericMatrix matrixWithRows:self.rows columns:1];
	for(NSUInteger r=0; r<self.rows; r++){
		m.elements[r] = self.elements[c*self.rows+r];
	}
	return m;
}

/**
 * Return the element at the specified row and column.
 */
- (double)elementAtRow:(NSUInteger)r column:(NSUInteger)c
{
	return self.elements[c*self.rows+r];
}


#pragma mark Utility
- (NSString*)description{
	NSMutableString* str = [NSMutableString new];
	[str appendString:@"Matrix:\n"];
	for(NSUInteger r = 0; r < rows; r++){
		[str appendString:@"   ["];
		for(NSUInteger c = 0; c < columns; c++){
			[str appendFormat:@"% 4.4g", elements[c*rows+r]];
			if(c+1 != columns)
				[str appendString:@","];
		}
		[str appendString:@"]"];
		if(r+1 != rows)
			[str appendString:@"\n"];
	}
	[str appendString:@""];
	[str autorelease];
	return str;
}

- (void)dealloc
{
	if(elements) free(elements);
    [super dealloc];
}

@end
