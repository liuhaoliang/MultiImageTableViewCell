//
//  YMImageComposing.h
//  WheelTech
//
//  Created by 韶创 on 15/8/19.
//  Copyright (c) 2015年 韶创. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMImageCollectionViewFactory : NSObject

+ (Class)classForNumberOfImages:(NSUInteger)imagesCount;
+ (UIView *)dequeueViewForNumberOfImages:(NSUInteger)imagesCount;
+ (void)enqueueView:(UIView *)view forNumberOfImages:(NSUInteger)imagesCount;

@end
