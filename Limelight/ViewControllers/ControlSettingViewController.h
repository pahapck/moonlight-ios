//
//  ControlSettingViewController.h
//  Moonlight
//
//  Created by Chun Kwon Park on 2018. 9. 17..
//  Copyright © 2018년 Moonlight Game Streaming Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StreamView.h"

@interface ControlSettingViewController : UIViewController<EdgeDetectionDelegate>

@property (nonatomic) StreamConfiguration* streamConfig;

@end
