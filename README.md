# Popcorn Adventure
This is an iOS app developed by Arthur Tristan M. Ramos who has taken the Appetiser iOS Coding Challenge.

# Design Pattern
The design pattern the proponent has used in the project is **Model View Controller (MVC)**, the most well known design pattern in software development. It contains three components: *model*, *view* and *controller*.

# Model
Model is the component that handles the data wherein as seen in the code, we use a **struct** which is the structure of the data to be displayed in the view then manipulated by the controller once the user interacts with the application. In the struct itself, for the developer to gather some data easily, *functions* are created like **getPrice()** (Gets the *track price* if available, otherwise, the *collection price*).

# View
View is the aesthetic part of the application that displays the data for the user. It contains the **XiB (Interface Builder)** that holds the components where the data is stored and is used to indicate actions of specific components like the *arrow* pointed to the right in each item of movie, song or audio book given in the project indicating that when you tap the media (e.g. "Stay" by Rihanna), it will lead you to a page that will give more information about the song.

# Controller
Controller is the interactive part of the application that helps the user manipulate after doing some actions with the components like displaying the details of the song when the user taps that song (particularly in the delegate function of the table view (list) which is *didSelectRowAt*. It contains *classes* known as **View Controllers (VCs)** that contain functions that directly manipulate the view.

## Advantages of MVC

 1. Since it is the most well known design pattern, it is easy for multiple developers to collaborate and work together.
 2. You directly change the behavior of the components in the view directly in the view controller.
 3. Development of application becomes faster due to modularity.
 4. Distinction of which handles the data, design and functionality of the application making it easier to debug

## Disadvantages of MVC

 1. Prone to becoming "Massive View Controller," too much use of view controllers neglecting reusability which is a big disadvantage for larger projects.
 2. More time to render when there are new changes in the view
 3. Structure is complex especially when frequent changes in views are needed making it difficult to learn.

## Reason for using MVC
The proponent has been most familiar with this design pattern since he has been using this in his projects given the time needed to submit this project.

# Extensions
Swift is a class-based object-oriented programming language. Extensions are a unique way of this language to add functionalities to existing classes usually data types like Int, String, collections, classes and delegates. 
The proponent frequently uses extensions not only to add functionality in existing classes and protocols but to group functions especially in one class for easier tracing.

# Functions in Models
Functions return a value. The proponent frequently uses functions in models since the properties and functions in one struct technically are connected to one another. The proponent creates functions for the developer to easily get the data without extra procedures after gathering the data. One biggest example is the `getPrice()` in the 	`Detail` model.

# Screenshots of Views

## List View
![List View](https://github.com/dev-arthur-g20r/popcorn-adventure/blob/main/Screenshots/List%20View.png)

![Details View](https://github.com/dev-arthur-g20r/popcorn-adventure/blob/main/Screenshots/Detail%20View.png)


	

> Written with [StackEdit](https://stackedit.io/).
