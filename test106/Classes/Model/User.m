//
//  User.m
//  test106
//
//  Created by qiaofang on 2021/10/25.
//

#import "User.h"

@implementation User
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (instancetype)userWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (NSString *)description{
    NSArray *keys = @[@"id",@"screen_name",@"profile_image_url",@"verified_type",@"mbrank"];
    return [self dictionaryWithValuesForKeys:keys].description;
    }
@end
