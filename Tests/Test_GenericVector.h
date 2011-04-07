//
//  Test_GenericVector.h
//  SpatialMath
//
//  Created by Matt Rubin on 4/5/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "TestBundle.h"

@interface Test_GenericVector : SenTestCase {}

// Initializers
- (void)initWithDimensions;
- (void)initWithDimensions_elements;
- (void)initWithVector;
- (void)initWithVector_byRemovingDimension;

// Generators
- (void)vectorWithDimensions;
- (void)vectorWithDimensions_elements;
- (void)vectorWithVector;
- (void)vectorWithVector_byRemovingDimension;

@end
