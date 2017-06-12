//
//  VC1.h
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC1 : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *VC1Textfield;
@property(weak,nonatomic) NSString *typeName;

@end
