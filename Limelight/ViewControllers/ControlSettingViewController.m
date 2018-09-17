//
//  ControlSettingViewController.m
//  Moonlight
//
//  Created by Chun Kwon Park on 2018. 9. 17..
//  Copyright © 2018년 Moonlight Game Streaming Project. All rights reserved.
//

#import "ControlSettingViewController.h"
#import "DataManager.h"
#import "TemporarySettings.h"

@interface ControlSettingViewController ()

@end

@implementation ControlSettingViewController {
    ControllerSupport *_controllerSupport;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _streamConfig = [[StreamConfiguration alloc] init];
    
    DataManager* dataMan = [[DataManager alloc] init];
    TemporarySettings* streamSettings = [dataMan getSettings];
    
    _streamConfig.frameRate = [streamSettings.framerate intValue];
    _streamConfig.bitRate = [streamSettings.bitrate intValue];
    _streamConfig.height = [streamSettings.height intValue];
    _streamConfig.width = [streamSettings.width intValue];
    _streamConfig.streamingRemotely = streamSettings.streamingRemotely;
    _streamConfig.optimizeGameSettings = streamSettings.optimizeGames;
    _streamConfig.playAudioOnPC = streamSettings.playAudioOnPC;
    _streamConfig.allowHevc = streamSettings.useHevc;
    
    // multiController must be set before calling getConnectedGamepadMask
    _streamConfig.multiController = streamSettings.multiController;
    _streamConfig.gamepadMask = [ControllerSupport getConnectedGamepadMask:_streamConfig];
    
    // TODO: Detect attached surround sound system then address 5.1 TODOs
    // in Connection.m
    _streamConfig.audioChannelCount = 2;
    _streamConfig.audioChannelMask = 0x3;
     _controllerSupport = [[ControllerSupport alloc] initWithConfig:_streamConfig];
    [self connectionStarted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void) connectionStarted {
    [(StreamView*)self.view setupOnScreenControls: self->_controllerSupport swipeDelegate:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
