//
//  YMTableViewCell.m
//  WFCoretext
//
//  Created by 阿虎 on 14/10/28.
//  Copyright (c) 2014年 tigerwf. All rights reserved.
// 2 3 2 2 2 3 1 3 2 1


#import "YMTableViewCell.h"
#import "YMImageCollectionViewFactory.h"

@interface YMTableViewCell ()

@property (nonatomic, strong) UIView *imageCollectionView;
@property (nonatomic, assign) NSInteger imageCount;

@end

@implementation YMTableViewCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)updateWithImageCount:(NSInteger)imageCount{
    if(self.imageCount!=imageCount){
        [self releaseImageViewsWithImageCount:self.imageCount];
        [self createImageViewsWithImageCount:imageCount];
    }

    for (UIImageView*imageView in self.imageCollectionView.subviews) {
        if (imageView.tag<=imageCount) {
            imageView.backgroundColor = [UIColor colorWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1];
        }
    }
    self.imageCount=imageCount;
}

+ (CGFloat)cellHeightWithImageCount:(NSInteger)imageCount{
    switch (imageCount) {
        case 0:
            return 0;
        case 1:
            return SCREENWIDTH;
        case 2:
            return (SCREENWIDTH-3)/2.0;
        case 3:
            return (SCREENWIDTH-6)/3.0;
        case 4:
            return SCREENWIDTH;
        case 5:case 6:
            return (SCREENWIDTH-6)/3.0*2+3;
        default:
            return SCREENWIDTH;
    }
}

- (void)releaseImageViewsWithImageCount:(NSInteger)imageCount {
    if (_imageCollectionView) {
        [_imageCollectionView removeFromSuperview];
        [YMImageCollectionViewFactory enqueueView:_imageCollectionView forNumberOfImages:imageCount];
        _imageCollectionView = nil;
    }
}

- (void)createImageViewsWithImageCount:(NSInteger)imageCount {

    UIView *collectionView = [YMImageCollectionViewFactory dequeueViewForNumberOfImages:imageCount];
    collectionView.frame = self.contentView.bounds;
    [self.contentView addSubview:collectionView];
    _imageCollectionView = collectionView;
}

@end
