//
//  Vector.h
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#pragma once
#import "Matrix.h"


@interface Vector : Matrix {}

@property (readonly) NSUInteger dimensions;
@property (readonly) double length;

- (bool)isUnitVector;
- (bool)isOrthogonalToVector:(Vector*)v;
- (bool)isEqualToVector:(Vector *)vector;
- (bool)isEqualToElements:(double*)e dimensions:(NSUInteger)d;

- (double)element:(NSUInteger)d;

- (Vector*)versor;

@end


@interface Vector (VectorOperations)

- (double)dotProduct:(Vector*)vector;

@end
