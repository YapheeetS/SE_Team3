//
//  XYKRegisterWeightViewController.m
//  xyk
//
//

#import "XYKRegisterWeightViewController.h"
#import "SBScrollRulerView.h"


@interface XYKRegisterWeightViewController ()<SBScrollRulerViewDelegate>
@property (nonatomic, strong)UILabel *weightLabel;
@property (nonatomic, assign) int value;
@end

@implementation XYKRegisterWeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.value = 60;
    
    [self setMainView];
}



- (void)setMainView{
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.view addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    titleLabel.textColor = RGB(102, 102, 102);
    titleLabel.text = @"Choose your weight:";
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(230, 25));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(90*KHeight);
    }];
    
    
    UIImageView *backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register_height_background"]];
    [self.view addSubview:backImageView];
    backImageView.userInteractionEnabled = true;
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(80*KHeight);
        make.size.mas_equalTo(CGSizeMake(350*Kwidth, 80*Kwidth));
    }];
    
    [self.view layoutIfNeeded];
    
    SBScrollRulerView *rulerView = [[SBScrollRulerView alloc] initWithFrame:CGRectMake(35*Kwidth, backImageView.y + 5, self.view.frame.size.width - 70*Kwidth, RVCShareIns.rulerView_H) theMinValue:0 theMaxValue:300 theStep:1 theUnit:@"" theNum:160];
    rulerView.delegate = self;
    rulerView.bgColor = RGB(247, 247, 247);
    rulerView.triangleColor = RGB(254, 196, 27);
    
    RVCShareIns.step = 1;
    RVCShareIns.betweenNum = 10;
    RVCShareIns.rulerGap = 10;
    RVCShareIns.maxValue = 200;
    RVCShareIns.minValue = 0;
    RVCShareIns.rulerView_BGColor = [UIColor whiteColor];
    RVCShareIns.rulerTitle_Color = RGB(202, 202, 202);
    RVCShareIns.red = 202.0;
    RVCShareIns.green = 202.0;
    RVCShareIns.blue = 202.0;
    RVCShareIns.triangle_Color = [UIColor clearColor];
    RVCShareIns.rulerView_H = 60;
    [rulerView reDrawRectRulerView:RVCShareIns];
    [rulerView setRealValue:60 animated:NO];
    [self.view addSubview:rulerView];
    
    
    
    UIImageView *pointer = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register_height_pointer"]];
    [self.view addSubview:pointer];
    pointer.userInteractionEnabled = true;
    [pointer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(backImageView.mas_top).offset(-8*Kwidth);
        make.bottom.mas_equalTo(backImageView.mas_bottom).offset(8*Kwidth);
        make.width.mas_equalTo(18*Kwidth);
    }];
    
    UILabel *weightLabel = [[UILabel alloc]init];
    [self.view addSubview:weightLabel];
    self.weightLabel = weightLabel;
    weightLabel.textAlignment = NSTextAlignmentCenter;
    weightLabel.text = @"60 kg";
    weightLabel.font = [UIFont fontWithName:@"DINCondensed-Bold" size:36];
    weightLabel.textColor = RGB(123, 163, 252);
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:weightLabel.text];
    NSRange range = [weightLabel.text rangeOfString:@" kg"];
    [attri addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Light" size:18] range:range];
    [attri addAttribute:NSForegroundColorAttributeName value:RGB(202, 202, 202) range:range];
    weightLabel.attributedText = attri;
    [weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.top.mas_equalTo(pointer.mas_bottom).offset(20*Kwidth);
        make.centerX.mas_equalTo(self.view);
    }];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"register_previous"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-85*KHeight);
        make.centerX.mas_equalTo(self.view).offset(-55*Kwidth);
        make.size.mas_equalTo(CGSizeMake(45*Kwidth, 45*Kwidth));
    }];
    
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:nextButton];
    [nextButton setImage:[UIImage imageNamed:@"register_next"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-85*KHeight);
        make.centerX.mas_equalTo(self.view).offset(55*Kwidth);
        make.size.mas_equalTo(CGSizeMake(45*Kwidth, 45*Kwidth));
    }];
    
    
    UIButton *finishButton = [[UIButton alloc]init];
    [finishButton setBackgroundImage:[UIImage imageNamed:@"icon_login_btn"] forState:UIControlStateNormal];
    [finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishButton setTitle:@"Finish" forState:UIControlStateNormal];
    finishButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:finishButton];
    [finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(40);
        make.right.mas_equalTo(self.view).offset(-40);
        make.bottom.mas_equalTo(self.view).offset(-85*KHeight);
        make.height.mas_equalTo(45);
    }];
    
    
}


- (void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)nextButtonClick:(UIButton *)sender
{
    
}


#pragma mark - SBScrollRulerViewDelegate
- (void)sbScrollRulerView:(SBScrollRulerView *)rulerView valueChange:(float)value{
    if (!self.weightLabel) {
        return;
    }
    self.value = (int)value;
    self.weightLabel.text = [NSString stringWithFormat:@"%d kg",(int)value];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self.weightLabel.text];
    NSRange range = [self.weightLabel.text rangeOfString:@" kg"];
    [attri addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Light" size:18] range:range];
    [attri addAttribute:NSForegroundColorAttributeName value:RGB(202, 202, 202) range:range];
    self.weightLabel.attributedText = attri;
    
}

@end