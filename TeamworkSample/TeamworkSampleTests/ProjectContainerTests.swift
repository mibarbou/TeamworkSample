//
//  ProjectContainerTests.swift
//  TeamworkSampleTests
//
//  Created by Michel Barbou Salvador on 22/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import XCTest
@testable import TeamworkSample

class ProjectContainerTests: XCTestCase {
    
    let container = ProjectContainer(testName: "teamworkTest")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        container.deleteAll()
        super.tearDown()
    }
    
    func testSaveEntries() {
        container.save(projects: getEntriesArray())
        let projectsCount = container.projectsCount()
        XCTAssertEqual(projectsCount, 3)
        let companiesCount = container.companiesCount()
        XCTAssertEqual(companiesCount, 2)
    }

    func testGetAllProjects() {
        container.save(projects: getEntriesArray())
        let projectsCount = container.projectsCount(status: .all)
        XCTAssertEqual(projectsCount, 3)
    }

    func testGetActiveProjects() {
        container.save(projects: getEntriesArray())
        let activeProjectsCount = container.projectsCount(status: .active)
        XCTAssertEqual(activeProjectsCount, 2)
    }

    func testGetArchivedProjects() {
        container.save(projects: getEntriesArray())
        let archivedProjectsCount = container.projectsCount(status: .archived)
        XCTAssertEqual(archivedProjectsCount, 1)
    }
    
    func testGetProjectAtIndexPath() {
        container.save(projects: getEntriesArray())
        let indexPath1 = IndexPath(row: 1, section: 0)
        let project2 = container.projectAt(indexPath: indexPath1)
        XCTAssertEqual(project2.id, "2")
        
        let indexPath2 = IndexPath(row: 0, section: 1)
        let project3 = container.projectAt(indexPath: indexPath2)
        XCTAssertEqual(project3.id, "3")
    }
    
    func testGetProjectsCountAtIndex() {
        container.save(projects: getEntriesArray())
        XCTAssertEqual(container.projectsCountAt(index: 0), 2)
        XCTAssertEqual(container.projectsCountAt(index: 1), 1)
    }
    
    func testSaveUpdates() {
        container.save(projects: getEntriesArray())
        container.save(projects: getEntriesArray())
        let projectsCount = container.projectsCount(status: .all)
        XCTAssertEqual(projectsCount, 3)
    }
    
    func testCompanyNameAtIndex() {
        container.save(projects: getEntriesArray())
        let companyName1 = container.companyNameAt(index: 0)
        XCTAssertEqual(companyName1, "Company 1")
        let companyName2 = container.companyNameAt(index: 1)
        XCTAssertEqual(companyName2, "Company 3")
    }
}



extension ProjectContainerTests {
    
    func getEntriesArray() -> [ProjectEntry] {
        let categoryEntry1 = CategoryEntry()
        let companyEntry1 = CompanyEntry()
        let projectEntry1 = ProjectEntry()
        let categoryEntry2 = CategoryEntry()
        let companyEntry2 = CompanyEntry()
        let projectEntry2 = ProjectEntry()
        let categoryEntry3 = CategoryEntry()
        let companyEntry3 = CompanyEntry()
        let projectEntry3 = ProjectEntry()
        
        companyEntry1.id = "1"
        companyEntry1.name = "Company 1"
        companyEntry1.isOwner = "1"
        
        categoryEntry1.id = "1"
        categoryEntry1.name = "Category 1"
        categoryEntry1.color = "ffffff"
        
        projectEntry1.id = "1"
        projectEntry1.name = "Adamantium"
        projectEntry1.desc = "some description text"
        projectEntry1.logo = "https://s3.amazonaws.com/TWFiles/349705/projectLogo/tf_49AEF502-ED21-1A9D-87FAE9BD9D485267.dota22.jpg"
        projectEntry1.status = "active"
        projectEntry1.createdOn = "2017-01-03T21:49:20Z"
        projectEntry1.startDate = "20140405"
        projectEntry1.endDate = "20261025"
        projectEntry1.company = companyEntry1
        projectEntry1.category = categoryEntry1
        
        companyEntry2.id = "1"
        companyEntry2.name = "Company 1"
        companyEntry2.isOwner = "0"
        
        categoryEntry2.id = "2"
        categoryEntry2.name = "Category 2"
        categoryEntry2.color = "ffffff"
        
        projectEntry2.id = "2"
        projectEntry2.name = "Badamantium"
        projectEntry2.desc = "some description text"
        projectEntry2.logo = "https://s3.amazonaws.com/TWFiles/349705/projectLogo/tf_49AEF502-ED21-1A9D-87FAE9BD9D485267.dota22.jpg"
        projectEntry2.status = "archived"
        projectEntry2.createdOn = "2017-01-03T21:49:20Z"
        projectEntry2.startDate = "20140405"
        projectEntry2.endDate = "20261025"
        projectEntry2.company = companyEntry2
        projectEntry2.category = categoryEntry2
        
        companyEntry3.id = "3"
        companyEntry3.name = "Company 3"
        companyEntry3.isOwner = "1"
        
        categoryEntry3.id = "3"
        categoryEntry3.name = "Category 3"
        categoryEntry3.color = "ffffff"
        
        projectEntry3.id = "3"
        projectEntry3.name = "Zadamantium"
        projectEntry3.desc = "some description text"
        projectEntry3.logo = "https://s3.amazonaws.com/TWFiles/349705/projectLogo/tf_49AEF502-ED21-1A9D-87FAE9BD9D485267.dota22.jpg"
        projectEntry3.status = "active"
        projectEntry3.createdOn = "2017-01-03T21:49:20Z"
        projectEntry3.startDate = "20140405"
        projectEntry3.endDate = "20261025"
        projectEntry3.company = companyEntry3
        projectEntry3.category = categoryEntry3
        
        return [projectEntry1, projectEntry2, projectEntry3]
    }
}

