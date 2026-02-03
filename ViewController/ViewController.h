//
//  ViewController.h
//  OCRBooster
//
//  Created by Karim Bouchaane on 31/01/2026.
//

#import <Cocoa/Cocoa.h>


/*
==> We declare the ViewController interface, which is a subclass of NSViewController
 */
@interface ViewController : NSViewController

@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSTextView *resultTextView;

- (IBAction)uploadImageClicked:(id)sender;
- (IBAction)extractTextClicked:(id)sender;

@end
