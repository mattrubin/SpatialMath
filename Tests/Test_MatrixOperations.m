//
//  Test_MatrixOperations.m
//  SpatialMath
//
//  Created by Matt Rubin on 2/27/11.
//  Copyright 2011 Matt Rubin. All rights reserved.
//

#import "Test_MatrixOperations.h"


@implementation Test_MatrixOperations

- (void)test_determinant {
	[self determinant_2x2];
	[self determinant_3x3];
}

- (void)determinant_2x2 {
	NSUInteger rows = 2;
	NSUInteger columns = 2;
	double buffer[rows*columns];
	LOOP(rows*columns, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Matrix *m = [[GenericMatrix alloc] initWithElements:buffer rows:rows columns:columns];
	
	double det = [m determinant];
	double det2 = [[m transpose] determinant];
	double control = m.elements[0]*m.elements[3]-m.elements[2]*m.elements[1];
	STAssertEquals(control, det, @"Determinant of 2x2 matrix");
	STAssertEquals(det, det2, @"Determinant should equal the determinant of the transpose (2x2 matrix)");
	
	[m release];
}

- (void)determinant_3x3 {
	NSUInteger rows = 3;
	NSUInteger columns = 3;
	double buffer[rows*columns];
	LOOP(rows*columns, buffer[i]=(arc4random()%1000 + 1)/(arc4random()%100 + 1));
	Matrix *m = [[GenericMatrix alloc] initWithElements:buffer rows:rows columns:columns];
	
	double det = [m determinant];
	double det2 = [[m transpose] determinant];
	double control = m.elements[0]*m.elements[4]*m.elements[8] + m.elements[3]*m.elements[7]*m.elements[2] + m.elements[6]*m.elements[1]*m.elements[5]
					-m.elements[0]*m.elements[7]*m.elements[5] - m.elements[3]*m.elements[1]*m.elements[8] - m.elements[6]*m.elements[4]*m.elements[2];
	STAssertEquals(control, det, @"Determinant of 3x3 matrix");
	STAssertEquals(det, det2, @"Determinant should equal the determinant of the transpose (3x3 matrix)");
	
	[m release];
}


@end
