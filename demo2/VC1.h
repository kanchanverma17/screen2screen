//
//  VC1.h
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC2.h"


@interface VC1 : UIViewController<UITextFieldDelegate,FirstScreen>

@property (weak, nonatomic) IBOutlet UITextField *VC1Textfield;
@property(weak,nonatomic) NSString *typeName;

@end
