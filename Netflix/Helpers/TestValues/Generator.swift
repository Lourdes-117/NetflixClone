//
//  Generator.swift
//  Netflix
//
//  Created by Lourdes on 2/2/21.
//

import Foundation

func generateMovies(_ count: Int) -> [MovieModel] {
    guard count > 0 else { return [] }
    
    var allMovies: [MovieModel] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/600/90\(randThumbnail)"
        
        let year = Int.random(in: 2000...2020)
        
        let categories = ["consectetur", "neque", "felis", "libero"]
        
        let headline = "Watch now!"
        
        let numSeasons = Int.random(in: 1...3)
        
        var allEpisodes: [EpisodeInfo] = []
        
        for i in 1...numSeasons {
            allEpisodes.append(contentsOf: generateEpisodes(5, forSeason: i))
        }
        
        let epinameLength = Int.random(in: 9..<20)
        let epiname = randomString(length: epinameLength)
        
        let epidescLength = Int.random(in: 150..<200)
        let epidesc = randomString(length: epidescLength)
        let defEpiInfo = EpisodeInfo(episodeName: epiname, description: epidesc, season: 1, episode: 1)
        
        let allTrailers = generateTrailers(3)
        
        let moreLikeThis = exampleMovies
        
        let detail = MovieDetailModel(id: UUID().uuidString, year: year, rating: "PG-13", seasons: numSeasons, resolution: "4K", promotionHeadline: headline, isLiked: false, episodeInfo: defEpiInfo, moreLikeThis: moreLikeThis, trailers: allTrailers, episodes: allEpisodes)
        
        let movie = MovieModel(id: id, name: name, thumbnailImage: thumbnail, categories: categories, genre: .all, details: detail)
        allMovies.append(movie)
    }
    
    return allMovies
}

func generateTrailers(_ count: Int) -> [TrailerModel] {
    var allTrailers: [TrailerModel] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/600/90\(randThumbnail)"
        
        let trailer = TrailerModel(id: id, name: name, videoURl: exampleVideoUrl, thumbnailImageUrl: thumbnail)
        allTrailers.append(trailer)
    }
    
    return allTrailers
}

func generateEpisodes(_ count: Int, forSeason season: Int) -> [EpisodeInfo] {
    var allEpisodes: [EpisodeInfo] = []
    let cast = ["Lorem ipsum", "dolor sit"]
    let creators = ["felis non", "libero consectetur"]
    
    for num in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/600/90\(randThumbnail)"
        
        let desc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse at purus diam. Nullam a nulla a augue eleifend convallis ac vitae neque. Curabitur sit amet felis non libero consectetur euismod."
        let randLength = Int.random(in: 20..<59)
        
        let episode = EpisodeInfo(id: id, episodeName: name, description: desc, season: season, episode: num + 1, creators: creators, cast: cast, videoUrl: exampleVideoUrl, imageUrl: thumbnail, length: randLength)
        
        allEpisodes.append(episode)
    }
    
    return allEpisodes
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyz"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
