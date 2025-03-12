import Foundation

struct MoviesDTO: Codable {
    
    var page: Int
    var results: [MovieDTO]
    var total_pages: Int
    var total_results: Int
}
