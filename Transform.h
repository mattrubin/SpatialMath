//
//  Transform.h
//  SpatialMath
//
//  Created by Matt Rubin on 3/31/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#pragma once
#import "Matrix.h"


@interface Transform : Matrix {}

// Initializers
- (id)initZeroTransform;
- (id)initWithElements:(double*)elementArray;
- (id)initWithTransform:(Transform*)transform;

// Generators
+ (id)zeroTransform;
+ (id)transformWithElements:(double*)elementArray;
+ (id)transformWithTransform:(Transform*)transform;

@end
