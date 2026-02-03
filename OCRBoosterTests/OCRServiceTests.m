//
//  OCRServiceTests.m
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

#import <XCTest/XCTest.h>
#import "OCRService.h"

@interface OCRServiceTests : XCTestCase
@property (nonatomic, strong) OCRService *service;
@end

@implementation OCRServiceTests

- (void)setUp {
    [super setUp];
    self.service = [[OCRService alloc] init];
}

- (void)tearDown {
    self.service = nil;
    [super tearDown];
}

//This function text the OCR service's behavior when provided with a null image
- (void)testExtractTextWithNilImage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"OCR nil image"];

    [self.service extractTextFromImage:nil completion:^(NSString *result) {
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(result, @"Failed to read image.");
        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:2 handler:nil];
}

@end
