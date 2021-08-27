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

## Project Structure

### App Folder
> Is a folder which have the appDelegate, Assets, and, Network Constants).

![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/AppFolder.png)

### Modules
> In this folder we have each app module. In this case we have a Search, Show, and Detail Module, where we can find a viper architecture for each module. This architecture allow us to define single responsabilities for each layer.

![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/Modules.png)

### Utils
> In this folder we can find a multiples subfolders which specific responsabilities. The main idea of this folder is have a transversal module which help us with reusables components, transversal entities, and some extensions. As the app modules are pretty similar we choose this approach to have reusables components through the app development to avoid the time invest or re do some things.

![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/UtilsFolder.png)

### Components
> As We've said before, on this components we can find reusables components like menuBar, ShowComponentsView(Carousel View), and a Search Component.

![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/ComponentsFolder.png)

### Unit Test
> In this section we have the unit test structure, this folder meets the Viper architecture requirements. To continue, we can find a Test Double approach where we use Dummies, Spies, Mocks, and Stubs doubles to test the differents architecture layers.

![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/TestFolder.png)


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


## Unit test Log

![alt text](https://github.com/sebas8632/tMdbApp/blob/master/tMdbApp/Evidence/UnitTest.png)


## Questions

1. ¿En qué consiste el principio de responsabilidad única? Cuál es su propósito?
> El principio de responsabilidad única consiste en separar cada componente de la aplicación y asegurarnos de que cumple una única responsabilidad, esto con el propósito de que se evite el acomplamiento y que se tenga encapsulado en una clase o modulo específico dicha responsabilidad.

2. ¿Qué características tiene, según su opinión, un “buen” código o código limpio?
> Para que un código sea de buena calidad o código limpió, es necesario desde un comienzo implementar los principios SOLID, esto con el objetivo de generar un código con bajo acoplamiento y alta cohesión y que nos permita tener un código altamente testeable y escalable. Además, que cumpla con el principio DRY y así evitar la replicación de código. 
