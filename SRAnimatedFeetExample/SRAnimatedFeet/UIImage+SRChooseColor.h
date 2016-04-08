//
//  UIImage+SRChooseColor.h
//  TDDemo
//
//  Created by Saheb Roy on 08/04/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SRChooseColor)

-(UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color;
+(UIImage *)imageChangeColorandImage:(UIImage *)image andTintColor:(UIColor *)color;

@end
