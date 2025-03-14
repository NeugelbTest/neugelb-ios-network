import Foundation

struct MovieCompleteDTO: Decodable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
    let rating: Double?
    let voteCount: Int?
    let runtime: Int?
    let budget: Int?
    let revenue: Int?
    let status: String?
    let adult: Bool?
    let originalLanguage: String?
    let genres: [GenreDTO]
    let belongsToCollection: MovieCollectionDTO?

    enum CodingKeys: String, CodingKey {
        case id, title, overview, runtime, budget, revenue, status, adult, genres
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case rating = "vote_average"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
        case belongsToCollection = "belongs_to_collection"
    }
}

extension MovieCompleteDTO {

    func toMovie() -> Movie {
        return Movie.Builder()
            .with(movieCompleteDTO: self)
            .build()
    }
}
