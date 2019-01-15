//
//  ViewController.m
//  TextToSpeech
//
//  Created by Mac Admin on 15/01/19.
//  Copyright © 2019 Mac Admin. All rights reserved.
//

//#import "ViewController.h"
//
//@interface ViewController ()
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//
//    NSString *str = @"Hello friend, how are you?";
//
//    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
//    AVSpeechUtterance *speechutt = [AVSpeechUtterance speechUtteranceWithString:str];
//    speechutt.volume=100.0f;
//    speechutt.rate=50.0f;
//
//    speechutt.pitchMultiplier=50.0f;
//    [speechutt setRate:0.4f];
//    speechutt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"];
//    [synthesizer speakUtterance:speechutt];
//
//}
//
//
//
//@end

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

BOOL speechPaused = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    speechPaused = NO;
    self.synthesizer.delegate = self;
}

- (IBAction)playPauseButtonPressed:(UIButton *)sender {
    [self.textToSpeak resignFirstResponder];
    if (speechPaused == NO) {
        [self.playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.synthesizer continueSpeaking];
        speechPaused = YES;
    } else {
        [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
        speechPaused = NO;
        [self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
    if (self.synthesizer.speaking == NO) {
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.textToSpeak.text];
        //utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"];
        [self.synthesizer speakUtterance:utterance];
    }
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
    speechPaused = NO;
    NSLog(@"Playback finished");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
