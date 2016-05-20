//
//  YMImageComposing.m
//  WheelTech
//
//  Created by 韶创 on 15/8/19.
//  Copyright (c) 2015年 韶创. All rights reserved.
//

#import "YMImageCollectionViewFactory.h"
#import "YMSingleImageView.h"
#import "YMSudokuImageViews.h"
#import "YMQuaterImageViews.h"
#import "YMTripleImagesView.h"
#import "YMSixImagesView.h"
#import "YMDoubleImageViews.h"

@implementation YMImageCollectionViewFactory

+ (NSMutableDictionary *)dictionary {
    static NSMutableDictionary *dictionary;
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        dictionary = [NSMutableDictionary new];
    });
    return dictionary;
}

+ (Class)classForNumberOfImages:(NSUInteger)imagesCount {
    
    Class class = nil;
    
    switch (imagesCount) {
        case 0: {
            class = nil;
        } break;
            
        case 1: {
            class = [YMSingleImageView class];
        } break;
            
        case 2: {
            class = [YMDoubleImageViews class];
        } break;
            
        case 3: {
            class = [YMTripleImagesView class];
        } break;
            
        case 4: {
            class = [YMQuaterImageViews class];
        } break;
            
        case 5: case 6: {
            class = [YMSixImagesView class];
        } break;
            
        default: {
            class = [YMSudokuImageViews class];
        } break;
    }
    
    return class;
}

+ (UIView *)createView:(NSUInteger)imagesCount {

    Class class = [self classForNumberOfImages:imagesCount];
    
    if (class == nil) {
        return nil;
    }
    
    NSArray *views = nil;
    if ([[NSBundle mainBundle] pathForResource:NSStringFromClass(class) ofType:@"nib"]) {
        views =[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(class) owner:nil options:nil];
    } else {
        views = @[[class new]];
    }
    
    UIView *collectionView = views.count ? views[0] : [class new];
    
    return collectionView;
}

+ (NSMutableArray *)arrayOf:(NSUInteger)imagesCount {
    NSMutableArray *array = [self dictionary][@(imagesCount)];
    if (!array) {
        array = [NSMutableArray new];
        [self dictionary][@(imagesCount)] = array;
    }
    return array;
}

+ (UIView *)dequeueViewForNumberOfImages:(NSUInteger)imagesCount {

    NSMutableArray *array = [self arrayOf:imagesCount];
    if (!array.count) {
        id view = [self createView:imagesCount];
        return view;
    }
    id view = array[0];
    [array removeObjectAtIndex:0];
    return view;
}

+ (void)enqueueView:(UIView *)view forNumberOfImages:(NSUInteger)imagesCount {
    if (view) {
        [[self arrayOf:imagesCount] addObject:view];
    }
}

@end
