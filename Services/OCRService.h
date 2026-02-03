//
//  Services.h
//  OCRBooster
//
//  Created by Karim Bouchaane on 31/01/2026.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

//Interface with the OCR service method
@interface OCRService : NSObject

- (void)extractTextFromImage:(NSImage *)image completion:(void (^)(NSString *result))completion;

@end
