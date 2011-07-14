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
		dimensions = 3;
		elements = (double*)calloc(dimensions, sizeof(double));
	}
	return self;
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
