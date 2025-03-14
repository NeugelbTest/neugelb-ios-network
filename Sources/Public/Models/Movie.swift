import Foundation

public struct Movie: Hashable, Identifiable {

    public let id: Int
    public let title: String
    public let overview: String
    public let poster: String?
    public let rating: Double
    public let releaseDate: Date?
    public let language: String?
}

extension Movie {

    init(_ movieDTO: MovieDTO) {

        id = movieDTO.id
        title = movieDTO.title
        overview = movieDTO.overview
        poster = movieDTO.posterPath
        rating = movieDTO.voteAverage
        releaseDate = Date(serverTime: movieDTO.releaseDate)
        language = movieDTO.language
    }
}
