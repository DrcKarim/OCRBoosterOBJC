//
//  ViewModelTests.m
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

#import <XCTest/XCTest.h>
#import "ViewModel.h"

@interface ViewModelTests : XCTestCase
@property (nonatomic, strong) ViewModel *viewModel;
@end

@implementation ViewModelTests

- (void)setUp {
    [super setUp];
    self.viewModel = [[ViewModel alloc] init];
}

- (void)tearDown {
    self.viewModel = nil;
    [super tearDown];
}
//Here we test that the ViewModel correctly handles a null image input for the OCR service
- (void)testRunOCRWithNilImage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"OCR completion called"];

    [self.viewModel runOCRWithImage:nil completion:^(NSString *result) {
        XCTAssertNotNil(result);
        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:2 handler:nil];
}

@end
