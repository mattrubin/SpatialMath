//
//  Vector.h
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Matrix.h"

@interface Vector : Matrix {

}
@property (readonly) NSUInteger dimensions;
@property (readonly) double length;

- (id)initWithDimensions:(NSUInteger)d;
- (id)initWithDimensions:(NSUInteger)d elements:(double*)e;
- (id)initWithVector:(Vector*)v;
- (id)initWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d;

+ (id)vectorWithDimensions:(NSUInteger)d;
+ (id)vectorWithDimensions:(NSUInteger)d elements:(double*)e;
+ (id)vectorWithVector:(Vector*)v;
+ (id)vectorWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d;

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
