//
//  GenericVector.h
//  SpatialMath
//
//  Created by Matt Rubin on 4/3/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#pragma once
#import "Vector.h"


@interface GenericVector : Vector {}

// Initializers
- (id)initWithDimensions:(NSUInteger)d;
- (id)initWithDimensions:(NSUInteger)d elements:(double*)e;
- (id)initWithVector:(Vector*)v;
- (id)initWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d;

// Generators
+ (id)vectorWithDimensions:(NSUInteger)d;
+ (id)vectorWithDimensions:(NSUInteger)d elements:(double*)e;
+ (id)vectorWithVector:(Vector*)v;
+ (id)vectorWithVector:(Vector*)v byRemovingDimension:(NSUInteger)d;

@end
