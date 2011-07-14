//
//  Test_Vector2.m
//  SpatialMath
//
//  Created by Matt Rubin on 7/14/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_Vector2.h"


@implementation Test_Vector2

- (void)test_init
{
	NSUInteger DIM = 2;
	Vector2 *v = [[Vector2 alloc] init];
	
    STAssertEquals(v.dimensions, DIM, @"Wrong number of dimensions");
	for(int i = 0; i < DIM; i++){
		STAssertEquals(v.elements[i], 0.0, @"Elements must initialize to zero (Failed for element %i)", i);
	}
	
	[v release];
}
- (void)test_initWithElements
{
	NSUInteger DIM = 2;
	double buffer[DIM];
	LOOP(DIM, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Vector2 *v = [[Vector2 alloc] initWithElements:buffer];
	
    STAssertEquals(v.dimensions, DIM, @"Wrong number of dimensions");
	for(int i = 0; i < DIM; i++){
		STAssertEquals(v.elements[i], buffer[i], @"Elements must initialize to buffered elements (Failed for element %i)", i);
	}
	
	[v release];
}
- (void)test_initWithVector
{
	NSUInteger DIM = 2;
	double buffer[DIM];
	LOOP(DIM, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Vector2 *v1 = [[Vector2 alloc] initWithElements:buffer];
	Vector2 *v2 = [[Vector2 alloc] initWithVector:v1];
	
    STAssertEquals(v2.dimensions, DIM, @"Wrong number of dimensions");
	for(int i = 0; i < DIM; i++){
		STAssertEquals(v2.elements[i], buffer[i], @"Elements must initialize to buffered elements (Failed for element %i)", i);
	}
	
	[v1 release];
	[v2 release];
}


- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

@end
