//
//  Vector.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Vector.h"
#import "GenericVector.h"

@implementation Vector

#pragma mark Properties
- (NSUInteger)dimensions
{
	return self.rows;
}
- (double)length
{
	double sum = 0.0;
	for(NSUInteger i=0; i<self.dimensions; i++)
		sum += elements[i]*elements[i];
	return sqrt(sum);
}


#pragma mark Initializers
- (id)init
{
	if ((self = [super init])) {
		columns = 1;
	}
	return self;
}


#pragma mark Boolean Properties
- (bool)isUnitVector
{
	return self.length==1;
}


#pragma mark Comparison Functions
- (bool)isOrthogonalToVector:(Vector*)v
{
	return [self dotProduct:v]==0;
}
- (bool)isEqualToVector:(Vector *)vector
{
	return [self isEqualToMatrix:vector];
}
- (bool)isEqualToElements:(double*)e dimensions:(NSUInteger)d
{
	return [self isEqualToElements:e rows:d columns:1];
}


#pragma mark Accessors
- (double)element:(NSUInteger)d
{
	return [self elementAtRow:d column:1];
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
