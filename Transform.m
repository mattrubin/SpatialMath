//
//  Transform.m
//  SpatialMath
//
//  Created by Matt Rubin on 3/31/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Transform.h"


@implementation Transform


#pragma mark Initializers
/**
 * Initialize an identity transform.
 */
- (id)init
{
	if((self = [self initZeroTransform])){
		for(NSUInteger i=0; i<rows; i++){
			elements[i*rows + i] = 1;
		}
	}
	return self;
}

/**
 * Initialize a zero-matrix transform.
 */
- (id)initZeroTransform
{
	if((self = [super init])){
		rows = 4;
		columns = 4;
		elements = (double*)calloc(rows*columns, sizeof(double));
	}
	return self;
}

/**
 * Initialize a transform from the given array of elements.
 */
- (id)initWithElements:(double*)elementArray
{
	if((self = [self initZeroTransform])){
		for(int i = 0; i < rows*columns; i++){
			elements[i] = elementArray[i];
		}
	}
	return self;
}

/**
 * Initialize a transform by copying the given transform.
 */
- (id)initWithTransform:(Transform*)transform
{
	if((self = [self initZeroTransform])){
		for(int i = 0; i < rows*columns; i++){
			elements[i] = transform.elements[i];
		}
	}
	return self;
}


#pragma mark Generators
+ (id)zeroTransform
{
	return [[[Transform alloc] initZeroTransform] autorelease];
}

+ (id)transformWithElements:(double*)elementArray
{
	return [[[Transform alloc] initWithElements:elementArray] autorelease];
}

+ (id)transformWithTransform:(Transform*)transform
{
	// The cast to a Transform* is simply to avoid a silly compilation warning
	// where the compiler expects initWithTransform: to take an NSAffineTransform*
	return [[(Transform*)[Transform alloc] initWithTransform:transform] autorelease];
}

@end
