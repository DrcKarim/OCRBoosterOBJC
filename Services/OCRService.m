//
//  Services.m
//  OCRBooster
//
//  Created by Karim Bouchaane on 31/01/2026.
//

#import "OCRService.h"
#import <Vision/Vision.h>

@implementation OCRService

/*
 This is the function the core of our OCR service that uses Vision framwework to extract text from an image
 it called by the ViewModel, which is called by the ViewController when the user requests OCR on an image
 How it works: it take image as an input and the callback completion handler to return the extracted text
 */
- (void)extractTextFromImage:(NSImage *)image completion:(void (^)(NSString *result))completion {

    CGImageRef cgImage = [image CGImageForProposedRect:NULL context:nil hints:nil];

    if (!cgImage) { //only to test if the image is null
        completion(@"Failed to read image.");
        return;
    }
    //Create a new request to recongnize text from the image
    VNRecognizeTextRequest *request = [[VNRecognizeTextRequest alloc] initWithCompletionHandler:
     ^(VNRequest *request, NSError *error) {

        NSMutableString *finalText = [NSMutableString string];

        for (VNRecognizedTextObservation *obs in request.results) {
            NSArray<VNRecognizedText *> *candidates = [obs topCandidates:1];
            VNRecognizedText *text = candidates.firstObject;

            if (text) {
                [finalText appendFormat:@"%@\n", text.string];
            }
        }
        //Call the comppletion handler with the extracted text
        completion(finalText);
    }];
    //Configure the request parameters
    request.recognitionLevel = VNRequestTextRecognitionLevelAccurate;
    request.usesLanguageCorrection = YES;
    //Create a request handler to process the image
    VNImageRequestHandler *handler = [[VNImageRequestHandler alloc] initWithCGImage:cgImage options:@{}];
    //Perform the text recognition request on the image
    [handler performRequests:@[request] error:nil];
}

@end
