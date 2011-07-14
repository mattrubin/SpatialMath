//
//  Vector2.m
//  SpatialMath
//
//  Created by Matt Rubin on 4/3/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Vector2.h"


@implementation Vector2

#pragma mark Initializers
- (id)init
{
	if ((self = [super init])) {
		dimensions = 2;
		elements = (double*)calloc(dimensions, sizeof(double));
	}
	return self;
}
- (id)initWithElements:(double*)e
{
	if ((self = [self init])) {
		elements[0] = e[0];
		elements[1] = e[1];
	}
	return self;
}
- (id)initWithVector:(Vector2*)v
{
	if ((self = [self init])) {
		elements[0] = v.elements[0];
		elements[1] = v.elements[1];
	}
	return self;
}

#pragma mark Generators
+ (id)vector
{
	return [[[Vector2 alloc] init] autorelease];
}
+ (id)vectorWithElements:(double*)e
{
	return [[[Vector2 alloc] initWithElements:e] autorelease];
}
+ (id)vectorWithVector:(Vector2*)v
{
	return [[[Vector2 alloc] initWithVector:v] autorelease];
}


#pragma mark Setters and Getters
- (double)x {
	return elements[0];
}

- (double)y {
	return elements[1];
}

- (void)setX:(double)x {
	elements[0] = x;
}

- (void)setY:(double)y {
	elements[1] = y;
}

@end
