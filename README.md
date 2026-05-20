# Flix

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
