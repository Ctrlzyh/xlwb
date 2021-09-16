//
//  VisitorView.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "VisitorView.h"
@interface VisitorView ()
@property (nonatomic ,strong) UIImageView *iconView;
@end
@implementation VisitorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithVisitor{
    if(self == [super init]){
        [self showUI];
    }
    return self;
}

-(void) showUI{
//    self.iconView.frame = CGRectMake(100, 100, 100, 100);
//    self.iconView.backgroundColor = [UIColor redColor];
    [self addSubview:self.iconView];
    
}
-(UIImageView *) iconView{
    if(!_iconView){
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed: @"visitordiscover_feed_image_smallicon"];
    }
    [_iconView sizeToFit];
//    _iconView.translatesAutoresizingMaskIntoConstraints
    return _iconView;
}
@end
