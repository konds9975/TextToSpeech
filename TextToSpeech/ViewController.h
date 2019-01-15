//
//  ViewController.h
//  TextToSpeech
//
//  Created by Mac Admin on 15/01/19.
//  Copyright © 2019 Mac Admin. All rights reserved.
//

//#import <UIKit/UIKit.h>
//#import <AVFoundation/AVFoundation.h>
//#import <QuartzCore/QuartzCore.h>
//@interface ViewController : UIViewController
//
//
//@end
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVSpeechSynthesizerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UITextView *textToSpeak;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;

@end
