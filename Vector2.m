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
		rows = 2;
		elements = (double*)calloc(rows*columns, sizeof(double));
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

- (void)setX:(double)x {
	elements[0] = x;
}

- (void)setY:(double)y {
	elements[1] = y;
}

@end
