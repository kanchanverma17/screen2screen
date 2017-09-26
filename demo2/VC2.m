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
VC1 *firstScreenObj;
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setThisLbl:) name:@"EventOccured" object:nil];
    firstScreenObj = [[VC1 alloc]init];
    
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
   
    NSString *mode=[applictionMode sharedapplictionMode].ThisIsHowWeDoIt;
    if([mode containsString:@"segue"])
    {
    self.secondScreenLbl.text=self.lblStr;
        return;
    }
    if([mode containsString:@"singelton"]){
        self.secondScreenLbl.text=[applictionMode sharedapplictionMode].valuetobePassed;
        return;
    }
    if([mode containsString:@"delegate"])
    {
        if(_FirstScreenDel)
        {
            NSString *textLbl = [self.FirstScreenDel firstScreenTxtFld];
            self.secondScreenLbl.text = textLbl;
        }
        return;
    }

   
}



-(void)setThisLbl:(NSNotification *)notify
{
    NSDictionary *valueDict=[[NSDictionary alloc]initWithDictionary:notify.userInfo];
    
    self.secondScreenLbl.text = [valueDict objectForKey:@"TfValue"];
}


-(void)viewDidAppear:(BOOL)animated{
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
