//
//  Vector4.h
//  SpatialMath
//
//  Created by Matt Rubin on 7/6/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#pragma once
#import "Vector.h"


@interface Vector4 : Vector

@property (assign) double x;
@property (assign) double y;
@property (assign) double z;
@property (assign) double w;

// Initializers
- (id)initWithElements:(double*)e;
- (id)initWithVector:(Vector4*)v;

// Generators
+ (id)vector;
+ (id)vectorWithElements:(double*)e;
+ (id)vectorWithVector:(Vector4*)v;

@end
