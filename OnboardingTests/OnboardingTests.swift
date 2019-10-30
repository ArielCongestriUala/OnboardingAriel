//
//  OnboardingTests.swift
//  OnboardingTests
//
//  Created by Ariel Congestri on 29/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import XCTest
@testable import Onboarding

class OnboardingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testShowCellConfiguration() {
        let show = Show(id: 1, name: "ABCD", summary: nil, rating: Rating(average: 10.0), imageURL: ImageURL(original: "original", medium: "medium"))
        let configuration = ShowCellConfiguration(from: show)
        XCTAssertEqual(configuration.name, show.name)
        XCTAssertEqual(configuration.rating, "10.0")
        XCTAssertEqual(configuration.image, show.image?.medium)

        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout())
        collectionView.register(UINib(nibName: "ShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShowCell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCell", for: IndexPath(row: 0, section: 0)) as? ShowCollectionViewCell
        cell?.configureWith(configuration)
        XCTAssertEqual(configuration.name, cell?.name.text)
        XCTAssertEqual(configuration.rating, cell?.rating.text)
    }
}
