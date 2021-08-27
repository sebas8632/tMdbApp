# tMdbApp

# Technical Approach

## Architecture VIPER

VIPER is an application of Clean Architecture to iOS apps. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing. Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers. [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/).
![alt text](https://miro.medium.com/max/1021/1*6W73TuYu1DWi9JY4_Uh8aA.png)

This architecture is conformed by 5 layers which have single responsibilities, which represent an opportunity to have a project decoupled, testable, and scalable.

### View
> This layer is responsible to manage the view and the view controller, which allows to have centralized all the components and their behavior. This layer have their UIView components and UIViewControllers.

### Presenter
> The presenter layer is responsible to manage the communication between the View layer, Router layer and Interactor layer. Its main function is handle each visual request, retrieve information from interactor layer or, route the actual view to another one with the Router.

### Router
> This layer is responsible to manage the communication between modules, its allows us changing between views and, create modules for each feature on the app.

### Interactor
> The interactor is the main integral layer, because on it we could manage all the business logic and have communication with the data modules which retrieve us data from local or remote repositories.

### Entity 
> Entity layer provides a model which interactor use to create objects from the fetched data. The Entity is probably the simplest element inside a VIPER structure.

## Good Practices
With the following practices, we've achieved create a product with highly quality.
- **Clean code**
- **SOLID Principles**
- **DRY Principle**
- **Dependency Injection**
- **Modularized architecture**

## Frameworks
In this section we are going to talk about the frameworks which we have used. In this project we have used personal and third party libraries.

### Personal frameworks
- [JSFSNetwork](https://github.com/sebas8632/JSFSNetwork): This framework represent the entire networking layer, this  framework give us a way to define the API services through protocols defined and a customized way to request data. The main goal of having this framework separated from the main project is could delegate the networking responsibility a specific project and re use in every project need it.

### Third Party Frameworks
- [Kingfisher](https://github.com/onevcat/Kingfisher): This frameworks allows us manage the image downloading in an easy way.

## Installation

This project require  `Xcode 12.0`, `Swift 5` and should be run on `iOS 14.0`.

1. Install [Carthage](https://github.com/Carthage/Carthage).

2. Then, execute the next command. `carthage update --use-xcframeworks`.

3. Then, you should `run` the app.

## Evidence
On this Section we are going to watch the app running.

| Movies Section | Series Section |
| ------- | ------- |
|![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/moviesSection.gif) | ![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/seriesSection.gif) |

| Search Section With Pagination |
| ------- |
|![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/searchSectionWithPagination.gif) |
