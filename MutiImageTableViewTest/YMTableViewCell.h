//
//  YMTableViewCell.h
//  WFCoretext
//
//  Created by 阿虎 on 14/10/28.
//  Copyright (c) 2014年 tigerwf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMTableViewCell : UITableViewCell
- (void)updateWithImageCount:(NSInteger)imageCount;
+ (CGFloat)cellHeightWithImageCount:(NSInteger)imageCount;
@end
