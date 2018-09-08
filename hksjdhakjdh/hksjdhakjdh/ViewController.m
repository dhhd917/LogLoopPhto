//
//  ViewController.m
//  hksjdhakjdh
//
//  Created by gdh on 2018/9/8.
//  Copyright © 2018年 gdh. All rights reserved.
//

#define kscreenWid [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

static NSTimeInterval const ktimeInterval = 0.001;
static CGFloat const changeYPoint = 0.2;

@interface ViewController ()

{
	UIImageView *image1;
	UIImageView *image2;
}

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	CGFloat imgHei =  kscreenWid *10737 / 1080;
	
	UIImageView *image11 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_2386.JPG"]];
	image11.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), imgHei);
	[self.view addSubview:image11];
	image1 = image11;
	
	UIImageView *image22 = [[UIImageView alloc]initWithImage:image11.image];
	image22.frame = CGRectMake(0, CGRectGetMaxY(image1.frame), CGRectGetWidth(self.view.frame), imgHei);
	[self.view addSubview:image22];
	image2 = image22;
	
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:ktimeInterval target:self selector:@selector(changeImgFrame) userInfo:nil repeats:YES];
	[timer fire];
	_timer = timer;
	
}

- (void)changeImgFrame {
	
	CGFloat imgHei =  kscreenWid *10737 / 1080;
	
	CGRect image1Frame = image1.frame;
	image1Frame.origin.y = image1Frame.origin.y - changeYPoint;
	image1.frame = image1Frame;
	
	CGRect image2Frame = image2.frame;
	image2Frame.origin.y = image2Frame.origin.y - changeYPoint;
	image2.frame = image2Frame;

	if (image1.frame.origin.y <= -imgHei) {//改变image1的高度
		
		CGRect image2Frame = image2.frame;
		CGRect image1Frame = image1.frame;
		image1Frame.origin.y = image2Frame.origin.y + imgHei;
		image1.frame = image1Frame;
		
		
	}else if (image2.frame.origin.y <= -imgHei) {//改变image2的高度
		
		CGRect image1Frame = image1.frame;
		CGRect image2Frame = image2.frame;
		image2Frame.origin.y = image1Frame.origin.y + imgHei;
		image2.frame = image2Frame;
	}
	
}

- (void)dealloc {
	
	if ([self.timer isValid]) {
		[self.timer invalidate];
		self.timer = nil;
	}
}

@end
