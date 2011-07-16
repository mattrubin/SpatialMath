//
//  Vector.h
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#pragma once
#import <Cocoa/Cocoa.h>


@interface Vector : NSObject {
	NSUInteger dimensions;
	double* elements;
}

@property (readonly) double* elements;
@property (readonly) NSUInteger dimensions;
@property (readonly) double length; // magnitude? norm?

- (BOOL)isUnitVector;
- (BOOL)isZeroVector; //isNullVector?

- (BOOL)isOrthogonalToVector:(Vector*)v;
- (BOOL)isEqualToVector:(Vector *)vector;
- (BOOL)isEqualToElements:(double*)e dimensions:(NSUInteger)d;

- (double)element:(NSUInteger)d;


@end


@interface Vector (VectorOperations)

- (Vector*)unitVector; // versor? normalize?
- (Vector*)opposite;

- (Vector*)addVector:(Vector*)vector;
- (Vector*)subtractVector:(Vector*)vector;
- (Vector*)multiplyByScalar:(double)scalar;

- (double)dotProduct:(Vector*)vector; //innerProduct? scalarProduct?
- (Vector*)crossProduct:(Vector*)vector; //currently only supports 3d vectors. future support for 7d vectors?

@end
