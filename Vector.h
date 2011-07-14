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
@property (readonly) double length;

- (bool)isUnitVector;
- (bool)isOrthogonalToVector:(Vector*)v;
- (bool)isEqualToVector:(Vector *)vector;
- (bool)isEqualToElements:(double*)e dimensions:(NSUInteger)d;

- (double)element:(NSUInteger)d;


@end


@interface Vector (VectorOperations)

- (Vector*)versor;
- (Vector*)opposite;


- (Vector*)addVector:(Vector*)vector;
- (double)dotProduct:(Vector*)vector;

@end
