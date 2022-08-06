//
//  MemesData.swift
//  MemesProject
//
//  Created by Raşit Kaplan on 5.08.2022.
//

import Foundation

// MARK: - MemesData
struct Memes: Codable {
    let success: Bool?
    let data: MemesData?
}

// MARK: - DataClass
struct MemesData: Codable {
    let memes: [Meme]?
}

// MARK: - Meme
struct Meme: Codable {
    let id, name: String?
    let url: String?
    let width, height, boxCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
