//
//  ViewController.m
//  OCRBooster
//
//  Created by Karim Bouchaane on 31/01/2026.
//

#import "ViewController.h"
#import "ViewModel.h"
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h>

/*
 This is an interface ViewController class
 to declare private properties.
 */
@interface ViewController ()

@property (strong) NSImage *selectedImage;
@property (strong) ViewModel *viewModel;

@end


/*
 This is the implimentation
 of ViewController class
 */
@implementation ViewController

#pragma mark - Lifecycle


/*
 This method is called after the
 view has been loaded into memory
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[ViewModel alloc] init];
    self.resultTextView.string = @"Upload an image to start OCR.";
}

#pragma mark - Actions


/*
 THis is the action method for
 the "Upload Image" button
 */
- (IBAction)uploadImageClicked:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];

    panel.allowedContentTypes = @[
        UTTypePNG,
        UTTypeJPEG,
        UTTypeTIFF
    ];
    panel.allowsMultipleSelection = NO;

    if ([panel runModal] == NSModalResponseOK) {
        NSURL *imageURL = panel.URL;
        self.selectedImage = [[NSImage alloc] initWithContentsOfURL:imageURL];
        self.imageView.image = self.selectedImage;
        self.resultTextView.string = @"Image loaded. Click 'Extract Text'.";
    }
}


/*
This is the action method of the "Extract Text"
 Button that send the selected image to the ViewModel for OCR proccesing
 */
- (IBAction)extractTextClicked:(id)sender {
    if (!self.selectedImage) {
        self.resultTextView.string = @"Please upload an image first.";
        return;
    }
    self.resultTextView.string = @"Extracting text...";

    __weak typeof(self) weakSelf = self;
    
    [self.viewModel runOCRWithImage:self.selectedImage completion:^(NSString *result) {
        
        dispatch_async(dispatch_get_main_queue(), ^{  weakSelf.resultTextView.string = result; });
    }];
}

@end

