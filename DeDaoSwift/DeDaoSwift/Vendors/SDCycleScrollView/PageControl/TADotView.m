//
//  TADotView.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-22.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

#import "TADotView.h"

@implementation TADotView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)initialization
{
    self.backgroundColor    = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.layer.borderWidth  = 2;
}


- (void)changeActivityState:(BOOL)active
{
    if (active) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}

@end

@interface TAVideoDotView()

@property (nonatomic, strong) UIImageView *videoImage;
@end

@implementation TAVideoDotView

- (instancetype) init {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self initialization];
    }return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialization];
    }return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }return self;
}

- (void) initialization {
    [self addSubview:self.videoImage];
    self.videoImage.frame = self.frame;
}

- (void) changeActivityState:(BOOL)active {
    if (active) {
        // change videoImage's image
    }else {
        // change videoImage's image
    }
}

- (UIImageView *)videoImage {
    if (!_videoImage) {
        _videoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"small_video"]];
    }return _videoImage;
}

@end
