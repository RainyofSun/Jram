//
//  NSUserDefaults+iCloudSync.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <Foundation/Foundation.h>

//保存到icloud的相关方法
@interface NSUserDefaults (iCloudSync)
-(void)setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;
-(void)setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

-(id)valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;
-(id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

-(BOOL)synchronizeAlsoiCloudSync:(BOOL)sync;
@end
