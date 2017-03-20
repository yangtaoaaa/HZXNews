//
//  UIImage+YZ.m
//  ez
//
//  Created by apple on 14-8-12.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import "UIImage+YZ.h"

@implementation UIImage (YZ)

+ (UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) { // 没有_os7后缀的图片
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    
    // 非iOS7
    return [UIImage imageNamed:name];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}
+ (UIImage *)ImageFromColor:(UIColor *)color WithRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

//截取部分图像, 自定义大小
-(UIImage *)getImageFromImage:(UIImage *)image toSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    HZXLog(@"截取图片=========%@", reSizeImage);
    return reSizeImage;
}

// 根据给定得图片，从其指定区域截取一张新得图片
-(UIImage *)getImageFromImage:(UIImage *)image{
    //大图bigImage
    //定义myImageRect，截图的区域
    CGRect myImageRect = CGRectMake(0, 0, 126, 70);
    CGImageRef imageRef = image.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect); // 根据范围截图
    UIGraphicsBeginImageContext(myImageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef]; // 得到新的图片
    UIGraphicsEndImageContext();
    return smallImage;
}

// 减掉多余的高度
-(UIImage *)getImageFromImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height imageHeight:(CGFloat)imageHeight{
    //大图bigImage
    //定义myImageRect，截图的区域
    CGRect myImageRect = CGRectMake(0, (imageHeight - height) / 2, width, height);
    CGImageRef imageRef = image.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect); // 根据范围截图
    UIGraphicsBeginImageContext(myImageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef]; // 得到新的图片
    UIGraphicsEndImageContext();
    return smallImage;
}
// 减掉多余的宽度
-(UIImage *)getImageFromImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height imageWidth:(CGFloat)imageWidth{
    //大图bigImage
    //定义myImageRect，截图的区域
    CGRect myImageRect = CGRectMake((imageWidth - width) / 2, 0, width, height);
    CGImageRef imageRef = image.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect); // 根据范围截图
    UIGraphicsBeginImageContext(myImageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef]; // 得到新的图片
    UIGraphicsEndImageContext();
    return smallImage;
}

// 以后就用这个方法了，先按照宽高比例压缩，在裁剪
- (UIImage *)resizeAndCutImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height{
    CGFloat imageScale = image.size.width / image.size.height;
    CGFloat viewScale = width / height;
    CGFloat widthScale = image.size.width / width;
    CGFloat heightScale = image.size.height / height;
    if(imageScale >= viewScale){ // 说明图片是[.......]这种
        CGFloat newWidth = image.size.width / heightScale;
        CGFloat newHeight = image.size.height / heightScale;
        UIImage *scaleImage = [self scaleImage:image width:newWidth height:newHeight];
//        HZXLog(@"[------]压缩之后的图片是=====%@, 宽度是%f, 高度是%f", scaleImage, newWidth, newHeight);
        // 减掉多余的高度
        UIImage *cutImage = [self getImageFromImage:scaleImage width:width height:height imageWidth:newWidth];
        return cutImage;
    }else{
        CGFloat newWidth = image.size.width / widthScale;
        CGFloat newHeight = image.size.height / widthScale;
        UIImage *scaleImage = [self scaleImage:image width:newWidth height:newHeight];
//        HZXLog(@"压缩之后的图片是=====%@, 宽度是%f, 高度是%f", scaleImage, newWidth, newHeight);
        // 减掉多余的宽度
        UIImage *cutImage = [self getImageFromImage:scaleImage width:width height:height imageHeight:newHeight];
        return cutImage;
    }
}

// 按压缩比例
- (UIImage *)scaleImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height{
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image drawInRect:CGRectMake(0, 0, width, height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end







