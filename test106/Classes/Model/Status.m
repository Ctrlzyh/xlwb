//
//  Status.m
//  test106
//
//  Created by qiaofang on 2021/10/11.
//

#import "Status.h"

@implementation Status

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    if([key isEqual:@"user"]){
        if([value isKindOfClass:[NSDictionary class]]){
            self.user  = [User userWithDictionary:value];
        }
        return;
    }
    
    if([key isEqual:@"retweeted_status"]){
        if([value isKindOfClass:[NSDictionary class]]){
            self.retweeted_status  = [Status statusWithDictionary:value];
        }
        return;
    }
    
    [super setValue:value forKey:key];
    

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (instancetype)statusWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (NSString *)description{
    NSArray *keys = @[@"id",@"text",@"created_at",@"source",@"user",@"pic_urls"];
    return [self dictionaryWithValuesForKeys:keys].description;
}


@end
