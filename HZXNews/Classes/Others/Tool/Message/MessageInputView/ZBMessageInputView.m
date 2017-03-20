//
//  ZBMessageInputView.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-10.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "ZBMessageInputView.h"
//#import "NSString+Message.h"

@interface ZBMessageInputView()<UITextViewDelegate>

@property (nonatomic, weak, readwrite) ZBMessageTextView *messageInputTextView;

@property (nonatomic, weak, readwrite) UIButton *takephotoButton;

@property (nonatomic, weak, readwrite) UIButton *atpersonButton;


@property (nonatomic, weak, readwrite) UIButton *voiceChangeButton;

@property (nonatomic, weak, readwrite) UIButton *multiMediaSendButton;

@property (nonatomic, weak, readwrite) UIButton *faceSendButton;

@property (nonatomic, weak, readwrite) UIButton *holdDownButton;

@property (nonatomic, copy) NSString *inputedText;

@end

@implementation ZBMessageInputView

- (void)dealloc{
    _messageInputTextView.delegate = nil;
    _messageInputTextView = nil;
    
    _voiceChangeButton = nil;
    _multiMediaSendButton = nil;
    _faceSendButton = nil;
    _holdDownButton = nil;

}

#pragma mark - Action

- (void)messageStyleButtonClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {
            //self.faceSendButton.selected = NO;
            //self.multiMediaSendButton.selected = NO;
            sender.selected = !sender.selected;
            
            if (sender.selected){
                NSLog(@"照片被点击的");// NSLog(@"声音被点击的");
                [self.messageInputTextView becomeFirstResponder];
                
            }else{
                NSLog(@"照片被点击结束");
                [self.messageInputTextView resignFirstResponder];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.holdDownButton.hidden =YES;
                self.messageInputTextView.hidden =YES;
            } completion:^(BOOL finished) {
                
            }];
            
//            if ([self.delegate respondsToSelector:@selector(didChangeSendVoiceAction:)]) {
//                [self.delegate didChangeSendVoiceAction:sender.selected];
//            }
            if ([self.delegate respondsToSelector:@selector(didSelectedPhotoViewAction:)]) {
                [self.delegate didSelectedPhotoViewAction:sender.selected];
            }
        }
            break;
        case 1:
        {
            //self.multiMediaSendButton.selected = NO;
           // self.voiceChangeButton.selected = YES;
            
            sender.selected = !sender.selected;
            if (sender.selected) {
                NSLog(@"表情被点击");
                [self.messageInputTextView resignFirstResponder];
            }else{
                NSLog(@"表情没被点击");
                [self.messageInputTextView becomeFirstResponder];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.holdDownButton.hidden = YES;
                self.messageInputTextView.hidden = YES;
            } completion:^(BOOL finished) {
                
            }];
            
            if ([self.delegate respondsToSelector:@selector(didSendFaceAction:)]) {
                [self.delegate didSendFaceAction:sender.selected];
            }
        }
            break;
        case 2:
        {
            //self.voiceChangeButton.selected = YES;
            //self.faceSendButton.selected = NO;
            
            sender.selected = !sender.selected;
            if (sender.selected) {
                NSLog(@"分享被点击");
                [self.messageInputTextView resignFirstResponder];
            }else{
                NSLog(@"分享没被点击");
                [self.messageInputTextView becomeFirstResponder];
            }

            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.holdDownButton.hidden = YES;
                self.messageInputTextView.hidden = YES;
            } completion:^(BOOL finished) {
                
            }];
            
            if ([self.delegate respondsToSelector:@selector(didSelectedMultipleMediaAction:)]) {
                [self.delegate didSelectedMultipleMediaAction:sender.selected];
            }
        }
            break;
        default:
            break;
    }
}


#pragma mark -语音功能
- (void)holdDownButtonTouchDown {
    if ([self.delegate respondsToSelector:@selector(didStartRecordingVoiceAction)]) {
        [self.delegate didStartRecordingVoiceAction];
    }
}

- (void)holdDownButtonTouchUpOutside {
    if ([self.delegate respondsToSelector:@selector(didCancelRecordingVoiceAction)]) {
        [self.delegate didCancelRecordingVoiceAction];
    }
}

