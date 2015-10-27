//
//  Pinch.m
//  GestureRecognizer
//
//  Created by Cuong Trinh on 8/25/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "PinchRotate.h"
//#import "UIImageView+Photo.h"

@implementation PinchRotate
{
    UIImageView* ruby;
    UIRotationGestureRecognizer *rotateRecognizer;
    NSTimer* timer;
    CGFloat rotateAngel,requirement;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    ruby = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ruby.png"]];
    ruby.frame = CGRectMake(100, 200, 200, 250);
    ruby.contentMode = UIViewContentModeScaleAspectFit;
    ruby.userInteractionEnabled = YES;
    ruby.multipleTouchEnabled = YES;
    [self.view addSubview:ruby];
    
    rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                    action:@selector(rotateMe:)];
    [ruby addGestureRecognizer: rotateRecognizer];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(loop)
                                           userInfo:nil
                                            repeats:true];
    
    
}


- (void) rotateMe: (UIRotationGestureRecognizer *)gestureRecognizer {
    
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        ruby.transform = CGAffineTransformRotate(gestureRecognizer.view.transform,
                                                 gestureRecognizer.rotation);
        
        rotateAngel= -gestureRecognizer.velocity;
        requirement = gestureRecognizer.rotation =0;
        
        
    }
    
    
}
- (void) loop {
    if (requirement ==0 && rotateAngel!=0) {
        
        ruby.transform = CGAffineTransformMakeRotation(rotateAngel*2*M_PI);
        rotateAngel =rotateAngel*.975;
    }
}

@end
