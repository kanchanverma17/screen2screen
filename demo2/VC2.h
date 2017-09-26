//
//  VC2.h
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FirstScreen <NSObject>

-(NSString *)firstScreenTxtFld;

@end


#import "VC1.h"

@interface VC2 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *secondScreenLbl;
@property(weak,nonatomic) id <FirstScreen> FirstScreenDel;
@property(weak,nonatomic) NSString *lblStr;
@end
