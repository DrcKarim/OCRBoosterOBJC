//
//  ViewModel.m
//  OCRBooster
//
//  Created by Karim Bouchaane on 31/01/2026.
//

#import "ViewModel.h"
#import "OCRService.h"

@interface ViewModel ()
@property (strong) OCRService *ocrService;
@end

@implementation ViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _ocrService = [[OCRService alloc] init];
    }
    return self;
}

/*
 We call this method to run OCR on the provided image
 */
- (void)runOCRWithImage:(NSImage *)image completion:(void (^)(NSString *result))completion {
    [self.ocrService extractTextFromImage:image completion:completion];
}

@end
