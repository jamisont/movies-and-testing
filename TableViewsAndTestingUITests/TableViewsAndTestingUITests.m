//
//  TableViewsAndTestingUITests.m
//  TableViewsAndTestingUITests
//
//  Created by Tatiana Jamison on 10/22/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TableViewsAndTestingUITests : XCTestCase

@end

@implementation TableViewsAndTestingUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTableViewCells
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    
    XCTAssertEqual(tablesQuery.count, 1);
    
    XCTAssertEqual(app.tables.cells.count, 3);
    
    XCUIElement *elementOfFirstCell = [tablesQuery.staticTexts matchingIdentifier:@"movieIdentifier_0"].element;
    XCTAssertEqualObjects(elementOfFirstCell.label, @"Back to the Future");
    
    XCUIElement *elementOfSecondCell = [tablesQuery.staticTexts matchingIdentifier:@"movieIdentifier_1"].element;
    XCTAssertEqualObjects(elementOfSecondCell.label, @"Back to the Future II");
    
    XCUIElement *elementOfThirdCell = [tablesQuery.staticTexts matchingIdentifier:@"movieIdentifier_2"].element;
    XCTAssertEqualObjects(elementOfThirdCell.label, @"Back to the Future III");
}

- (void)testLabelContents
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    
    // go to view presenting the description of "Back to the Future"
    [tablesQuery.staticTexts[@"Back to the Future"] tap];
    
    XCUIElement *elementOfLabel = [app.staticTexts matchingIdentifier:@"labelMovieDescription"].element;
    XCTAssertEqualObjects(elementOfLabel.label, @"88 mph");
    XCTAssertEqualObjects(app.navigationBars.staticTexts.element.label, @"Back to the Future");
    

    
    // all done testing this view, return to parent view
    [[[[app.navigationBars[@"Back to the Future"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    // in parent view, click next movie title
    // [tablesQuery.staticTexts[@"Back to the Future II"] tap];
    [[tablesQuery.staticTexts matchingIdentifier:@"Back to the Future II"].element tap];
    
    // elementOfLabel = [app.staticTexts matchingIdentifier:@"labelMovieDescription"].element;
    XCTAssertEqualObjects(elementOfLabel.label, @"where we're going, we don't need roads");
    XCTAssertEqualObjects(app.navigationBars.staticTexts.element.label, @"Back to the Future II");

    
    // all done testing this view, return to parent view
    [[[[app.navigationBars[@"Back to the Future II"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    // in parent view, click next movie title
    [tablesQuery.staticTexts[@"Back to the Future III"] tap];
    
    // elementOfLabel = [app.staticTexts matchingIdentifier:@"labelMovieDescription"].element;
    XCTAssertEqualObjects(elementOfLabel.label, @"now in the past");
    XCTAssertEqualObjects(app.navigationBars.staticTexts.element.label, @"Back to the Future III");

    
}

@end
