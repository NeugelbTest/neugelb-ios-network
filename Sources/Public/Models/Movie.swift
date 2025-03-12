import Foundation

public struct Movie: Hashable, Identifiable {
    
    public let id: Int
    public let name: String
    public let overview: String
    public let poster: String?
    public let voteAverage: Double
    public let voteCount: Int
    public let date: Date
}

extension Movie {
    
    init(_ movieDTO: MovieDTO) {
        
        id = movieDTO.id
        name = movieDTO.name
        overview = movieDTO.overview
        poster = movieDTO.poster_path
        voteAverage = movieDTO.vote_average
        voteCount = movieDTO.vote_count
        date = Date(movieDTO.first_air_date)
    }
}
