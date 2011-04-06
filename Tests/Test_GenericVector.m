//
//  Test_GenericVector.m
//  SpatialMath
//
//  Created by Matt Rubin on 4/5/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_GenericVector.h"


@implementation Test_GenericVector

- (void)test_initWithDimensions {
	LOOP(10, [self initWithDimensions]);
}
- (void)test_initWithDimensions_elements {
	LOOP(10, [self initWithDimensions_elements]);
}
- (void)test_initWithVector {
	LOOP(10, [self initWithVector]);
}
- (void)test_initWithVector_byRemovingDimension {
	LOOP(10, [self initWithVector_byRemovingDimension]);
}

- (void)initWithDimensions {
	NSUInteger dimensions = arc4random()%100 + 1;
	Vector *v = [[GenericVector alloc] initWithDimensions:dimensions];
	
    STAssertEquals(v.dimensions, dimensions, @"Wrong number of dimensions");
	for(int i = 0; i < dimensions; i++){
		STAssertEquals(v.elements[i], 0.0, @"Elements must initialize to zero (Failed for element %i)", i);
	}
	
	[v release];
}
- (void)initWithDimensions_elements {
	NSUInteger dimensions = arc4random()%20 + 1;
	double buffer[dimensions];
	LOOP(dimensions, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Vector *v = [[GenericVector alloc] initWithDimensions:dimensions elements:buffer];
	
    STAssertEquals(v.dimensions, dimensions, @"Wrong number of dimensions");
	for(int i = 0; i < dimensions; i++){
		STAssertEquals(v.elements[i], buffer[i], @"Elements must initialize to buffered elements (Failed for element %i)", i);
	}
	
	[v release];
}
- (void)initWithVector {
	NSUInteger dimensions = arc4random()%20 + 1;
	double buffer[dimensions];
	LOOP(dimensions, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Vector *v1 = [[GenericVector alloc] initWithDimensions:dimensions elements:buffer];
	Vector *v2 = [[GenericVector alloc] initWithVector:v1];
	
    STAssertEquals(v2.dimensions, dimensions, @"Wrong number of dimensions");
	for(int i = 0; i < dimensions; i++){
		STAssertEquals(v2.elements[i], buffer[i], @"Elements must initialize to buffered elements (Failed for element %i)", i);
	}
	
	[v1 release];
	[v2 release];
}
- (void)initWithVector_byRemovingDimension {
	NSUInteger dimensions = arc4random()%20 + 1;
	double buffer[dimensions];
	LOOP(dimensions, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Vector *v1 = [[GenericVector alloc] initWithDimensions:dimensions elements:buffer];
	
	NSUInteger dimensionToRemove = arc4random()%dimensions;
	Vector *v2 = [[GenericVector alloc] initWithVector:v1 byRemovingDimension:dimensionToRemove];
	
    STAssertEquals(v2.dimensions, dimensions-1, @"Wrong number of dimensions");
	for(int i = 0; i < dimensions-1; i++){
		int j = i;
		if (i>=dimensionToRemove) j++;
		STAssertEquals(v2.elements[i], v1.elements[j], @"Elements must initialize to buffered elements (Failed for element %i)", i);
	}
	
	[v1 release];
	[v2 release];
}

@end
