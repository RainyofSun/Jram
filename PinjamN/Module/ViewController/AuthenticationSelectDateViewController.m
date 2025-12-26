//
//  AuthenticationSelectDateViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "AuthenticationSelectDateViewController.h"

@interface AuthenticationSelectDateViewController ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation AuthenticationSelectDateViewController

- (void)leftAction
{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.huNavigationBar.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.3];
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kSCREEN_HEIGHT - 250 - XBottomHeight, kSCREEN_WIDTH, 300 + XBottomHeight)];
    bottomView.backgroundColor = UIColorFromRGB(MainWhiteColor);
    [self.view addSubview:bottomView];
    
        self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    self.datePicker.maximumDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:1900];
    [components setMonth:1];
    [components setDay:1];
    NSDate *minDate = [calendar dateFromComponents:components];
    self.datePicker.minimumDate = minDate;
    self.datePicker.date = [NSDate date];
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        self.datePicker.frame = CGRectMake(0, 50, self.view.frame.size.width, 250);
    [bottomView addSubview:self.datePicker];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH - 100, 0, 100, 50)];
    [btn setTitle:@"Confirm" forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromRGB(MainText0Color) forState:UIControlStateNormal];
    WEAK_SELF
    [btn addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self leftAction];
    }];
    [bottomView addSubview:btn];
    
   
}


- (void)dateChanged:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateString = [formatter stringFromDate:selectedDate];
    if (self.block) {
        self.block(dateString);
    }
}

@end
