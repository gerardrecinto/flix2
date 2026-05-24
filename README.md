# Flix

![Swift](https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white)
![iOS 16+](https://img.shields.io/badge/iOS-16%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-TableView%20%7C%20CollectionView-blue)
![Images](https://img.shields.io/badge/Images-URLSession%20%2B%20NSCache-blue)
![TMDb](https://img.shields.io/badge/API-TMDb-01B4E4)

![Demo](docs/assets/demo2.gif)

> Dual-layout iOS movie browser that presents TMDb's now-playing list as a `UITableView` and a superhero genre grid as a `UICollectionView`, loading all poster images via URLSession + NSCache| Layer | Technology |
|---|---|
| Language | Swift 6.0 |
| UI | UIKit, UITableView, UICollectionView, UICollectionViewFlowLayout, Auto Layout |
| Image Loading | URLSession + NSCache|
| Networking | URLSession (dataTask with JSONSerialization) |
| API | TMDb v3 (`/movie/now_playing`, `/movie/{id}/similar`) |
| Dependencies | CocoaPods |

## Architecture

A `UITabBarController` presents `NowPlayingViewController` (table layout) and `SuperheroViewController` (collection grid layout) as sibling tabs. Both view controllers fetch independently via `URLSession.dataTask` and hold their own `movies: [[String: Any]]` arrays. Tapping any row or cell passes the corresponding dictionary to `DetailViewController` through a storyboard segue. `MovieApiManager` is defined as a reusable service layer but view controllers currently call `URLSession` directly, keeping the networking path straightforward.

## Key Implementation

**`UICollectionViewFlowLayout` sizing at runtime:** `SuperheroViewController.viewDidLoad` casts the layout to `UICollectionViewFlowLayout`, sets `minimumInteritemSpacing` and `minimumLineSpacing` to 5 points, then derives `itemSize` from `collectionView.frame.size.width` to produce exactly three columns regardless of device width — no hardcoded point values.

**`loadImage(from:` request deduplication:** URLSession + NSCache