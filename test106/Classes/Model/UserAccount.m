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

- (void)saveUserAccount{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"account.plish"];
    NSLog(@"--path-->%@",path);
    [NSKeyedArchiver archiveRootObject:self toFile:path];
}


- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.access_token forKey:@"access_token"];
    [coder encodeObject:self.expiresDate forKey:@"expiresDate"];
    [coder encodeObject:self.uid forKey:@"uid"];
    [coder encodeObject:self.screen_name forKey:@"screen_name"];
    [coder encodeObject:self.avatar_large forKey:@"avatar_large"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if(self){
        self.access_token = [coder decodeObjectForKey:@"access_token"];
        self.expiresDate = [coder decodeObjectForKey:@"expiresDate"];
        self.uid = [coder decodeObjectForKey:@"uid"];
        self.screen_name = [coder decodeObjectForKey:@"screen_name"];
        self.avatar_large = [coder decodeObjectForKey:@"avatar_large"];
    }
    return self;
}


@end
