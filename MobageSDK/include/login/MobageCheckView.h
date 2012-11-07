//
//  MobageCheckView.h
//  MyNativeTest
//
//  Created by panzaofeng on 10/22/12.
//
//

#import <UIKit/UIKit.h>

@interface MobageCheckView : UIView
{
    UILabel *sandboxLabel;
    UIActivityIndicatorView *webViewActivity;
    UIImageView *imageView;
}

@property (nonatomic, retain) UILabel *sandboxLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIActivityIndicatorView *webViewActivity;

@end