- (void)holdDownButtonTouchUpInside {
    if ([self.delegate respondsToSelector:@selector(didFinishRecoingVoiceAction)]) {
        [self.delegate didFinishRecoingVoiceAction];
    }
}

#pragma end

#pragma mark - 添加控件
- (void)setupMessageInputViewBarWithStyle:(ZBMessageInputViewStyle )style{
    // 配置输入工具条的样式和布局
    
    // 水平间隔
   // CGFloat horizontalPadding = 8;
    
    // 垂直间隔
   // CGFloat verticalPadding = 5;
    
    // 按钮长,宽
    CGFloat buttonSize = [ZBMessageInputView textViewLineHeight];
    
    // 发送拍照
    self.takephotoButton = [self createButtonWithImage:[UIImage imageNamed:@"icon_keyword_photo"]
                                                 HLImage:nil];
    [self.takephotoButton setImage:[UIImage imageNamed:@"icon_keyword_photo"]
                            forState:UIControlStateSelected];
    [self.takephotoButton addTarget:self
                               action:@selector(messageStyleButtonClicked:)
                     forControlEvents:UIControlEventTouchUpInside];
    self.takephotoButton.tag = 0;
    self.takephotoButton.frame = CGRectMake(17,12,21,18);

    [self addSubview:self.takephotoButton];
    
    // @person
    self.takephotoButton = [self createButtonWithImage:[UIImage imageNamed:@"icon_keywordat"]
                                               HLImage:nil];
    [self.takephotoButton setImage:[UIImage imageNamed:@"icon_keywordat"]
                          forState:UIControlStateSelected];
    [self.takephotoButton addTarget:self
                             action:@selector(messageStyleButtonClicked:)
                   forControlEvents:UIControlEventTouchUpInside];
    self.takephotoButton.tag = 2;
    self.takephotoButton.frame = CGRectMake(17*2+21,12,18,19);
    
    [self addSubview:self.takephotoButton];
    
    // 发送表情
    self.faceSendButton = [self createButtonWithImage:[UIImage imageNamed:@"icon_keyword_face"]
                                              HLImage:nil];
    [self.faceSendButton setImage:[UIImage imageNamed:@"icon_keyword_face"]
                         forState:UIControlStateSelected];
    [self.faceSendButton addTarget:self
                            action:@selector(messageStyleButtonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    self.faceSendButton.tag = 1;
     self.faceSendButton.frame = CGRectMake(17*3+21+18,12,20,20);
    [self addSubview:self.faceSendButton];
    
    
    //
    // 初始化输入框
    ZBMessageTextView *textView = [[ZBMessageTextView alloc] initWithFrame:CGRectZero];
    textView.returnKeyType = UIReturnKeySend;
    textView.enablesReturnKeyAutomatically = YES; // UITextView内部判断send按钮是否可以用
    textView.placeHolder = @"发送新评论";
   
    textView.delegate = self;
    [self addSubview:textView];
	self.messageInputTextView = textView;
    self.messageInputTextView.hidden = !self.voiceChangeButton.selected;
    
    
    // 配置不同iOS SDK版本的样式
    switch (style)
    {
        case ZBMessageInputViewStyleQuasiphysical:
        {
            self.messageInputTextView.frame = CGRectMake(200,
                                                   3.0f,
                                                   80,
                                                   buttonSize);
            _messageInputTextView.backgroundColor = [UIColor whiteColor];
            
            break;
        }
        case ZBMessageInputViewStyleDefault:
        {
            self.messageInputTextView.frame = CGRectMake(200,4.5f,80,buttonSize);
            _messageInputTextView.backgroundColor = [UIColor clearColor];
            _messageInputTextView.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
            _messageInputTextView.layer.borderWidth = 0.65f;
            _messageInputTextView.layer.cornerRadius = 6.0f;
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - 添加控件
- (void)setupMessageInputViewBarWithStyle2:(ZBMessageInputViewStyle )style{
    // 配置输入工具条的样式和布局
    
    // 水平间隔
    CGFloat horizontalPadding = 8;
    
    // 垂直间隔
    CGFloat verticalPadding = 5;
    
    // 按钮长,宽
    CGFloat buttonSize = [ZBMessageInputView textViewLineHeight];
    
    // 发送语音
    self.voiceChangeButton = [self createButtonWithImage:[UIImage imageNamed:@"ToolViewKeyboard_ios7"]
                                                 HLImage:nil];
    [self.voiceChangeButton setImage:[UIImage imageNamed:@"ToolViewInputVoice_ios7"]
                            forState:UIControlStateSelected];
    [self.voiceChangeButton addTarget:self
                               action:@selector(messageStyleButtonClicked:)
                     forControlEvents:UIControlEventTouchUpInside];
    self.voiceChangeButton.tag = 0;
    
    [self addSubview:self.voiceChangeButton];
    self.voiceChangeButton.frame = CGRectMake(horizontalPadding,verticalPadding,buttonSize,buttonSize);
    
    
    // 允许发送多媒体消息，为什么不是先放表情按钮呢？因为布局的需要！
    self.multiMediaSendButton = [self createButtonWithImage:[UIImage imageNamed:@"TypeSelectorBtn_Black_ios7"]
                                                    HLImage:nil];
    [self.multiMediaSendButton addTarget:self
                                  action:@selector(messageStyleButtonClicked:)
                        forControlEvents:UIControlEventTouchUpInside];
    self.multiMediaSendButton.tag = 2;
    [self addSubview:self.multiMediaSendButton];
    self.multiMediaSendButton.frame = CGRectMake(self.frame.size.width - horizontalPadding - buttonSize,
                                                 verticalPadding,
                                                 buttonSize,
                                                 buttonSize);
    
    // 发送表情
    self.faceSendButton = [self createButtonWithImage:[UIImage imageNamed:@"ToolViewEmotion_ios7"]
                                              HLImage:nil];
    [self.faceSendButton setImage:[UIImage imageNamed:@"ToolViewKeyboard_ios7"]
                         forState:UIControlStateSelected];
    [self.faceSendButton addTarget:self
                            action:@selector(messageStyleButtonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    self.faceSendButton.tag = 1;
    [self addSubview:self.faceSendButton];
    self.faceSendButton.frame = CGRectMake(self.frame.size.width - 2*buttonSize- horizontalPadding -5,verticalPadding,buttonSize,buttonSize);
    
    
    // 如果是可以发送语言的，那就需要一个按钮录音的按钮，事件可以在外部添加
    self.holdDownButton = [self createButtonWithImage:[UIImage imageNamed:@"holdDownButton"] HLImage:nil];
    [self.holdDownButton addTarget:self action:@selector(holdDownButtonTouchDown) forControlEvents:UIControlEventTouchDown];
    [self.holdDownButton addTarget:self action:@selector(holdDownButtonTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
    [self.holdDownButton addTarget:self action:@selector(holdDownButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.holdDownButton];
    
    
    // 初始化输入框
    ZBMessageTextView *textView = [[ZBMessageTextView alloc] initWithFrame:CGRectZero];
    textView.returnKeyType = UIReturnKeySend;
    textView.enablesReturnKeyAutomatically = YES; // UITextView内部判断send按钮是否可以用
    textView.placeHolder = @"发送新评论";
    textView.delegate = self;
    [self addSubview:textView];
	self.messageInputTextView = textView;
    self.messageInputTextView.hidden = !self.voiceChangeButton.selected;
    
    
    // 配置不同iOS SDK版本的样式
    switch (style)
    {
        case ZBMessageInputViewStyleQuasiphysical:
        {
            self.holdDownButton.frame = CGRectMake(horizontalPadding + buttonSize +5.0f,
                                                     3.0f,
                                                     CGRectGetWidth(self.bounds)- 3*buttonSize -2*horizontalPadding- 15.0f,
                                                     buttonSize);
            _messageInputTextView.backgroundColor = [UIColor whiteColor];
            
            break;
        }
        case ZBMessageInputViewStyleDefault:
        {
            self.holdDownButton.frame = CGRectMake(horizontalPadding + buttonSize +5.0f,4.5f,CGRectGetWidth(self.bounds)- 3*buttonSize -2*horizontalPadding- 15.0f,buttonSize);
            _messageInputTextView.backgroundColor = [UIColor clearColor];
            _messageInputTextView.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
            _messageInputTextView.layer.borderWidth = 0.65f;
            _messageInputTextView.layer.cornerRadius = 6.0f;
    
            break;
        }
        default:
            break;
    }
    
    self.messageInputTextView.frame = self.holdDownButton.frame;

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - layout subViews UI
- (UIButton *)createButtonWithImage:(UIImage *)image HLImage:(UIImage *)hlImage {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [ZBMessageInputView textViewLineHeight], [ZBMessageInputView textViewLineHeight])];
    if (image)
        [button setBackgroundImage:image forState:UIControlStateNormal];
    if (hlImage)
        [button setBackgroundImage:hlImage forState:UIControlStateHighlighted];
    return button;
}
#pragma end

#pragma mark - Message input view

- (void)adjustTextViewHeightBy:(CGFloat)changeInHeight {
//    // 动态改变自身的高度和输入框的高度
//    CGRect prevFrame = self.messageInputTextView.frame;
//    
//    NSUInteger numLines = MAX([self.messageInputTextView numberOfLinesOfText],
//                              [self.messageInputTextView.text numberOfLines]);
//    
//    self.messageInputTextView.frame = CGRectMake(prevFrame.origin.x,
//                                          prevFrame.origin.y,
//                                          prevFrame.size.width,
//                                          prevFrame.size.height + changeInHeight);
//    
//    
//    self.messageInputTextView.contentInset = UIEdgeInsetsMake((numLines >= 6 ? 4.0f : 0.0f),
//                                                       0.0f,
//                                                       (numLines >= 6 ? 4.0f : 0.0f),
//                                                       0.0f);
//    
//    // from iOS 7, the content size will be accurate only if the scrolling is enabled.
//    self.messageInputTextView.scrollEnabled = YES;
//    
//    if (numLines >= 6) {
//        CGPoint bottomOffset = CGPointMake(0.0f, self.messageInputTextView.contentSize.height - self.messageInputTextView.bounds.size.height);
//        [self.messageInputTextView setContentOffset:bottomOffset animated:YES];
//        [self.messageInputTextView scrollRangeToVisible:NSMakeRange(self.messageInputTextView.text.length - 2, 1)];
//    }
}

+ (CGFloat)textViewLineHeight{
    return 36.0f ;// 字体大小为16
}

+ (CGFloat)maxHeight{
    return ([ZBMessageInputView maxLines] + 1.0f) * [ZBMessageInputView textViewLineHeight];
}

+ (CGFloat)maxLines{
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) ? 3.0f : 8.0f;
}
#pragma end

- (void)setup {
    // 配置自适应
    self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin);
    self.opaque = YES;
    // 由于继承UIImageView，所以需要这个属性设置
    self.userInteractionEnabled = YES;
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7 )
    {
        _messageInputViewStyle = ZBMessageInputViewStyleDefault;
        self.image = [[UIImage imageNamed:@"input-bar-flat"] resizableImageWithCapInsets:UIEdgeInsetsMake(2.0f, 0.0f, 0.0f, 0.0f)
                                                                            resizingMode:UIImageResizingModeStretch];
    }
    else
    {
        _messageInputViewStyle = ZBMessageInputViewStyleQuasiphysical;
        self.image = [[UIImage imageNamed:@"input-bar-background"] resizableImageWithCapInsets:UIEdgeInsetsMake(19.0f, 3.0f, 19.0f, 3.0f)
                                                                                  resizingMode:UIImageResizingModeStretch];
        
    }
    [self setupMessageInputViewBarWithStyle:_messageInputViewStyle];
}

#pragma mark - textViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
   
    if ([self.delegate respondsToSelector:@selector(inputTextViewWillBeginEditing:)])
    {
        [self.delegate inputTextViewWillBeginEditing:self.messageInputTextView];
    }
    self.faceSendButton.selected = NO;
    self.multiMediaSendButton.selected = NO;
   
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([self.delegate respondsToSelector:@selector(inputTextViewDidChange:)]) {
        [self.delegate inputTextViewDidChange:self.messageInputTextView];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [textView becomeFirstResponder];
    
    if ([self.delegate respondsToSelector:@selector(inputTextViewDidBeginEditing:)]) {
        [self.delegate inputTextViewDidBeginEditing:self.messageInputTextView];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        if ([self.delegate respondsToSelector:@selector(didSendTextAction:)]) {
            [self.delegate didSendTextAction:self.messageInputTextView];
        }
        return NO;
    }
    return YES;
}
#pragma end

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
