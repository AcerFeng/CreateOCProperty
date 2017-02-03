//
//  NSObject+Property.m
//  CreateProperty
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];
    
    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
//                NSLog(@"%@ %@",propertyName,[value class]);
        NSString *code;
        
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")] || [value isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")] || [value isKindOfClass:NSClassFromString(@"__NSArrayM")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [value isKindOfClass:NSClassFromString(@"__NSDictionaryM")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        [strM appendFormat:@"\n%@\n",code];
        
        
        
    }];
    
    NSLog(@"%@",strM);
    
    
    
}
@end
