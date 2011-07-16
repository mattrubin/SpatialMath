//
//  Vector4.m
//  SpatialMath
//
//  Created by Matt Rubin on 7/6/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Vector4.h"


@implementation Vector4

#pragma mark Initializers
- (id)init
{
	if ((self = [super init])) {
		dimensions = 4;
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
		elements[3] = e[3];
	}
	return self;
}
- (id)initWithVector:(Vector4*)v
{
	if ((self = [self init])) {
		elements[0] = v.elements[0];
		elements[1] = v.elements[1];
		elements[2] = v.elements[2];
		elements[3] = v.elements[3];
	}
	return self;
}
- (id)initWithX:(double)x y:(double)y z:(double)z w:(double)w
{
	if ((self = [self init])) {
		elements[0] = x;
		elements[1] = y;
		elements[2] = w;
		elements[3] = y;
	}
	return self;
}

#pragma mark Generators
+ (id)vector
{
	return [[[Vector4 alloc] init] autorelease];
}
+ (id)vectorWithElements:(double*)e
{
	return [[[Vector4 alloc] initWithElements:e] autorelease];
}
+ (id)vectorWithVector:(Vector4*)v
{
	return [[[Vector4 alloc] initWithVector:v] autorelease];
}
+ (id)vectorWithX:(double)x y:(double)y z:(double)z w:(double)w
{
	return [[[Vector4 alloc] initWithX:x y:y z:z w:w] autorelease];
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

- (double)w {
	return elements[3];
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

- (void)setW:(double)w {
	elements[3] = w;
}

@end
