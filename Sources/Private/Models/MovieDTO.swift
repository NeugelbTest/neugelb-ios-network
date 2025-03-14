import Foundation

struct MovieDTO: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String?
    let posterPath: String?
    let language: String?
    let voteAverage: Double
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case language = "original_language"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieDTO {

    func toMovie() -> Movie {
        return Movie(self)
    }
}
