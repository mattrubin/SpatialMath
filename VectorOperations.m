//
//  VectorOperations.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "VectorOperations.h"


@implementation VectorOperations

- (double)dotProduct:(Vector*)vector
{
	NSAssert((self.dimensions != vector.dimensions), @"Cannot compute dot product with vectors of unequal dimensions");
	
	double sum = 0.0;
	for(NSUInteger i=0; i<self.dimensions; i++)
		sum += self.elements[i]*vector.elements[i];
	return sum;
}

@end
