//
//  Vector.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Vector.h"


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
- (id)initWithDimensions:(NSUInteger)d
{
	return [self initWithRows:d columns:1];
}
- (id)initWithDimensions:(NSUInteger)d elements:(double*)e
{
	return [self initWithElements:e rows:d columns:1];
}
- (id)initWithVector:(Vector*)v
{
	return [self initWithMatrix:v];
}
- (id)initWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d
{
	return [self initWithMatrix:v byRemovingRow:d column:-1];
}


#pragma mark Generators
+ (id)vectorWithDimensions:(NSUInteger)d
{
	return [[[Vector alloc] initWithDimensions:d] autorelease];
}
+ (id)vectorWithDimensions:(NSUInteger)d elements:(double*)e
{
	return [[[Vector alloc] initWithDimensions:d elements:e] autorelease];
}
+ (id)vectorWithVector:(Vector*)v
{
	return [[[Vector alloc] initWithVector:v] autorelease];
}
+ (id)vectorWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d
{
	return [[[Vector alloc] initWithVector:v byRemovingDimension:d] autorelease];
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

- (double)element:(NSUInteger)d
{
	return [self elementAtRow:d column:1];
}


@end
