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
@synthesize elements, dimensions;

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
		dimensions = 0;
		elements = NULL;
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
	return (self.dimensions==vector.dimensions && memcmp(self.elements, vector.elements, sizeof(double)*self.dimensions)==0);
}
- (bool)isEqualToElements:(double*)e dimensions:(NSUInteger)d
{
	return (self.dimensions==d && memcmp(self.elements, e, sizeof(double)*self.dimensions)==0);
}


#pragma mark Accessors
- (double)element:(NSUInteger)d
{
	return self.elements[d];
}


@end
