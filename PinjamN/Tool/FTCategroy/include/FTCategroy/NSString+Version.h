//
//  NSString.h
//  Moments
//
//  Created by Kevin on 10/16/16.
//  Copyright © 2016 jiangzhichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VersionCompare)

- (NSComparisonResult)compareWithVersion:(NSString *)v;

@end
