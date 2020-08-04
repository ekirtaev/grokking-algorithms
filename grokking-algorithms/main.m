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
        NSLog(@"Chapter 4 quick sort index of numeric %@", [chapter quickSortNumericsWithNumerics:@[@2, @4, @6, @11, @100, @239, @1000]]);
        ChapterSevenClass *chapterSeven = [[ChapterSevenClass alloc] init];
        chapterSeven.dijkstraAlgorithm;
        NSDictionary *graph0 = @{@"start" : @{
                                         @"a" : @6,
                                         @"b" : @2},
                                 @"a" : @{@"fin" : @1},
                                 @"b" : @{
                                         @"a" : @3,
                                         @"fin" : @5}
        };
        
        NSDictionary *graph1 = @{@"start" : @{
                                         @"a" : @5,
                                         @"b" : @2},
                                 @"a" : @{
                                         @"d" : @2,
                                         @"c" : @4},
                                 @"b" : @{
                                         @"a" : @8,
                                         @"d" : @7},
                                 @"c" : @{
                                         @"d" : @6,
                                         @"fin": @3},
                                 @"d" : @{@"fin" : @1}
        };
                                
        NSDictionary *graph2 = @{@"start" : @{@"a" : @10},
                                 @"a" : @{@"c" : @20},
                                 @"b" : @{@"a" : @1},
                                 @"c" : @{
                                         @"b" : @1,
                                         @"fin" : @30}
        };

        NSDictionary *graph3 = @{@"start" : @{
                                         @"a" : @2,
                                         @"b" : @2},
                                 @"a" : @{@"b" : @2},
                                 @"b" : @{
                                         @"c" : @2,
                                         @"fin" : @2},
                                 @"c" : @{
                                         @"a" : @-1,
                                         @"fin": @2},
        };
        NSInteger cost = 0;
        NSArray<NSString *> *sequence;
        sequence = [chapterSeven dijkstraAlgorithmForGraphWithGraph:graph0 cost:&cost];
        NSLog(@"Chapter 7 cost is %ld sequence is %@", (long)cost, sequence);
        sequence = [chapterSeven dijkstraAlgorithmForGraphWithGraph:graph1 cost:&cost];
        NSLog(@"Chapter 7.1 cost is %ld sequence is %@", (long)cost, sequence);
        sequence = [chapterSeven dijkstraAlgorithmForGraphWithGraph:graph2 cost:&cost];
        NSLog(@"Chapter 7.2 cost is %ld sequence is %@", (long)cost, sequence);
        sequence = [chapterSeven dijkstraAlgorithmForGraphWithGraph:graph3 cost:&cost];
        NSLog(@"Chapter 7.3 cost is %ld sequence is %@", (long)cost, sequence);
    }
    return 0;
}


