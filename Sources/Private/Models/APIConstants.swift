import Foundation

enum APIConstants {

    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = "96b18532d428bfa590d8e9d8a7200c0e"
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    enum Endpoint {
        case discoverMovies
        case movieDetail(_ movieID: Int)

        var path: String {
            switch self {
            case .discoverMovies:
                return baseURL+"/discover/movie"
            case .movieDetail(let movieID):
                return baseURL+"/movie/\(movieID)"
            }
        }
    }

}
