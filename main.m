//
//  main.m
//  Test
//
//  Created by Matt Rubin on 1/22/11.
//  Copyright 2011. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpatialMath/SpatialMath.h>

int main(int argc, char *argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSLog(@"Testing SpatialMath Framework...");
	
	NSLog(@"Test Complete.");
	
	[pool drain];
	exit (EXIT_SUCCESS);
}
