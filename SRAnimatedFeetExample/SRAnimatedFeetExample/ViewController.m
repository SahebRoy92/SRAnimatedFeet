//
//  ViewController.m
//  SRAnimatedFeetExample
//
//  Created by Saheb Roy on 08/04/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import "ViewController.h"
#import "SRAnimatedFeet.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SRAnimatedFeet *animatedView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startAnimatingAction:(id)sender{
    [self.animatedView startAnimatingFoot];
}


-(IBAction)stopAnimatingAction:(id)sender{
    [self.animatedView stopAnimaingFoot];
}
@end
