//
//  SAVideoToolbar.m
//  SampleApp
//
//  Created by John Lee on 2020/5/6.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAVideoToolbar.h"
#import "SAVideoInfo.h"

@interface SAVideoToolbar ()

@property (nonatomic, strong, readwrite) UIImageView *avatarImageView;
@property (nonatomic, strong, readwrite) UILabel *nickLabel;

@property (nonatomic, strong, readwrite) UIImageView *commentImageView;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;
@property (nonatomic, strong, readwrite) UILabel *likeLabel;

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;
@property (nonatomic, strong, readwrite) UILabel *shareLabel;

@end

@implementation SAVideoToolbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        [self addSubview:({
            _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _avatarImageView.layer.masksToBounds = YES;
//            _avatarImageView.layer.cornerRadius = 15;
            _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _avatarImageView;
        })];

        [self addSubview:({
            _nickLabel = [[UILabel alloc]init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];

        [self addSubview:({
            _commentImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _commentImageView.layer.masksToBounds = YES;
//            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _commentImageView;
        })];

        [self addSubview:({
            _commentLabel = [[UILabel alloc]init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];

        [self addSubview:({
            _likeImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
//            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _likeImageView;
        })];

        [self addSubview:({
            _likeLabel = [[UILabel alloc]init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];

        [self addSubview:({
            _shareImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
//            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView;
        })];

        [self addSubview:({
            _shareLabel = [[UILabel alloc]init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
    }
    return self;
}

- (void)layoutWithModel:(id)model {
    if ([model isKindOfClass: [SAVideoInfo class]]) {
        SAVideoInfo *info = (SAVideoInfo *)model;
        
        _avatarImageView.image = [UIImage systemImageNamed:@"person.circle"];
        _nickLabel.text = info.nick;

        _commentImageView.image = [UIImage systemImageNamed:@"text.bubble"];
        _commentLabel.text = info.comment;

        _likeImageView.image = [UIImage systemImageNamed:@"hand.thumbsup"];
        _likeLabel.text = info.like;

        _shareImageView.image = [UIImage systemImageNamed:@"square.and.arrow.up"];
        _shareLabel.text = info.share;
    }
    

    [NSLayoutConstraint activateConstraints:@[
         [NSLayoutConstraint constraintWithItem:_avatarImageView
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0],

         [NSLayoutConstraint constraintWithItem:_avatarImageView
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeLeft
                                     multiplier:1
                                       constant:15],

         [NSLayoutConstraint constraintWithItem:_avatarImageView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1
                                       constant:30],

         [NSLayoutConstraint constraintWithItem:_avatarImageView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1
                                       constant:30],

         [NSLayoutConstraint constraintWithItem:_nickLabel
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_avatarImageView
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0],

         [NSLayoutConstraint constraintWithItem:_nickLabel
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_avatarImageView
                                      attribute:NSLayoutAttributeRight
                                     multiplier:1
                                       constant:0]

    ]];

    NSString *vlfString = @"H:|-15-[_avatarImageView]-0-[_nickLabel]->=0-[_commentImageView]-0-[_commentLabel]-15-[_likeImageView]-0-[_likeLabel]-15-[_shareImageView]-0-[_shareLabel]-15-|";

    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vlfString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatarImageView, _nickLabel, _commentImageView, _commentLabel, _likeImageView, _likeLabel, _shareImageView, _shareLabel)]];
}

@end
