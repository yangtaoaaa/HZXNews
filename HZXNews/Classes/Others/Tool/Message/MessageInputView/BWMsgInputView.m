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

#import "BWMsgInputView.h"
#import "Client.h"
//#import "NSString+Message.h"

@interface BWMsgInputView()<UITextViewDelegate>
{
    NSInteger KeyTagValue;
}


@property (nonatomic, weak, readwrite) ZBMessageTextView *messageInputTextView;

//@property (nonatomic, weak, readwrite) UIButton *takephotoButton;
//
//@property (nonatomic, weak, readwrite) UIButton *atpersonButton;
//
//
//@property (nonatomic, weak, readwrite) UIButton *voiceChangeButton;
//
//@property (nonatomic, weak, readwrite) UIButton *multiMediaSendButton;

@property (nonatomic, weak, readwrite) UIButton *faceSendButton;

//@property (nonatomic, weak, readwrite) UIButton *holdDownButton;

@property (nonatomic, copy) NSString *inputedText;


@end

@implementation BWMsgInputView

- (void)dealloc{
    _messageInputTextView.delegate = nil;
    _messageInputTextView = nil;
    _faceSendButton=nil;
//    _voiceChangeButton = nil;
//    _multiMediaSendButton = nil;
//    _faceSendButton = nil;
//    _holdDownButton = nil;

}

#pragma mark - Action

- (void)messageStyleButtonClicked:(UIButton *)sender {
    BOOL ret=[Client sendMsgKeyShow];
    if(ret)
    {
        //self.takephotoButton.selected=NO;
        self.faceSendButton.selected=NO;
        //self.atpersonButton.selected=NO;
        KeyTagValue=0;
    }
    switch (sender.tag) {
        case 1:
        {
            //self.multiMediaSendButton.selected = NO;
           // self.voiceChangeButton.selected = YES;
            
            sender.selected = !sender.selected;
            
            BOOL isShouldOpen=FALSE;
            if(KeyTagValue==0 && sender.selected)
            {
                isShouldOpen=TRUE;
            }
            else if(KeyTagValue==4||KeyTagValue==8)
            {
                isShouldOpen=TRUE;
            }
            
            if(isShouldOpen)
            {
               // self.takephotoButton.selected=NO;
              //  self.atpersonButton.selected=NO;
            }
            
            if (sender.selected) {
                NSLog(@"表情被点击");
                 KeyTagValue=2;// 010; 二进制
                [self.messageInputTextView resignFirstResponder];
            }else{
                NSLog(@"表情没被点击");
                 KeyTagValue=0;// 0
                [self.messageInputTextView becomeFirstResponder];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
              //  self.holdDownButton.hidden = YES;
                self.messageInputTextView.hidden = NO;
            } completion:^(BOOL finished) {
                
            }];
            

            if ([self.delegate respondsToSelector:@selector(didSendFaceAction:)]) {
                [self.delegate didSendFaceAction:isShouldOpen];
            }
        }
              default:
            break;
    }
}


#pragma end

#pragma mark - 添加控件
- (void)setupMessageInputViewBarWithStyle:(BWMsgInputViewStyle )style{
    // 配置输入工具条的样式和布局
    
    // 水平间隔
   // CGFloat horizontalPadding = 8;
    
    // 垂直间隔
   // CGFloat verticalPadding = 5;
    
    // 按钮长,宽
    CGFloat buttonSize = [BWMsgInputView textViewLineHeight];
    
    // 发送表情
//    self.faceSendButton = [self createButtonWithImage:[UIImage imageNamed:@"icon_keyword_face"]
//                                              HLImage:nil];
//    [self.faceSendButton setImage:[UIImage imageNamed:@"icon_keyword_face"]
//                         forState:UIControlStateSelected];
//    [self.faceSendButton addTarget:self
//                            action:@selector(messageStyleButtonClicked:)
//                  forControlEvents:UIControlEventTouchUpInside];
//    self.faceSendButton.tag = 1;
//    self.faceSendButton.frame = CGRectMake(15,12,21,18);
//    [self addSubview:self.faceSendButton];
    

    self.faceSendButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.faceSendButton setImage:[UIImage imageNamed:@"icon_keyword_face"] forState:UIControlStateNormal];
    [self.faceSendButton setFrame:CGRectMake(15,12,21,18)];
    [self.faceSendButton addTarget:self
                action:@selector(messageStyleButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
     self.faceSendButton.tag=1;
    [self addSubview:self.faceSendButton];
    
    

    UIButton *sendbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [sendbtn setImage:[UIImage imageNamed:@"icon_sendbtnbg"] forState:UIControlStateNormal];
    [sendbtn setFrame:CGRectMake(271, 7, 40, 30)];
    [sendbtn addTarget:self
                            action:@selector(sendMsg:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:sendbtn];
    
    
    //
    // 初始化输入框
    ZBMessageTextView *textView = [[ZBMessageTextView alloc] initWithFrame:CGRectZero];
    textView.returnKeyType = UIReturnKeySend;
    textView.enablesReturnKeyAutomatically = YES; // UITextView内部判断send按钮是否可以用
    textView.placeHolder = @"写点什么";
   
    textView.delegate = self;
    [self addSubview:textView];
	self.messageInputTextView = textView;
    //self.messageInputTextView.hidden = !self.voiceChangeButton.selected;
    
    
    // 配置不同iOS SDK版本的样式
    switch (style)
    {
        case BWMsgInputViewStyleQuasiphysical:
        {
            self.messageInputTextView.frame = CGRectMake(48,
                                                   3.0f,
                                                   215,
                                                   buttonSize);
            _messageInputTextView.backgroundColor = [UIColor whiteColor];
            
            break;
        }
        case BWMsgInputViewStyleDefault:
        {
            self.messageInputTextView.frame = CGRectMake(48,4.5f,215,buttonSize);
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

-(IBAction)sendMsg:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didSendTextAction:)]) {
        [self.delegate didSendTextAction:self.messageInputTextView];
    }
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
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [BWMsgInputView textViewLineHeight], [BWMsgInputView textViewLineHeight])];
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
    return ([BWMsgInputView maxLines] + 1.0f) * [BWMsgInputView textViewLineHeight];
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
        _messageInputViewStyle = BWMsgInputViewStyleDefault;
        self.image = [[UIImage imageNamed:@"input-bar-flat"] resizableImageWithCapInsets:UIEdgeInsetsMake(2.0f, 0.0f, 0.0f, 0.0f)
                                                                            resizingMode:UIImageResizingModeStretch];
    }
    else
    {
        _messageInputViewStyle = BWMsgInputViewStyleQuasiphysical;
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
    //self.multiMediaSendButton.selected = NO;
   
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
