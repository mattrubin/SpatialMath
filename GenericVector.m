//
//  GenericVector.m
//  SpatialMath
//
//  Created by Matt Rubin on 4/3/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "GenericVector.h"


@implementation GenericVector

#pragma mark Initializers
- (id)initWithDimensions:(NSUInteger)d
{
	if((self = [self init])){
		dimensions = d;
		elements = (double*)calloc(dimensions, sizeof(double));
	}
	return self;
}
- (id)initWithDimensions:(NSUInteger)d elements:(double*)e
{
	if((self = [self initWithDimensions:d])){
		for(int i = 0; i < dimensions; i++){
			elements[i] = e[i];
		}
	}
	return self;
}
- (id)initWithVector:(Vector*)v
{
	if((self = [self initWithDimensions:v.dimensions])){
		for(int i = 0; i < dimensions; i++){
			elements[i] = v.elements[i];
		}
	}
	return self;
}
- (id)initWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d
{
	if((self = [self initWithDimensions:v.dimensions-1])){
		NSUInteger index = 0;
		for(int i = 0; i < v.dimensions; i++){
			if(i!=d)
				elements[index++] = v.elements[i];
		}
	}
	return self;
}


#pragma mark Generators
+ (id)vectorWithDimensions:(NSUInteger)d
{
	return [[[GenericVector alloc] initWithDimensions:d] autorelease];
}
+ (id)vectorWithDimensions:(NSUInteger)d elements:(double*)e
{
	return [[[GenericVector alloc] initWithDimensions:d elements:e] autorelease];
}
+ (id)vectorWithVector:(Vector*)v
{
	return [[[GenericVector alloc] initWithVector:v] autorelease];
}
+ (id)vectorWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d
{
	return [[[GenericVector alloc] initWithVector:v byRemovingDimension:d] autorelease];
}

@end
