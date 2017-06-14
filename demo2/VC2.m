//
//  VC2.m
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "VC2.h"
#import "applictionMode.h"
@interface VC2 ()

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    NSString *mode=[applictionMode sharedapplictionMode].ThisIsHowWeDoIt;
    if([mode containsString:@"segue"]){
    self.secondScreenLbl.text=self.lblStr;
    }
    if([mode containsString:@"singelton"]){
        self.secondScreenLbl.text=[applictionMode sharedapplictionMode].valuetobePassed;
    }
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
