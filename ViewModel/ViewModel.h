//
//  ViewModel.h
//  OCRBooster
//
//  Created by Karim Bouchaane on 31/01/2026.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface ViewModel : NSObject

// this is the method that will run the OCR process
- (void)runOCRWithImage:(NSImage *)image completion:(void (^)(NSString *result))completion;

@end
