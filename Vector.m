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
	double sum = 0.0;
	for(NSUInteger r=0; r<rows; r++)
		sum += elements[r]*elements[r];
	return sqrt(sum)==1;
}


#pragma mark Comparison Functions
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
