//
//  UserAccount.h
//  test106
//
//  Created by qiaofang on 2021/9/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserAccount : NSObject<NSCoding>
@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,assign) NSTimeInterval expires_in;
@property (nonatomic,assign) NSDate* expiresDate;
@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *screen_name;
@property (nonatomic,copy) NSString *avatar_large;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)provinceWithDictionary:(NSDictionary *)dict;

- (void)saveUserAccount;

@end

NS_ASSUME_NONNULL_END
