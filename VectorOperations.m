//
//  VectorOperations.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Vector.h"
#import "GenericVector.h"


@implementation Vector (VectorOperations)


- (Vector*)addVector:(Vector*)vector
{
	if(self.dimensions != vector.dimensions) return nil;
	
	Vector* result = [GenericVector vectorWithDimensions:self.dimensions];
	for(NSUInteger d=0; d<self.dimensions; d++){
		result.elements[d] = self.elements[d] + vector.elements[d];
	}
	return result;
}

- (double)dotProduct:(Vector*)vector
{
	NSAssert((self.dimensions != vector.dimensions), @"Cannot compute dot product with vectors of unequal dimensions");
	
	double sum = 0.0;
	for(NSUInteger i=0; i<self.dimensions; i++)
		sum += self.elements[i]*vector.elements[i];
	return sum;
}

- (Vector*)opposite
{
	Vector* result = [GenericVector vectorWithDimensions:self.dimensions];
	for(NSUInteger d=0; d<self.dimensions; d++){
		result.elements[d] = -self.elements[d];
	}
	return result;
}
- (Vector*)versor
{
	double l = self.length;
	Vector *vector = [GenericVector vectorWithVector:self];
	for(NSUInteger i=0; i<vector.dimensions; i++)
		vector.elements[i] /= l;
	return vector;
}


@end
