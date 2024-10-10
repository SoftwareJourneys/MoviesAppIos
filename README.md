# Movies iOS
MDB api connected to imodern OS app

## Project Overview

This project connects to MDB.org to show different sections as popular movies, movies and similarly for series

### Features

- **Popular Movies**
- **Top Rated Movies Playing**
- **Popular Series**:
- **Top Rated Series Playing**

For those sections you can access some details about any of those movies.

### Technologies

- **iOS**: 17.4 and above swift application
- **SwiftData**: New framework, normally iwould use Core data but taking advantage of the test I decided to give it a try. 
- **AlamoFire**:Could be achieved with pure URLSession but wanted to see how it works

### API Key

To run this project, you need an API key from The Movie Database, but as this is a private repos and sharing mine.

### Folder Structure

Every module has a series of folders, so compose app for example is organized this way:

- **/Data**: Local and remote sources orchestrated by a repository.
- **/Domain**: Models are isolated from DB and DTO models
- **/Presentation**: Screens by feature
- **/UI**: Atomic Design for visual components

## Design and Architecture

This is a simple MVVM application on iOS

## How to run it

Use xcode and open MoviesApp.xcodeproj
Xcode version 15.3 was used on the creation of this project. 

# My Project

![Demo of the feature](https://github.com/kiquenet85/iOSMovies/blob/main/MoviesiOS.gif)


Check out how this feature works!
