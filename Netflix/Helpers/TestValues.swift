//
//  GlobalHelpers.swift
//  Netflix
//
//  Created by Lourdes on 12/13/20.
//

import Foundation

let exampleVideoUrl = "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4"
let exampleImageUrl_300_100 = "https://picsum.photos/300/100"

//Movies

let exampleMovie1 = MovieModel(id: UUID().uuidString,
                               name: "Fish Named Wanda",
                               thumbnailImage: "https://picsum.photos/600/900",
                               categories: ["Dystopian", "Suspenceful", "Sci-Fi"],
                               details: exampleDetails1)
let exampleMovie2 = MovieModel(id: UUID().uuidString,
                               name: "Viswaroopam",
                               thumbnailImage: "https://picsum.photos/601/900/",
                               categories: ["Dystopian", "Suspenceful", "Sci-Fi"],
                               details: exampleDetails2)
let exampleMovie3 = MovieModel(id: UUID().uuidString,
                               name: "Parasite",
                               thumbnailImage: "https://picsum.photos/600/901",
                               categories: ["Dystopian", "Suspenceful", "Sci-Fi"],
                               details: exampleDetails3)
let exampleMovie4 = MovieModel(id: UUID().uuidString,
                               name: "Unnaipol Uruvan",
                               thumbnailImage: "https://picsum.photos/600/899",
                               categories: ["Dystopian", "Suspenceful", "Sci-Fi"],
                               details: exampleDetails4)
let exampleMovie5 = MovieModel(id: UUID().uuidString,
                               name: "Terminator",
                               thumbnailImage: "https://picsum.photos/600/902",
                               categories: ["Dystopian", "Suspenceful", "Sci-Fi"],
                               details: exampleDetails5)
let exampleMovie6 = MovieModel(id: UUID().uuidString,
                               name: "Love Actually",
                               thumbnailImage: "https://picsum.photos/600/898",
                               categories: ["Dystopian", "Suspenceful", "Sci-Fi"],
                               details: exampleDetails6)
let exampleMovie7 = MovieModel(id: UUID().uuidString,
                               name: "Pitch Perfect",
                               thumbnailImage: "https://picsum.photos/601/898",
                               categories: ["Rom-Com", "Drama", "Musical"],
                               details: exampleDetails7)

//Movie Details

let exampleDetails1 = MovieDetailModel(id: UUID().uuidString,
                                      year: 2012,
                                      rating: "TV-MA", seasons: 2,
                                      resolution: "HD",
                                      promotionHeadline: "Watch Season 2 Now",
                                      isLiked: false,
                                      episodeInfo: episodeInfo1,
                                      moreLikeThis: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
                                      trailers: exampleTrailers)
let exampleDetails2 = MovieDetailModel(id: UUID().uuidString,
                                      year: 2016,
                                      rating: "TV-MA", seasons: 5,
                                      resolution: "SD",
                                      isLiked: false,
                                      episodeInfo: episodeInfo2,
                                      moreLikeThis: [],
                                      trailers: exampleTrailers)
let exampleDetails3 = MovieDetailModel(id: UUID().uuidString,
                                      year: 2018,
                                      rating: "TV-MA",
                                      resolution: "4K",
                                      isLiked: true,
                                      episodeInfo: episodeInfo3,
                                      moreLikeThis: [],
                                      trailers: exampleTrailers)
let exampleDetails4 = MovieDetailModel(id: UUID().uuidString,
                                      year: 2020,
                                      rating: "TV-MA",
                                      seasons: 7,
                                      resolution: "HD",
                                      promotionHeadline: "Watch Season 7 Now",
                                      isLiked: true,
                                      episodeInfo: episodeInfo4,
                                      moreLikeThis: [],
                                      trailers: exampleTrailers)
