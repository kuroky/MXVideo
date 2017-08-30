//
//  ResVideoCell.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/30.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "ResVideoCell.h"
#import "ResVideoModel.h"
#import "EMImageCache.h"

@interface ResVideoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *videoName;
@property (weak, nonatomic) IBOutlet UILabel *videoSize;

@end

@implementation ResVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configVideoItem:(ResVideoModel *)item {
    [self.coverImageView em_setImageStr:item.videoCover
                                fitSize:CGSizeMake(100, 100)
                            placeholder:nil];
    
    self.videoName.text = item.name;
    self.videoSize.text = item.videoSize;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
