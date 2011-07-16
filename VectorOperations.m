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

- (Vector*)subtractVector:(Vector*)vector
{
	if(self.dimensions != vector.dimensions) return nil;
	
	Vector* result = [GenericVector vectorWithDimensions:self.dimensions];
	for(NSUInteger d=0; d<self.dimensions; d++){
		result.elements[d] = self.elements[d] - vector.elements[d];
	}
	return result;
}

- (Vector*)multiplyByScalar:(double)scalar
{
	Vector* result = [GenericVector vectorWithDimensions:self.dimensions];
	for(NSUInteger d=0; d<self.dimensions; d++){
		result.elements[d] = self.elements[d]*scalar;
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

- (Vector*)crossProduct:(Vector*)vector
{
	if(self.dimensions != 3) return nil;
	if(self.dimensions != vector.dimensions) return nil;
	Vector* result = [GenericVector vectorWithDimensions:self.dimensions];
	result.elements[0] = self.elements[1]*vector.elements[2]-self.elements[2]*vector.elements[1];
	result.elements[1] = self.elements[2]*vector.elements[0]-self.elements[0]*vector.elements[2];
	result.elements[2] = self.elements[0]*vector.elements[1]-self.elements[1]*vector.elements[0];
	return result;
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
