# TeamworkSample
## Michel Barbou salvador
## @mibarbou

### Technical test for Teamwork.com

## Configuration:
- Swift 4 using Xcode v9.2.
- Cocoapods 1.4.0, use "pod install".
### Pods used:
- Alamofire: for the Api REST.
- Gloss: for the JSONs responses serialization.
- RealmSwift: to save data on memory.
- Kingfisher: to cache the images.

## Architecture:
   -  MVP (Model View Presenter) applying CLEAN. The app shows the projects of a user in a table view(ProjectsTableViewController), and it can be filter by Active and Archived projects. The projects can be choose to go to his detail (ProjectDetailViewController), where you can see more detail and retrieve the latest project Activity.
   - The App has a cache data logic where it always shows  the data retrieve from the device memory, through the Realm wrapper ProjectContainer, and  ask to retrieve Data from remote through the ApiClient. It has a Service (ProjectService) that handle this logic, when the Service retrieve the API remote data, it send it to the Container(ProjectContainer) that handle saving of this data on disk. This container class handle a Realm notification thats gonna be send through the Service, to notify where there is a change in the Realm data base, to be able to reload the controllers with the new updated data.

### Coordinators: Classes in charge of the navigation for the controllers:
   - AppCoordinator: Bootstrap of the app in the AppDelegate.
   - ProjectsCoordinator: Navegation for the ProjectsTableViewController.
   
   ### Presenters: Classes that contains the logic to handle user interactions, comunicates with model layer, updates the view and has no dependencies with UIKit:
   - ProjectsPresenter use for ProjectsTableViewController.
   - ProjectDetailPresenter use for ProjectDetailViewController.
   
   ### API: Model in charge or retieving the remote data from the Teamwork  REST API:
   - APISettings: Handle the constants credentials and base URL for the API.
   - Endpoint: Enum that defines the endpoints of the API, his path and parameters.
   - ApiError: Error type enum to handle the API errors.
   - Responses: The structs to handle the  serialization of the API JSONs responses
   - APIClient: API Manager class with the public methods to retrieve the required data.
   
   ### Container: Model in charge of saving and retrieve  data from memory, using RealmSwift:
   - ProjectContainer: wrapper class to isolate Realm implementation from the other layers.
   - ProjectEntry, CategoryEntry, CompanyEntry and ActivityEntry are the Model clases for Realm Objects.
   
   ### Services: Class that does the abstraction to retrieve remote Data and feed the presenters with the require data models:
   - ProjectService: Retrieve remote data via the ApiClient class and send it to the ProjectContainer class. Retrieve the data from ProjectContainer and feed the ProjectsPresenter and ProjectDetailPresenter.
   
   ### Mappers: Handle the mapping and logic to transform a Model to another:
   - EntryMappers: recieve the Services Responses Model and transform them into Realm Object Entries; ProjectEntryMapper, CategoryEntryMapper, CompanyEntryMapper and ActivityEntryMapper.
   - Data Models mappers: receive the Realm Entries Models and transform it into the  structs Data models; Project, Category, Company, Activity.
   - ViewModel Mappers: recieve a Data model and transform it into a View Data Model; ProjectViewDataModel, AvticityViewDataModel.
   
   ### Views: Component views use in the Controllers:
   - TableViewCells: ProjectCell, ActivityCell.
   - Headers TableView cells: ProjectHeaderCell, ActivityHeaderCell.
   
   ### Controllers:
   - ProjectsTableViewController:  Is a UITableViewController class that shows the projects of a user.
   - ProjectDetailViewController: Is a UIViewController class with a Tableview that shows the Project detail, and the latest activity.
   
   ### Utils:
   - Coordinator: Base class for the Coordinator use in the app.
   - DateFormater+utils: Util class to transform the Dates.
   - UtilMock: To retrieve the json Mock responses for the Unit tests.
   - Color: Util class to define the colors.
   
   
   ### Unit tests:
   - MappersTests: Test some of the app Mappers.
   - ProjectContainerTests: Test the most important class of the app, the ProjectContainer.
   
   
   ## TO-DO:
   - Handle the Api errors to show it to the user via Alerts.
   - Add more Project data and features, Rate projects, retrieve Task, create task, etc.
   - Add cool view animations.
   - Do more work in UI design.
   - Add more tests...
   
   
   
   
   
   
   
   
   
   
   
    
