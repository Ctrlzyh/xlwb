//
//  User.h
//  test106
//
//  Created by qiaofang on 2021/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (nonatomic) int id;
@property (nonatomic,copy) NSString *screen_name;
@property (nonatomic,copy) NSString *profile_image_url;
@property (nonatomic) int verified_type;
@property (nonatomic) int mbrank;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)userWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
