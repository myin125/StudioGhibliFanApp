//
//  Film.swift
//  GhibliFanApp
//
//  Created by Maryann Yin on 6/19/18.
//  Copyright © 2018 Maryann Yin. All rights reserved.
//

import Foundation

struct GhibliFilm: Codable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let release_date: String
    let rt_score: String
    let people: [String]
    let species: [String]
    let locations: [String]
    let vehicles: [String]
    let url: String
}
