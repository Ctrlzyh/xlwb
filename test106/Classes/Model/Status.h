//
//  Status.h
//  test106
//
//  Created by qiaofang on 2021/10/11.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Status : NSObject
@property (nonatomic) int id;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,strong) User *user;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)statusWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
