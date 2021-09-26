//
//  UserAccount.m
//  test106
//
//  Created by qiaofang on 2021/9/26.
//

#import "UserAccount.h"

@implementation UserAccount

-(void)setExpires_in:(NSTimeInterval )expires_in{
    _expires_in = expires_in;
    _expiresDate = [NSDate dateWithTimeIntervalSinceNow:expires_in];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict

{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    return self;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (instancetype)provinceWithDictionary:(NSDictionary *)dict

{
    
    return [[self alloc] initWithDictionary:dict];
    
}

- (NSString *)description{
    
    NSArray *keys = @[@"access_token",@"expires_in",@"expiresDate",@"uid",@"screen_name",@"avatar_large"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
    
}

@end
