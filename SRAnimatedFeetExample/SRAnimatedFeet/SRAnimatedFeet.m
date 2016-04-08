//
//  SRAnimatedFeet.m
//
//  Created by Saheb Roy on 08/04/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#define ONESTEP 35

#define BOOT_leftimagePath [[NSBundle bundleWithURL:[[NSBundle mainBundle]URLForResource:@"SRAnimatedFeetBundle" withExtension:@"bundle"]] pathForResource:@"bootLeft" ofType:@"png"]
#define BOOT_rightimagePath [[NSBundle bundleWithURL:[[NSBundle mainBundle]URLForResource:@"SRAnimatedFeetBundle" withExtension:@"bundle"]] pathForResource:@"bootRight" ofType:@"png"]


#define FEET_leftimagePath [[NSBundle bundleWithURL:[[NSBundle mainBundle]URLForResource:@"SRAnimatedFeetBundle" withExtension:@"bundle"]] pathForResource:@"stepLeft" ofType:@"png"]
#define FEET_rightimagePath [[NSBundle bundleWithURL:[[NSBundle mainBundle]URLForResource:@"SRAnimatedFeetBundle" withExtension:@"bundle"]] pathForResource:@"stepRight" ofType:@"png"]




#import "SRAnimatedFeet.h"
#import "UIImage+SRChooseColor.h"

const CGFloat width = 20;
const CGFloat height = 15;


typedef enum {
    Left,
    Right
}SRCurrentFeet;


@interface SRAnimatedFeet()


@end

@implementation SRAnimatedFeet{
    NSTimer *theTimer;
    CGFloat left_x, left_y, right_x, right_y;
    SRCurrentFeet currentFeet;
    BOOL userChoosedColour;
}



-(instancetype)init{
    if([super init]){
        [self setupEverything];
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if([super initWithCoder:aDecoder]){
        [self setupEverything];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        [self setupEverything];
    }
    return self;
}



-(void)setupEverything{
    left_y = (CGRectGetHeight(self.bounds)/2)-height;
    right_y = (CGRectGetHeight(self.bounds)/2);
    
    left_x = 25;
    right_x = 15;
    
    self.isAnimating = NO;
}




-(void)startAnimatingFoot{
    
    [theTimer invalidate];
    [self setupEverything];
    if(self.defaultColourFeet)
        userChoosedColour = YES;
    else
        userChoosedColour = NO;
    
    currentFeet = Left;
    theTimer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(createFeetAccordingToTimer) userInfo:nil repeats:YES];
    self.isAnimating = YES;
}


-(void)stopAnimaingFoot{
    [theTimer invalidate];
    self.isAnimating = NO;
    [self eraseEverything];
}

-(void)createFeetAccordingToTimer{
    if(currentFeet == Left){
        currentFeet = Right;
        [self iterateOverRightFeetWithTimer];
    }
    else {
        currentFeet = Left;
        [self iterateOverLeftFeetWithTimer];
    }
}

-(void)iterateOverLeftFeetWithTimer{
    
    if(left_x + ONESTEP +width >= self.bounds.size.width){
        [self resetAll];
        return;
    }
    [self createLeftFeet];
}


-(void)createLeftFeet{
    
    NSString *currentLeftImage;
    
    if(self.feetTypeForAnimation == kSRImageBoot)
        currentLeftImage = BOOT_leftimagePath;
    else
        currentLeftImage = FEET_leftimagePath;
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(left_x, left_y, width, height)];
    UIImage *imageToShow = [UIImage imageWithContentsOfFile:currentLeftImage];
    [self createImageViewWithImage:img andContentImage:imageToShow];
    [self addSubview:img];
    left_x += ONESTEP;
    [self fadeAnimationWithImageView:img];
}


-(void)iterateOverRightFeetWithTimer{
    
    if(right_x + ONESTEP +width >= self.bounds.size.width){
        [self resetAll];
        return;
    }
    [self createRightFeet];
}

-(void)createRightFeet{
    NSString *currentRightImage;
    
    if(self.feetTypeForAnimation == kSRImageBoot)
        currentRightImage = BOOT_rightimagePath;
    else
        currentRightImage = FEET_rightimagePath;
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(right_x, right_y, width, height)];
    UIImage *imageToShow = [UIImage imageWithContentsOfFile:currentRightImage];
    [self createImageViewWithImage:img andContentImage:imageToShow];
    [self addSubview:img];
    right_x += ONESTEP;
    [self fadeAnimationWithImageView:img];
    
}



-(void)createImageViewWithImage:(UIImageView *)img andContentImage:(UIImage*)image{
    CGFloat scale = image.size.height/image.size.width;
    CGRect tempRect = img.frame;
    tempRect.size.height = tempRect.size.height*scale;
    img.frame = tempRect;
    img.image = image;
    if(userChoosedColour){
        img.image = [UIImage imageChangeColorandImage:image andTintColor:self.defaultColourFeet];
    }else
        img.image = image;
    img.layer.shadowColor = [UIColor blackColor].CGColor;
    img.layer.shadowOffset = CGSizeMake(0, 1);
    img.layer.shadowOpacity = 0.5;
    img.layer.shadowRadius = 1.0;
    img.clipsToBounds = NO;
    
}

-(void)fadeAnimationWithImageView:(UIImageView *)img{
    
    [UIView animateWithDuration:2.5 animations:^{
        img.alpha = 0.0;
    } completion:^(BOOL finished) {
        [img removeFromSuperview];
    }];
    
}

-(void)resetAll{
    [self eraseEverything];
    [self setupEverything];
    [self startAnimatingFoot];
}

-(void)eraseEverything{
    for (UIImageView *img in self.subviews) {
        if([img isKindOfClass:[UIImageView class]]){
            [img removeFromSuperview];
        }
    }
}

@end
