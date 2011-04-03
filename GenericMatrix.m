//
//  GenericMatrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 4/2/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "GenericMatrix.h"


@implementation GenericMatrix

#pragma mark Initializers
/**
 * Initialize a zero matrix with the given number of rows and columns.
 */
- (id)initWithRows:(NSUInteger)r columns:(NSUInteger)c
{
	if(r==0 || c==0){
		[self release];
		return nil;
	}
	if((self = [super init])){
		rows = r;
		columns = c;
		elements = (double*)calloc(1, sizeof(double)*rows*columns);
	}
	return self;
}

/**
 * Initialize a matrix from the given array of elements, arranged in the given number of rows and columns.
 */
- (id)initWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c
{
	if((self = [self initWithRows:r columns:c])){
		for(int i = 0; i < r*c; i++){
			elements[i] = e[i];
		}
	}
	return self;
}

/**
 * Initialize a matrix by copying the given matrix.
 */
- (id)initWithMatrix:(Matrix*)m
{
	return [self initWithElements:m.elements rows:m.rows columns:m.columns];
}

/**
 * Initialize a matrix by copying the give matrix and removing the specified row and column.
 */
- (id)initWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)row column:(NSUInteger)column
{
	NSLog(@"Removing row %i and column %i from %@", row, column, m);
	if(m.rows<2 || m.columns<2 || row<0 || row>=m.rows || column<0 || column>=m.columns){
		[self release];
		return nil;
	}
	if((self = [super init])){
		rows = m.rows-1;
		columns = m.columns-1;
		elements = malloc(sizeof(double)*rows*columns);
		NSUInteger index = 0;
		for(NSUInteger c=0; c<m.columns; c++){
			for(NSUInteger r=0; r<m.rows; r++){
				if(r!=row && c!=column)
					elements[index++] = m.elements[c*m.rows + r];
			}
		}
	}
	return self;
}

/**
 * Initialize an identity matrix of the specified size.
 */
- (id)initIdentityMatrixWithSize:(NSUInteger)size
{
	if(self = [self initWithRows:size columns:size]){
		for(NSUInteger i=0; i<size; i++){
			elements[i*size + i] = 1;
		}
	}
	return self;
}


#pragma mark Generators
+ (id)matrixWithRows:(NSUInteger)r columns:(NSUInteger)c {
	return [[[[self class] alloc] initWithRows:r columns:c] autorelease];
}

+ (id)matrixWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c {
	return [[[[self class] alloc] initWithElements:e rows:r columns:c] autorelease];
}

+ (id)matrixWithMatrix:(Matrix*)m {
	return [[[[self class] alloc] initWithMatrix:m] autorelease];
}

+ (id)matrixWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)r column:(NSUInteger)c {
	return [[[[self class] alloc] initWithMatrix:m byRemovingRow:r column:c] autorelease];
}

+ (id)identityMatrixWithSize:(NSUInteger)size {
	return [[[[self class] alloc] initIdentityMatrixWithSize:size] autorelease];
}

@end
