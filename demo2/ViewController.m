//
//  ViewController.m
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ViewController.h"
#import "VC1.h"
#import "applictionMode.h"
@interface ViewController ()

@end

@implementation ViewController

{
    NSArray *type;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    type=[[NSArray alloc]initWithObjects:@"through segue demo",@"using singelton demo",@"delegate protocol",@"Notification and observer", nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return type.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text=[type objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VC1 *vc=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"VC1"];
    NSString *typeName1;
    switch (indexPath.row) {
        case 0:
            vc.typeName=@"segue";
     typeName1=@"segue";
            break;
        case 1:
            typeName1=@"singelton";
            break;
        case 2:
            typeName1=@"delegate";
            break;
        case 3:
            typeName1=@"notifiaction/observer";
            break;
        default:
            break;
    }
    [applictionMode sharedapplictionMode].ThisIsHowWeDoIt=typeName1;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
