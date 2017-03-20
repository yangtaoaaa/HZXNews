//
//  ZBFaceView.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "ZBFaceView.h"

#define NumPerLine 7
#define Lines    3
#define FaceSize  24
/*
** 两边边缘间隔
 */
#define EdgeDistance 20
/*
 ** 上下边缘间隔
 */
#define EdgeInterVal 5

@implementation ZBFaceView

- (id)initWithFrame:(CGRect)frame forIndexPath:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        // 水平间隔
        CGFloat horizontalInterval = (CGRectGetWidth(self.bounds)-NumPerLine*FaceSize -2*EdgeDistance)/(NumPerLine-1);
        // 上下垂直间隔
        CGFloat verticalInterval = (CGRectGetHeight(self.bounds)-2*EdgeInterVal -Lines*FaceSize)/(Lines-1);
        
        //NSLog(@"%f,%f",verticalInterval,CGRectGetHeight(self.bounds));
        
        for (int i = 0; i<Lines; i++)
        {
            for (int x = 0;x<NumPerLine;x++)
            {
                UIButton *expressionButton =[UIButton buttonWithType:UIButtonTypeCustom];
                [self addSubview:expressionButton];
                [expressionButton setFrame:CGRectMake(x*FaceSize+EdgeDistance+x*horizontalInterval,
                                                      i*FaceSize +i*verticalInterval+EdgeInterVal,
                                                      FaceSize,
                                                      FaceSize)];
                
                if (i*7+x+1 ==21) {
                    [expressionButton setBackgroundImage:[UIImage imageNamed:@"DeleteEmoticonBtn_ios7.png"]
                                                forState:UIControlStateNormal];
                    expressionButton.tag = 0;
        
                }else{
                    NSString *imageStr = [NSString stringWithFormat:@"emoji_%ld.png",index*20+i*7+x+1];
                    //FDLog(@"图片名字:%@", imageStr);
                    [expressionButton setBackgroundImage:[UIImage imageNamed:imageStr]
                                                forState:UIControlStateNormal];
                    expressionButton.tag = 20*index+i*7+x+1;
                }
                [expressionButton addTarget:self
                                     action:@selector(faceClick:)
                           forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    return self;
}

- (void)faceClick:(UIButton *)button{
    
    NSString *faceName;
    BOOL isDelete;
    if (button.tag ==0){
        faceName = nil;
        isDelete = YES;
    }else{
        NSString *expressstring = [NSString stringWithFormat:@"emoji_%ld.png",button.tag];
        NSString *plistStr = [[NSBundle mainBundle]pathForResource:@"expression" ofType:@"plist"];
        NSDictionary *plistDic = [[NSDictionary  alloc]initWithContentsOfFile:plistStr];
        
        //FDLog(@"plist文件:%@", plistStr);
        for (int j = 0; j<[[plistDic allKeys]count]-1; j++)
        {
            if ([[plistDic objectForKey:[[plistDic allKeys]objectAtIndex:j]]
                 isEqualToString:[NSString stringWithFormat:@"%@",expressstring]])
            {
                faceName = [[plistDic allKeys]objectAtIndex:j];
            }
        }
        isDelete = NO;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelecteFace:andIsSelecteDelete:)]) {
        [self.delegate didSelecteFace:faceName andIsSelecteDelete:isDelete];
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
