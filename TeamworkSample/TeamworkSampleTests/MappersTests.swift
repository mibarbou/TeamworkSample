//
//  TeamworkSampleTests.swift
//  TeamworkSampleTests
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import XCTest
@testable import TeamworkSample

class MappersTests: XCTestCase {
    
    let projectsJson: [String: Any] = UtilMock.readJson(fileName: "activeProjects")!
    let categoryEntry = CategoryEntry()
    let companyEntry = CompanyEntry()
    let expectedProjectEntry = ProjectEntry()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        companyEntry.id = "113332"
        companyEntry.name = "Cat"
        companyEntry.isOwner = "1"
        
        categoryEntry.id = "12345"
        categoryEntry.name = "category 1"
        categoryEntry.color = "ffffff"
        
        expectedProjectEntry.id = "339988"
        expectedProjectEntry.name = "Adamantium"
        expectedProjectEntry.desc = "some description text"
        expectedProjectEntry.logo = "https://s3.amazonaws.com/TWFiles/349705/projectLogo/tf_49AEF502-ED21-1A9D-87FAE9BD9D485267.dota22.jpg"
        expectedProjectEntry.status = "active"
        expectedProjectEntry.createdOn = "2017-01-03T21:49:20Z"
        expectedProjectEntry.startDate = "20140405"
        expectedProjectEntry.endDate = "20261025"
        expectedProjectEntry.company = companyEntry
        expectedProjectEntry.category = categoryEntry
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testProjectEntryMapper() {
        
        let apiStatusResponse = ApiResponse(json: projectsJson)
        XCTAssertEqual(apiStatusResponse?.status, "OK")
        
        let projectsResponse = ProjectsResponse(json: projectsJson)
        let projectResponse = projectsResponse!.projects!.first!
        let entry = ProjectEntryMapper.map(input: projectResponse)
        XCTAssertEqual(entry.id, expectedProjectEntry.id)
        XCTAssertEqual(entry.name, expectedProjectEntry.name)
        XCTAssertEqual(entry.desc, expectedProjectEntry.desc)
        XCTAssertEqual(entry.logo, expectedProjectEntry.logo)
        XCTAssertEqual(entry.status, expectedProjectEntry.status)
        XCTAssertEqual(entry.createdOn, expectedProjectEntry.createdOn)
        XCTAssertEqual(entry.startDate, expectedProjectEntry.startDate)
        XCTAssertEqual(entry.endDate, expectedProjectEntry.endDate)
        XCTAssertEqual(entry.company!.name, expectedProjectEntry.company!.name)
        XCTAssertEqual(entry.company!.id, expectedProjectEntry.company!.id)
        XCTAssertEqual(entry.company!.isOwner, expectedProjectEntry.company!.isOwner)
        XCTAssertEqual(entry.category!.id, expectedProjectEntry.category!.id)
        XCTAssertEqual(entry.category!.name, expectedProjectEntry.category!.name)
        XCTAssertEqual(entry.category!.color, expectedProjectEntry.category!.color)
    }
    
    func testProjectMapper() {
        let company = Company(id: "113332",
                              name: "Cat",
                              isOwner: true)
        let category = Category(id: "12345",
                                name: "category 1",
                                color: "ffffff")
        
        let expectedProject = Project(id: "339988",
                                      name: "Adamantium",
                                      description: "some description text",
                                      category: category,
                                      company: company,
                                      logo: URL(string: "https://s3.amazonaws.com/TWFiles/349705/projectLogo/tf_49AEF502-ED21-1A9D-87FAE9BD9D485267.dota22.jpg"),
                                      status: "active",
                                      createdOn: UtilDates.date(from: "2017-01-03T21:49:20Z"),
                                      startDate: UtilDates.date(timestampString: "20140405"),
                                      endDate: UtilDates.date(timestampString: "20261025"))
        let project = ProjectMapper.map(input: expectedProjectEntry)
        XCTAssertEqual(project.id, expectedProject.id)
        XCTAssertEqual(project.name, expectedProject.name)
        XCTAssertEqual(project.description, expectedProject.description)
        XCTAssertEqual(project.company!.name, expectedProject.company!.name)
        XCTAssertEqual(project.company!.id, expectedProject.company!.id)
        XCTAssertEqual(project.company!.isOwner, expectedProject.company!.isOwner)
        XCTAssertEqual(project.category!.name, expectedProject.category!.name)
        XCTAssertEqual(project.category!.id, expectedProject.category!.id)
        XCTAssertEqual(project.category!.color, expectedProject.category!.color)
        XCTAssertEqual(project.logo, expectedProject.logo)
        XCTAssertEqual(project.status, expectedProject.status)
        XCTAssertEqual(project.createdOn, expectedProject.createdOn)
        XCTAssertEqual(project.startDate, expectedProject.startDate)
        XCTAssertEqual(project.endDate, expectedProject.endDate)
    }
    
}

















