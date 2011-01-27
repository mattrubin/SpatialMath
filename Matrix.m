//
//  Matrix.m
//  SpatialMath
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "Matrix.h"


@implementation Matrix

#pragma mark Properties
@synthesize elements, rows, columns;


#pragma mark Initializers
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

- (id)initWithMatrix:(Matrix*)m byRemovingRow:(NSUInteger)row column:(NSUInteger)column
{
	if(m.rows<2 || m.columns<2 || row<-1 || row>=m.rows || column<-1 || column>=m.columns){
		[self release];
		return nil;
	}
	if((self = [super init])){
		rows = m.rows-1;
		columns = m.columns-1;
		elements = malloc(sizeof(double)*rows*columns);
		NSUInteger index = 0;
		for(NSUInteger c=0; c<m.columns; c++){
			for(NSUInteger r=0; r<m.rows; r++){
				if(r!=row && c!=column)
					elements[index++] = m.elements[c*m.rows + r];
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


#pragma mark Generators
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


#pragma mark Boolean Properties
- (bool)isSquare
{
	return rows==columns;
}

- (bool)isDiagonal
{
	if(rows!=columns) return FALSE;
	
	for(NSUInteger r=1; r<rows; r++){
		for(NSUInteger c=0; c<r; c++){
			if(elements[r*columns+c]!=0 || elements[c*columns+r]!=0) return FALSE;
		}
	}
	return TRUE;
}

- (bool)isSymmetric
{
	if(rows!=columns) return FALSE;
	
	for(NSUInteger r=1; r<rows; r++){
		for(NSUInteger c=0; c<r; c++){
			if(elements[r*columns+c]!=elements[c*columns+r]) return FALSE;
		}
	}
	return TRUE;
}

- (bool)isOrthogonal
{
	Vector *v[columns];
	for(NSUInteger c=0; c<columns; c++){
		v[c] = [Vector vectorWithDimensions:rows elements:[self column:c].elements];
		if(![v[c] isUnitVector]) return FALSE;
	}
	for(NSUInteger i=0; i<columns-1; i++){
		for(NSUInteger j=i+1; j<columns; j++){
			if(![v[i] isOrthogonalToVector:v[j]]) return FALSE;
		}
	}
	return TRUE;
}


#pragma mark Comparison Functions
- (bool)isEqualToMatrix:(Matrix *)matrix
{
	return (self.rows==matrix.rows && self.columns==matrix.columns && memcmp(self.elements, matrix.elements, sizeof(double)*self.rows*self.columns)==0);
}

- (bool)isEqualToElements:(double*)e rows:(NSUInteger)r columns:(NSUInteger)c
{
	return (self.rows==r && self.columns==c && memcmp(self.elements, e, sizeof(double)*self.rows*self.columns)==0);
}


#pragma mark Accessors
- (Matrix*)row:(NSUInteger)r
{
	Matrix* m = [Matrix matrixWithRows:1 columns:self.columns];
	for(NSUInteger c=0; c<self.columns; c++){
		m.elements[c] = self.elements[c*self.rows+r];
	}
	return m;
}

- (Matrix*)column:(NSUInteger)c;
{
	Matrix* m = [Matrix matrixWithRows:self.rows columns:1];
	for(NSUInteger r=0; r<self.rows; r++){
		m.elements[r] = self.elements[c*self.rows+r];
	}
	return m;
}

- (double)elementAtRow:(NSUInteger)r column:(NSUInteger)c
{
	return self.elements[c*self.rows+r];
}


#pragma mark Utility
- (NSString*)description{
	NSMutableString* str = [NSMutableString new];
	[str appendString:@"Matrix:\n"];
	for(NSUInteger r = 0; r < rows; r++){
		[str appendString:@"["];
		for(NSUInteger c = 0; c < columns; c++){
			[str appendFormat:@"%g", elements[c*rows+r]];
			if(c+1 != columns)
				[str appendString:@","];
		}
		[str appendString:@"]"];
		if(r+1 != rows)
			[str appendString:@"\n"];
	}
	[str appendString:@""];
	[str autorelease];
	return str;
}

@end
