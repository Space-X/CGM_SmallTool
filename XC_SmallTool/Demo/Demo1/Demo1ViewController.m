//
//  Demo1ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/10.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo1ViewController.h"
#import "CGM_ViewControllerAutoSegment.h"
#import "Demo1subViewController.h"

@interface Demo1ViewController ()

@property (nonatomic,weak)CGM_ViewControllerAutoSegment *cgm_ctrl ;//分段控制器


@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"分段控制器";
    self.automaticallyAdjustsScrollViewInsets = NO ; //取消偏移
    NSArray *titleArr = @[@"东邪",@"西毒",@"南帝",@"北丐",@"中神通",@"神雕侠侣",@"老顽童",@"周伯通"];
    NSMutableArray *ctrlArr = [NSMutableArray array]; //装控制器
    
    //Demo1subViewController  即我们的控制器。如果里面布局一样，但是数据源不一样，可以给每个控制器加属性，做区分，也可以创建多个控制器。加载到数组里面。 分段控制器，会给他们分配位置进行展示
    for (NSString *titile  in titleArr) {
        Demo1subViewController *demo1subCtrl = [[Demo1subViewController alloc] init];
        demo1subCtrl.title = titile ;
        [ctrlArr addObject:demo1subCtrl];
    }
    
    CGM_ViewControllerAutoSegment *segmentCtrl = [[CGM_ViewControllerAutoSegment alloc] initWithCtrltitle:ctrlArr];;
    _cgm_ctrl = segmentCtrl ;
    _cgm_ctrl.view.frame=CGRectMake(0, 64, KmainScreenWidth,KmainScreenHeiht-64);

    _cgm_ctrl.sliderBackColor= [UIColor redColor];  //滑块默认颜色
    _cgm_ctrl.btnNormolColor = [UIColor grayColor]; //正常时的颜色
    _cgm_ctrl.btnSlectColor = Color(82, 143, 162, 1); //选中时的颜色
    _cgm_ctrl.ScorllviewIndex = 3;  //默认第4个控制器
    
    _cgm_ctrl.titleScrollviewBackColor = [UIColor cyanColor]; //标签栏的颜色
    [self addChildViewController:_cgm_ctrl];  //不可缺少重要
    [self.view addSubview:_cgm_ctrl.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end