//
//  ViewController.m
//  neo3
//
//  Created by Yongjia Liu on 13-6-23.
//  Copyright (c) 2013年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    CGPoint originalPosition;
    UIImageView *view[4][4];
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor colorWithRed:0.8 green:1.0 blue:1.0 alpha:1]];
    UIImageView *image[4][4];
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            image[i][j]=[[UIImageView alloc]initWithFrame:CGRectMake(j*70,i*70, 60, 60)];
            image[i][j].layer.masksToBounds=YES;
            CGFloat cr=image[i][j].layer.cornerRadius;
            if (cr==0)
                image[i][j].layer.cornerRadius=10.0;
        }
    }
    image[0][0].image=[UIImage imageNamed:@"01.jpg"];
    image[0][1].image=[UIImage imageNamed:@"02.jpg"];
    image[0][2].image=[UIImage imageNamed:@"03.jpg"];
    image[0][3].image=[UIImage imageNamed:@"04.jpg"];
    image[1][0].image=[UIImage imageNamed:@"05.jpg"];
    image[1][1].image=[UIImage imageNamed:@"06.jpg"];
    image[1][2].image=[UIImage imageNamed:@"07.jpg"];
    image[1][3].image=[UIImage imageNamed:@"08.jpg"];
    image[2][0].image=[UIImage imageNamed:@"09.jpg"];
    image[2][1].image=[UIImage imageNamed:@"10.jpg"];
    image[2][2].image=[UIImage imageNamed:@"11.jpg"];
    image[2][3].image=[UIImage imageNamed:@"12.jpg"];
    image[3][0].image=[UIImage imageNamed:@"13.jpg"];
    image[3][1].image=[UIImage imageNamed:@"14.jpg"];
    image[3][2].image=[UIImage imageNamed:@"15.jpg"];
    image[3][3].image=[UIImage imageNamed:@"16.jpg"];
    image[0][0].tag=100;
    /*CAKeyframeAnimation *bounce=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D forward=CATransform3DMakeScale(1.2, 1.2, 0.5);
    CATransform3D back=CATransform3DMakeScale(0.8, 0.8, 0.5);
    CATransform3D forward2=CATransform3DMakeScale(1.2, 1.2, 0.5);
    CATransform3D back2=CATransform3DMakeScale(0.9, 0.9, 0.5);
    [bounce setValues:[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:forward],
                       [NSValue valueWithCATransform3D:back],
                       [NSValue valueWithCATransform3D:forward2],
                       [NSValue valueWithCATransform3D:back2],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       nil]];
    bounce.beginTime=CACurrentMediaTime()+5;
    [bounce setDuration:0.6];*/
    //[image[0][0].layer addAnimation:bounce forKey:@"bounceAnimation"];
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            CAKeyframeAnimation *bounce=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
            
            CATransform3D forward=CATransform3DMakeScale(1.2, 1.2, 0.5);
            CATransform3D back=CATransform3DMakeScale(0.8, 0.8, 0.5);
            CATransform3D forward2=CATransform3DMakeScale(1.2, 1.2, 0.5);
            CATransform3D back2=CATransform3DMakeScale(0.9, 0.9, 0.5);
            [bounce setValues:[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DIdentity],
                               [NSValue valueWithCATransform3D:forward],
                               [NSValue valueWithCATransform3D:back],
                               [NSValue valueWithCATransform3D:forward2],
                               [NSValue valueWithCATransform3D:back2],
                               [NSValue valueWithCATransform3D:CATransform3DIdentity],
                               nil]];
            bounce.beginTime=CACurrentMediaTime()+0.04*i+0.05*j;
            [bounce setDuration:0.6];
            image[i][j].tag=i*10+j+1;
            [image[i][j].layer addAnimation:bounce forKey:@"bounceAnimation"];
        }
    }
    /*image[0][0].tag=100;
    image2.tag=200;*/
    for(int i=0;i<4;i++)
     for(int j=0;j<4;j++)
        [self.view addSubview:image[i][j]];
    CABasicAnimation *spin=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    [spin setFromValue:[NSNumber numberWithFloat:M_PI*0.5]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI*0.0]];
    [spin setDuration:0.5];
    spin.fillMode=kCAFillModeForwards;
    spin.removedOnCompletion=NO;
    /*for(int i=0;i<4;i++){
        for(int j=0;j<4;j++){
            [image[i][j].layer addAnimation:spin forKey:@"spinAnimation"];
        }
    }*/
   // [image[0][0].layer addAnimation:spin forKey:@"spinAnimation"];
   // [image[1][1].layer addAnimation:spin forKey:@"spinAnimation"];
    //NSLog(@"%lf\n",image[3][3].layer.cornerRadius);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    int m,n;
    m=0;
    n=0;
    /*CABasicAnimation *spin=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    [spin setFromValue:[NSNumber numberWithFloat:M_PI*0.0]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI*2.0]];
    [spin setDuration:0.618];
    spin.fillMode=kCAFillModeForwards;
    spin.removedOnCompletion=NO;*/
    UITouch *touch=[touches anyObject];
    //UIImageView *view1=(UIImageView*)[self.view viewWithTag:2];
    for (int i=0; i<4; i++) 
        for (int j=0; j<4; j++){
            view[i][j]=(UIImageView *)[self.view viewWithTag:i*10+j+1];
        }
    
    CGPoint point=[touch locationInView:self.view];
    for (int i=0; i<4; i++)
        if (point.x>i*70)
            m++;
    for (int j=0; j<4; j++)
        if (point.y>j*70) 
            n++;
        
    for (int i=0; i<4; i++)
        for (int j=0; j<4; j++){
            if ((i!=m-1)||(j!=n-1)){
                CABasicAnimation *spin=[CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
                [spin setFromValue:[NSNumber numberWithFloat:M_PI*0.0]];
                [spin setToValue:[NSNumber numberWithFloat:M_PI*2.0]];
                [spin setDuration:0.618];
                spin.fillMode=kCAFillModeForwards;
                spin.removedOnCompletion=NO;
                spin.beginTime=CACurrentMediaTime()+0.04*i+0.05*j;
                [view[j][i].layer addAnimation:spin forKey:@"spinAnimation"];
               // NSLog(@"%d/%d\n",m,n);
            }
            else
                view[j][i].layer.zPosition=0;
        }
    //if ((point.x>0)&&(point.y<70))
        //[view1.layer addAnimation:spin forKey:@"spinAnimation"];
        
    /*CGRect frame=view1.frame;
    frame.origin=point;
    view1.frame=frame;*/
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    originalPosition=[touch locationInView:(UIImageView*)[self.view viewWithTag:100]];
    if ((originalPosition.x>90)||(originalPosition.y>90)||(originalPosition.x<0)||(originalPosition.y<0)) {
        originalPosition.x=-1;
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    UIImageView *view1=(UIImageView*)[self.view viewWithTag:100];
    CGPoint currentPocation=[touch locationInView:view1];
    if (originalPosition.x!=-1) {
        CGRect frame=view1.frame;
        frame.origin.x +=currentPocation.x-originalPosition.x;
        frame.origin.y +=currentPocation.y-originalPosition.y;
        view1.frame=frame;
    }
    CGRect frame=view1.frame;
    frame.origin.x +=currentPocation.x-originalPosition.x;
    frame.origin.y +=currentPocation.y-originalPosition.y;
    view1.frame=frame;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
