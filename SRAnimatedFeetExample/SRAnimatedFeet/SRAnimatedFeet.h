//
//  SRAnimatedFeet.h
//
//  Created by Saheb Roy on 08/04/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum {
    kSRImageBoot,
    kSRImageFeet
}SRFeetType;

@interface SRAnimatedFeet : UIView

/*
 Assign a value to this property, kSRImageFeet is by default
 */
@property (nonatomic,assign) SRFeetType feetTypeForAnimation;

/*
 This property would tell the realtime value of the animation.
 */
@property (nonatomic,assign) BOOL isAnimating;

/*
 Overwrite this property to set colour of the animating feet
 Default colour is green
 */
@property (nonatomic,strong) UIColor *defaultColourFeet;



-(void)startAnimatingFoot;
-(void)stopAnimaingFoot;

@end
