//
//  Transform.m
//  SpatialMath
//
//  Created by Matt Rubin on 3/31/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Transform.h"


@implementation Transform

#pragma mark Override Matrix Initializers
- (id)initWithRows:(NSUInteger)r columns:(NSUInteger)c {
	[NSException raise:@"Invalid Generator" format:@"A Transform object must have 4 rows and 4 columns."];
	return nil;
}

- (id)initWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c {
	[NSException raise:@"Invalid Generator" format:@"A Transform object must have 4 rows and 4 columns."];
	return nil;
}

- (id)initWithMatrix:(Matrix*)m {
	[NSException raise:@"Invalid Generator" format:@"A Transform object cannot copy a generic matrix."];
	return nil;
}

- (id)initWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)row column:(NSUInteger)column {
	[NSException raise:@"Invalid Generator" format:@"A Transform object must have 4 rows and 4 columns."];
	return nil;
}

- (id)initIdentityMatrixWithSize:(NSUInteger)size {
	[NSException raise:@"Invalid Generator" format:@"A Transform object must have 4 rows and 4 columns."];
	return nil;
}



@end