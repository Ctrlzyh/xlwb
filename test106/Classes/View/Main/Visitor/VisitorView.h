//
//  VisitorView.h
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol VisitorViewDelegate <NSObject>
@required
- (void)clickLogin;
- (void)clickRegister;
@end

@interface VisitorView : UIView
- (instancetype) initWithVisitor;
- (void)setupInfoImgName:(NSString *)imgName WithTitle:(NSString *)title;

@property (nonatomic, assign) id <VisitorViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
