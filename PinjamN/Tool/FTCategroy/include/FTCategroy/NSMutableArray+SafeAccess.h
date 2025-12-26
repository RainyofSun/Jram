//
//  NSMutableArray+SafeAccess.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableArray (SafeAccess)
#pragma mark - ** GeneralMethods **

- (void)moveObjectToTopAtIndex:(NSUInteger)index;
- (void)moveObjectFromIndex:(NSUInteger)oldIndex toIndex:(NSUInteger)newIndex;
- (void)removeFirstObject;
- (nullable id)pop;

#pragma mark - ** Safe **

- (void)safe_addObject: (nullable id)object;
- (void)safe_insertObject:(nullable id)object atIndex:(NSUInteger)index;

- (void)hm_removeObjectWithIndex:(NSUInteger)index;

- (void)hm_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

-(void)hm_addObj:(id)i;

-(void)hm_addString:(NSString*)i;

-(void)hm_addBool:(BOOL)i;

-(void)hm_addInt:(int)i;

-(void)hm_addInteger:(NSInteger)i;

-(void)hm_addUnsignedInteger:(NSUInteger)i;

-(void)hm_addCGFloat:(CGFloat)f;

-(void)hm_addChar:(char)c;

-(void)hm_addFloat:(float)i;

-(void)hm_addPoint:(CGPoint)o;

-(void)hm_addSize:(CGSize)o;

-(void)hm_addRect:(CGRect)o;

@end
