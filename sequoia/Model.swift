//
//  Model.swift
//  Sequeia
//
//  Created by chengmengmeng on 2023/4/23.
//

import Foundation
import SwiftUI

struct Item: Codable {
    var screenshotUrls: [String]
    var ipadScreenshotUrls: [String]
    var appletvScreenshotUrls: [String]
    var artworkUrl512: String // 图标
    var artistViewUrl: String
    var artworkUrl60: String
    var artworkUrl100: String
    var features: [String]
    var isGameCenterEnabled: Bool
    var advisories: [String]
    var supportedDevices: [String]
    var kind: String
    var languageCodesISO2A: [String]
    var sellerUrl: String?
    var formattedPrice: String
    var averageUserRatingForCurrentVersion: Double
    var userRatingCountForCurrentVersion: Int
    var trackContentRating: String
    var currency: String
    var fileSizeBytes: String
    var currentVersionReleaseDate: String
    var releaseNotes: String
    var trackCensoredName: String
    var trackViewUrl: String
    var contentAdvisoryRating: String
    var averageUserRating: Double
    var artistId: Int64
    var artistName: String // - 标题
    var genres: [String]
    var price: Int
    var description: String // 描述
    var primaryGenreName: String
    var primaryGenreId: Int
    var genreIds: [String]
    var bundleId: String
    var releaseDate: String
    var trackId: Int
    var trackName: String // 标题
    var isVppDeviceBasedLicensingEnabled: Bool
    var sellerName: String
    var minimumOsVersion: String
    var version: String
    var wrapperType: String
    var userRatingCount: Int64
    
}

struct rawItem: Codable {
    var resultCount: Int
    var results: [Item]
}

final class ModelData: ObservableObject {
    @Published var items: [rawItem] = load("data1.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        fatalError("\(error)")
    }
}
