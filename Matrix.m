//
//  Matrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Matrix.h"


@implementation Matrix

@synthesize elements, rows, columns;

- (id)initWithRows:(NSUInteger)r columns:(NSUInteger)c
{
	if(r==0 || c==0){
		[self release];
		return nil;
	}
	if((self = [super init])){
		rows = r;
		columns = c;
		elements = (double*)calloc(1, sizeof(double)*rows*columns);
	}
	return self;
}

- (id)initWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c
{
	if((self = [self initWithRows:r columns:c])){
		for(int i = 0; i < r*c; i++){
			elements[i] = e[i];
		}
	}
	return self;
}

- (id)initWithMatrix:(Matrix*)m
{
	return [self initWithElements:m.elements rows:m.rows columns:m.columns];
}

- (id)initWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)r column:(NSUInteger)c
{
	if(m.rows<2 || m.columns<2 || r<0 || r>=m.rows || c<0 || c>=m.columns){
		[self release];
		return nil;
	}
	if((self = [super init])){
		rows = m.rows-1;
		columns = m.columns-1;
		elements = malloc(sizeof(double)*rows*columns);
		NSUInteger index = 0;
		for(NSUInteger i=0; i<m.rows; i++){
			for(NSUInteger j=0; j<m.columns; j++){
				if(i!=r && j!=c)
					elements[index++] = m.elements[i*m.columns + j];
			}
		}
	}
	return self;
}

- (id)initIdentityMatrixWithSize:(NSUInteger)size
{
	if(self = [self initWithRows:size columns:size]){
		for(NSUInteger i=0; i<size; i++){
			elements[i*size + i] = 1;
		}
	}
	return self;
}


/*
- (id)initWithMatrix:(Matrix*)m
{
	if((self = [super init])){
		rows = m.rows;
		columns = m.columns;
		elements = malloc(sizeof(double)*rows*columns);
		memcpy(elements, m.elements, sizeof(double)*rows*columns);
	}
	return self;
}*/

- (NSString*)description{
	NSMutableString* str = [NSMutableString new];
	[str appendString:@"{"];
	for(NSUInteger i = 0; i < rows; i++){
		[str appendString:@"{"];
		for(NSUInteger j = 0; j < columns; j++){
			[str appendFormat:@"%g", elements[i*columns+j]];
			if(j+1 != columns)
				[str appendString:@","];
		}
		[str appendString:@"}"];
		if(i+1 != rows)
			[str appendString:@",\n"];
	}
	[str appendString:@"}"];
	[str autorelease];
	return str;
}

+ (id)matrixWithRows:(NSUInteger)r columns:(NSUInteger)c {
	return [[[Matrix alloc] initWithRows:r columns:c] autorelease];
}

+ (id)matrixWithElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c {
	return [[[Matrix alloc] initWithElements:e rows:r columns:c] autorelease];
}

+ (id)matrixWithMatrix:(Matrix*)m {
	return [[[Matrix alloc] initWithMatrix:m] autorelease];
}

+ (id)matrixWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)r column:(NSUInteger)c {
	return [[[Matrix alloc] initWithMatrix:m byRemovingRow:r column:c] autorelease];
}

+ (id)identityMatrixWithSize:(NSUInteger)size {
	return [[[Matrix alloc] initIdentityMatrixWithSize:size] autorelease];
}


@end