let exampleDetails5 = MovieDetailModel(id: UUID().uuidString,
                                      year: 2007,
                                      rating: "TV-MA",
                                      resolution: "SD",
                                      isLiked: false,
                                      episodeInfo: episodeInfo5,
                                      moreLikeThis: [],
                                      trailers: exampleTrailers)
let exampleDetails6 = MovieDetailModel(id: UUID().uuidString,
                                      year: 1947,
                                      rating: "TV-MA",
                                      resolution: "4K",
                                      isLiked: false,
                                      episodeInfo: episodeInfo6,
                                      moreLikeThis: [],
                                      trailers: exampleTrailers)
let exampleDetails7 = MovieDetailModel(id: UUID().uuidString,
                                      year: 2005,
                                      rating: "TV-MA",
                                      resolution: "HD",
                                      isLiked: false,
                                      episodeInfo: episodeInfo7,
                                      moreLikeThis: [],
                                      trailers: exampleTrailers)

//Episode Info

let episodeInfo1 = EpisodeInfo(episodeName: "Lorem Ipsum 1",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               season: 3,
                               episode: 1,
                               creators: ["Thomas", "Mary"],
                               cast: ["Edward", "Bill", "Melinda"])
let episodeInfo2 = EpisodeInfo(episodeName: "Lorem Ipsum 2",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               creators: ["Debbie", "Lisa"],
                               cast: ["Paris", "Katherine", "Prince", "Joseph"])
let episodeInfo3 = EpisodeInfo(episodeName: "Lorem Ipsum 3",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               season: 2,
                               episode: 6,
                               creators: ["Michael", "Jackson"],
                               cast: ["Janet", "Jermaine", "Randy", "Brandon"])
let episodeInfo4 = EpisodeInfo(episodeName: "Lorem Ipsum 4",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               creators: ["Linda", "Emma"],
                               cast: ["Hamilton", "Emily", "Segan"])
let episodeInfo5 = EpisodeInfo(episodeName: "Lorem Ipsum 5",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               season: 3,
                               episode: 1,
                               creators: ["Carl", "Seth"],
                               cast: ["Reynold", "Neil Degrasse Tyson", "Wilson"])
let episodeInfo6 = EpisodeInfo(episodeName: "Lorem Ipsum 6",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               creators: ["Lourdes", "Angel"],
                               cast: ["Arnold", "Mike Tyson", "James"])
let episodeInfo7 = EpisodeInfo(episodeName: "Lorem Ipsum 7",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor vulputate lacus, in pulvinar elit elementum sed. Nulla tempor, nibh at rutrum porttitor, nulla magna faucibus leo, et fringilla nulla nisl eu dolor",
                               creators: ["Freddie", "Mercury"],
                               cast: ["Brian", "May", "John", "Deacon"])

//Trailers

let exampleTrailer1 = TrailerModel(name: "A Hero Is Born",
                                   videoURl: exampleVideoUrl,
                                   thumbnailImageUrl: "https://picsum.photos/300/99/")
let exampleTrailer2 = TrailerModel(name: "The Journey",
                                   videoURl: exampleVideoUrl,
                                   thumbnailImageUrl: "https://picsum.photos/301/100/")
let exampleTrailer3 = TrailerModel(name: "No Time Left",
                                   videoURl: exampleVideoUrl,
                                   thumbnailImageUrl: "https://picsum.photos/301/101/")
let exampleTrailer4 = TrailerModel(name: "The Pain",
                                   videoURl: exampleVideoUrl,
                                   thumbnailImageUrl: "https://picsum.photos/209/100/")
let exampleTrailer5 = TrailerModel(name: "Showdown!",
                                   videoURl: exampleVideoUrl,
                                   thumbnailImageUrl: "https://picsum.photos/209/101/")


//Arrays

var exampleMovies: [MovieModel] {
    [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7].shuffled()
}

var exampleTrailers: [TrailerModel] {
    return [exampleTrailer1, exampleTrailer2, exampleTrailer3, exampleTrailer4, exampleTrailer5].shuffled()
}
