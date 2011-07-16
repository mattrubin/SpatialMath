//
//  Vector2.h
//  SpatialMath
//
//  Created by Matt Rubin on 4/3/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#pragma once
#import "Vector.h"


@interface Vector2 : Vector {}

@property (assign) double x;
@property (assign) double y;

// Initializers
- (id)initWithElements:(double*)e;
- (id)initWithVector:(Vector2*)v;
- (id)initWithX:(double)x y:(double)y;

// Generators
+ (id)vector;
+ (id)vectorWithElements:(double*)e;
+ (id)vectorWithVector:(Vector2*)v;
+ (id)vectorWithX:(double)x y:(double)y;

@end
