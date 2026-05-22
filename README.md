# Flix

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-TableView%20%7C%20CollectionView-blue)
![TMDb](https://img.shields.io/badge/API-TMDb-01B4E4)

An iOS movie browser built with Swift and UIKit, powered by The Movie Database (TMDb) API. Features both a list view and a collection grid layout.

## Features

- Now playing movies list with pull-to-refresh
- Collection view grid of movie posters
- Tab bar navigation between list and grid layouts
- Movie detail view accessible from both list and grid
- Progressive image loading (low-res placeholder → full resolution)
- Loading state indicator while fetching data
- Auto Layout for all screen sizes and orientations

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, UITableView, UICollectionView, Auto Layout |
| Networking | TMDb API, AFNetworking |
| Dependencies | CocoaPods |

## Setup

```bash
git clone https://github.com/gerardrecinto/flix2.git
cd flix2
pod install
open flix.xcworkspace
```

Add your TMDb API key before building.

## Demo

![Demo](https://imgur.com/3dDlnuL.gif)
