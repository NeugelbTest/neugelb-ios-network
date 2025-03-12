import Foundation

struct MovieDTO: Codable {
    
    let id: Int
    let name: String
    let origin_country: [String]
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Double
    let poster_path: String?
    let vote_average: Double
    let vote_count: Int
    let genre_ids: [Int]
    let first_air_date: String
    let backdrop_path: String?
    
}

extension MovieDTO {
    
    func toMovie() -> Movie {
        return Movie(self)
    }
}
