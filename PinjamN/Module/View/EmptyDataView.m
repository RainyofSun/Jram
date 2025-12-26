//
//  EmptyDataView.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "EmptyDataView.h"

@interface EmptyDataView ()

@property (nonatomic, strong)UILabel     *s_nameLabel;
@property (nonatomic, strong)UIImageView *s_image;

@end

@implementation EmptyDataView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews
{
    self.backgroundColor = [UIColor clearColor];
    self.s_image = [UIImageView new];
    self.s_image.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.s_image];
    [self.s_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(0);
        make.centerY.equalTo(self).offset(-40);
        make.height.mas_equalTo(135);
        make.width.mas_equalTo(125);
    }];
    
    self.s_nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.s_image.bottom, self.width, 55)];
    self.s_nameLabel.textColor = UIColorFromRGB(0x7777777);
    self.s_nameLabel.numberOfLines = 0;
    self.s_nameLabel.font = OSLWMediumFont(14);
    self.s_nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.s_nameLabel];
    [self.s_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.s_image.mas_bottom).offset(6);
        make.left.right.equalTo(self);
    }];

}

- (void)configWithPlaceTextStr:(NSString *)placeStr placeImageStr:(NSString *)imageStr;
{
    self.s_nameLabel.text = placeStr;
    self.s_image.image = OSLWImage(imageStr);
}

@end
