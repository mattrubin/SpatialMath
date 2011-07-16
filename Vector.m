//
//  Vector.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/27/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Vector.h"

@implementation Vector

#pragma mark Properties
@synthesize elements, dimensions;

- (double)length
{
	double sum = 0.0;
	for(NSUInteger i=0; i<self.dimensions; i++)
		sum += elements[i]*elements[i];
	return sqrt(sum);
}


#pragma mark Initializers
- (id)init
{
	if ((self = [super init])) {
		dimensions = 0;
		elements = NULL;
	}
	return self;
}


#pragma mark Boolean Properties
- (BOOL)isUnitVector
{
	return self.length==1;
}
- (BOOL)isZeroVector
{
	for(NSUInteger i=0; i<dimensions; i++){
		if([self element:i]!=0.0) return FALSE;
	}
	return TRUE;
}

#pragma mark Comparison Functions
- (BOOL)isOrthogonalToVector:(Vector*)v
{
	return [self dotProduct:v]==0;
}
- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToVector:other];
}
- (BOOL)isEqualToVector:(Vector *)vector
{
	return (self.dimensions==vector.dimensions && memcmp(self.elements, vector.elements, sizeof(double)*self.dimensions)==0);
}
- (BOOL)isEqualToElements:(double*)e dimensions:(NSUInteger)d
{
	return (self.dimensions==d && memcmp(self.elements, e, sizeof(double)*self.dimensions)==0);
}


#pragma mark Accessors
- (double)element:(NSUInteger)d
{
	return self.elements[d];
}

#pragma mark Utility
- (NSString*)description{
	NSMutableString* str = [NSMutableString new];
	[str appendString:@"Vector:\n"];
	[str appendString:@"   ["];
	for(NSUInteger d = 0; d < dimensions; d++){
		[str appendFormat:@"% 4.4g", elements[d]];
		if(d+1 != dimensions)
			[str appendString:@","];
	}
	[str appendString:@"]"];
	[str autorelease];
	return str;
}

- (void)dealloc
{
	if(elements) free(elements);
    [super dealloc];
}



@end
