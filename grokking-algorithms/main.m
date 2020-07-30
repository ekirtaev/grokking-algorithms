//
//  main.m
//  grokking-algorithms
//
//  Created by Евгений Киртаев on 29.07.2020.
//  Copyright © 2020 Евгений Киртаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "grokking-algorithms-Swift.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ChapterFourClass *chapter = [[ChapterFourClass alloc] init];
        CGSize canvas = CGSizeMake(1680, 640);
        CGSize result = [chapter minSquareSizeInCanvasWithCanvas:canvas];
        NSLog(@"Chapter 4 min square %@", NSStringFromSize(NSSizeFromCGSize(result)));
        NSLog(@"Chapter 4.1 sum is %ld", (long)[chapter sumWithNumerics:@[@2, @4, @6]]);
        NSLog(@"Chapter 4.2 count is %ld", (long)[chapter countWithArray:@[@2, @4, @6]]);
        NSLog(@"Chapter 4.3 max is %ld", (long)[chapter maxNumericInNumerics:@[@2, @4, @1000, @6, @11, @100, @239, @5]]);
        NSLog(@"Chapter 4.4 binary searched %ld index of numeric %@", (long)[chapter binarySearchIndexForNumericWithNumeric:6 inArray:@[@2, @4, @6, @11, @100, @239, @1000]], @6);
    }
    return 0;
}


