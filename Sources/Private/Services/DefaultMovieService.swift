import Foundation

final class DefaultMovieService {

    private let networkManager: NetworkService

    init(networkManager: NetworkService = DefaultNetworkService()) {
        self.networkManager = networkManager
    }
}

extension DefaultMovieService: MovieService {

    func fetchMovies(by page: Int = 1) async throws -> [Movie] {
        let movieResponce: MoviesDTO = try await networkManager.fetch(endpoint: .discoverMovies, queryItems: [
            URLQueryItem(name: "sort_by", value: "release_date.desc"),
            URLQueryItem(name: "page", value: "\(page)")
        ])
        return movieResponce.results.map({ $0.toMovie() })
    }

    func fetchMovieDetails(for movieID: Int) async throws -> Movie {
        let movieComplete: MovieCompleteDTO = try await networkManager.fetch(endpoint: .movieDetail(movieID), queryItems: [])
        return movieComplete.toMovie()
    }
}
