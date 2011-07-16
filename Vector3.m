//
//  Vector3.m
//  SpatialMath
//
//  Created by Matt Rubin on 4/3/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Vector3.h"


@implementation Vector3

#pragma mark Initializers
- (id)init
{
	if ((self = [super init])) {
		dimensions = 3;
		elements = (double*)calloc(dimensions, sizeof(double));
	}
	return self;
}
- (id)initWithElements:(double*)e
{
	if ((self = [self init])) {
		elements[0] = e[0];
		elements[1] = e[1];
		elements[2] = e[2];
	}
	return self;
}
- (id)initWithVector:(Vector3*)v
{
	if ((self = [self init])) {
		elements[0] = v.elements[0];
		elements[1] = v.elements[1];
		elements[2] = v.elements[2];
	}
	return self;
}
- (id)initWithX:(double)x y:(double)y z:(double)z
{
	if ((self = [self init])) {
		elements[0] = x;
		elements[1] = y;
		elements[2] = z;
	}
	return self;
}

#pragma mark Generators
+ (id)vector
{
	return [[[Vector3 alloc] init] autorelease];
}
+ (id)vectorWithElements:(double*)e
{
	return [[[Vector3 alloc] initWithElements:e] autorelease];
}
+ (id)vectorWithVector:(Vector3*)v
{
	return [[[Vector3 alloc] initWithVector:v] autorelease];
}
+ (id)vectorWithX:(double)x y:(double)y z:(double)z
{
	return [[[Vector3 alloc] initWithX:x y:y z:z] autorelease];
}


#pragma mark Setters and Getters
- (double)x {
	return elements[0];
}

- (double)y {
	return elements[1];
}

- (double)z {
	return elements[2];
}

- (void)setX:(double)x {
	elements[0] = x;
}

- (void)setY:(double)y {
	elements[1] = y;
}

- (void)setZ:(double)z {
	elements[2] = z;
}

@end
