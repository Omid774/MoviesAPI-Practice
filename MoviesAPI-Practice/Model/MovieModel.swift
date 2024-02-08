//
//  MovieModel.swift
//  MoviesAPI-Practice
//
//  Created by Omid Heydarzadeh on 2/9/24.
//

import Foundation

struct MovieModel: Decodable {
    let title: String
    let description: String
    let movies: [Movies]
}

struct Movies: Decodable {
    let id: String
    let title: String
    let releaseYear: String
}
