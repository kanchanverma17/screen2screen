//
//  VC1.m
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "VC1.h"
#import "VC2.h"
#import "applictionMode.h"
@interface VC1 ()

@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
   
 
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)VC1Btn:(id)sender {
    
    if([_VC1Textfield.text isEqualToString:@""]){
       
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"I need some value to continue" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:act];
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
   
    if([[applictionMode sharedapplictionMode].ThisIsHowWeDoIt containsString:@"notification"])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSDictionary *dict=[[NSDictionary alloc]initWithObjects:[[NSArray alloc]initWithObjects:self.VC1Textfield.text, nil] forKeys:[[NSArray alloc]initWithObjects:@"TfValue", nil]];
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"EventOccured" object:self userInfo:dict];
            
            //for notification to work properly has to be working on main thead
        });
        
        return;
    }
    if([[applictionMode sharedapplictionMode].ThisIsHowWeDoIt containsString:@"delegate"])
    {
       
        return;
    }
   
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([_VC1Textfield.text isEqualToString:@""]){
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"I need some value to continue" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:act];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    else
    {
        if([self.typeName containsString:@"segue"])
        {
            VC2 *destinationVC;
            destinationVC=[segue destinationViewController];
            destinationVC.lblStr=self.VC1Textfield.text;
        }
        if([[applictionMode sharedapplictionMode].ThisIsHowWeDoIt containsString:@"singelton"])
        {
            [applictionMode sharedapplictionMode].valuetobePassed=self.VC1Textfield.text;
        }
       
    }
   
    if([[applictionMode sharedapplictionMode].ThisIsHowWeDoIt containsString:@"delegate"])
    {
        VC2 *destinationVC;
        destinationVC=[segue destinationViewController];
        destinationVC.FirstScreenDel = self;
        
    }
    
}
-(NSString *)firstScreenTxtFld{
    return self.VC1Textfield.text;
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
