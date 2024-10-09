//
//  MoviesAppUITests.swift
//  MoviesAppUITests
//
//  Created by Work on 10/4/24.
//

import XCTest
import UIKit
import SwiftUI
@testable import MoviesApp
@testable import MoviesAppTests

final class MoviesAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        super.tearDown()
    }

    func testContentViewLaunches() throws {
        app.launch()
        XCTAssertTrue(app.otherElements["ContentView"].exists)
    }

    func testHomeBarNavigationLaunches() throws {
        app.launch()
        XCTAssertTrue(app.tabBars.buttons["Home"].exists)
    }

    func testHomeScreenLaunches() throws {
        app.launch()
        XCTAssertTrue(app.otherElements["HomeScreen"].exists)
    }

    func testMoviesMenuLaunches() throws {
        app.launch()
        XCTAssertTrue(app.scrollViews["MediaList"].exists)
    }

    func testPopularMediaSponsorLaunches() throws{
        app.launch()
        XCTAssertTrue(app.staticTexts["TV Shows"].exists)
    }

    func testMovieViewDisplaysCorrectly() throws{
        app.launch()
        app.tabBars.buttons["Home"].tap()
        XCTAssertTrue(app.scrollViews.children(matching: .any).element(boundBy: 0).exists)
    }

    func testPopularMediaSponsorLoadsImage() throws{
        app.launch()
        app.tabBars.buttons["Home"].tap()
        let movieImage = app.images["NetflixLogo"]
        XCTAssertTrue(movieImage.exists)
    }

    func testPlayButtonExists() throws {
        app.launch()
        let playButton = app.buttons["Play"]
        XCTAssertTrue(playButton.exists, "The 'Play' button is not being displayed.")
    }

    func testPlayButtonInteraction() throws {
        app.launch()
        let playButton = app.buttons["Play"]
        playButton.tap()
        let alertButton = app.buttons["PlayAlertButton"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: alertButton, handler: nil)
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(alertButton.exists, "The alert is not displayed after pressing 'Play'.")
    }

    func testMovieTitleExists() throws {
        app.launch()
        let movieTitle = app.otherElements["SponsorMovieTitle"]
        XCTAssertTrue(movieTitle.exists, "The movie title is not being displayed.")
    }
    
    func testTVShowsLabelExists() throws {
        app.launch()
        let tvShowsLabel = app.staticTexts["TV Shows"]
        XCTAssertTrue(tvShowsLabel.exists, "The text 'TV Shows' is not being displayed.")
    }
    
    func testNetflixLogoExists() throws {
        app.launch()
        let netflixLogo = app.images["NetflixLogo"]
        XCTAssertTrue(netflixLogo.exists, "The Netflix logo is not being displayed.")
    }
    
}
