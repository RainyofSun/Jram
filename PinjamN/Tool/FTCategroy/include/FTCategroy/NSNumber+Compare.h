//
//  NSNumber+Compare.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Compare)
- (BOOL)safe_isEqualToNumber: (nullable NSNumber *)otherNumber;
- (NSComparisonResult)safe_compare:(nullable NSNumber *)otherNumber;
@end
