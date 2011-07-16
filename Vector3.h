//
//  Vector3.h
//  SpatialMath
//
//  Created by Matt Rubin on 4/3/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#pragma once
#import "Vector.h"


@interface Vector3 : Vector {}

@property (assign) double x;
@property (assign) double y;
@property (assign) double z;

// Initializers
- (id)initWithElements:(double*)e;
- (id)initWithVector:(Vector3*)v;
- (id)initWithX:(double)x y:(double)y z:(double)z;

// Generators
+ (id)vector;
+ (id)vectorWithElements:(double*)e;
+ (id)vectorWithVector:(Vector3*)v;
+ (id)vectorWithX:(double)x y:(double)y z:(double)z;

@end
