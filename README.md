# Flix

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-TableView%20%7C%20CollectionView-blue)
![TMDb](https://img.shields.io/badge/API-TMDb-01B4E4)

![Demo](docs/assets/demo2.gif)

iOS movie browser with both a list view and a collection grid layout, powered by the TMDb API.

## Features

- Now playing movies list with pull-to-refresh
- Collection view grid of movie posters
- Tab bar navigation between list and grid layouts
- Movie detail view accessible from both views
- Progressive image loading (low-res placeholder to full resolution)
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
git clone https://github.com/gerardrecinto/flix-ios.git
cd flix-ios
pod install
open flix.xcworkspace
```

Add your TMDb API key before building.
