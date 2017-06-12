//
//  ViewController.m
//  demo2
//
//  Created by MAC on 12/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ViewController.h"
#import "VC1.h"
@interface ViewController ()

@end

@implementation ViewController

{
    NSArray *type;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    type=[[NSArray alloc]initWithObjects:@"through segue demo",@"using singelton demo",@"delegate protocol", nil];
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
    switch (indexPath.row) {
        case 0:
            vc.typeName=@"segue";
            break;
        case 1:
            vc.typeName=@"singelton";
            break;
        case 2:
            vc.typeName=@"delegate";
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
