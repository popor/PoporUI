/*
 Copyright (c) 2009 Ole Begemann
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

/*
 UIImage+ColorAtPixel.m
 
 Created by Ole Begemann
 October, 2009
 */

#import "UIImage+pColorAtPixel.h"

#import <CoreGraphics/CoreGraphics.h>

@implementation UIImage (pColorAtPixel)

/*
 Returns the color of the image pixel at point. Returns nil if point lies outside the image bounds.
 If the point coordinates contain decimal parts, they will be truncated.
 
 To get at the pixel data, this method must draw the image into a bitmap context.
 For minimal memory usage and optimum performance, only the specific requested
 pixel is drawn.
 If you need to query pixel colors for the same image repeatedly (e.g., in a loop),
 this approach is probably less efficient than drawing the entire image into memory
 once and caching it.
 */
- (UIColor *)colorAtPixel:(CGPoint)point {
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    
    
    // Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
    // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
    NSInteger  pointX  = trunc(point.x);// 取整.
    NSInteger  pointY  = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width   = self.size.width;
    NSUInteger height  = self.size.height;
    
    NSInteger  bytesPerPixel    = 4;
    NSInteger  bytesPerRow      = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4]  = { 0, 0, 0, 0 };
    
    CGColorSpaceRef colorSpace  = CGColorSpaceCreateDeviceRGB();
    CGContextRef    context     = CGBitmapContextCreate(pixelData,
                                                        1,
                                                        1,
                                                        bitsPerComponent,
                                                        bytesPerRow,
                                                        colorSpace,
                                                        kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);

    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor *)averageColorXGap:(NSInteger)xGap yGap:(NSInteger)yGap {
    if (self.size.width == 0) {
        return nil;
    }
    if (xGap <= 0) {
        xGap = 20;
    }
    if (yGap <= 0) {
        yGap = 20;
    }
    NSInteger  pointX    = 0;
    NSInteger  pointY    = 0;
    CGImageRef cgImage   = self.CGImage;
    NSInteger  maxWidth  = self.size.width;
    NSInteger  maxHeight = self.size.height;
    CGSize     size      = self.size;
    
    CGFloat red   = 0;
    CGFloat green = 0;
    CGFloat blue  = 0;
    CGFloat alpha = 0;
    
    NSInteger count = 0;
    
    NSInteger  bytesPerPixel    = 4;
    NSInteger  bytesPerRow      = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4]  = { 0, 0, 0, 0 };
    
    for     (pointX = 0; pointX<maxWidth;  pointX += xGap) {
        for (pointY = 0; pointY<maxHeight; pointY += yGap) {
            count ++;
            NSLog(@"count: %li", (long)count);
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGContextRef    context    = CGBitmapContextCreate(pixelData,
                                                               1,
                                                               1,
                                                               bitsPerComponent,
                                                               bytesPerRow,
                                                               colorSpace,
                                                               kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
            CGColorSpaceRelease(colorSpace);
            CGContextSetBlendMode(context, kCGBlendModeCopy);
            
            // Draw the pixel we are interested in onto the bitmap context
            CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)maxHeight);
            CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)maxWidth, (CGFloat)maxHeight), cgImage);
            CGContextRelease(context);
            
            // Convert color values [0..255] to floats [0.0..1.0]
            red   += pixelData[0];
            green += pixelData[1];
            blue  += pixelData[2];
            alpha += pixelData[3];
        }
    }
    
    //CGColorSpaceRelease(colorSpace);
    //CGContextRelease(context);
    
    red   = red   / count;
    green = green / count;
    blue  = blue  / count;
    alpha = alpha / count;
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha/255.0f];
}

@end
