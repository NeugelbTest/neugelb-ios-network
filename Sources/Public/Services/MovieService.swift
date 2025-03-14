import Foundation

public protocol MovieService {

    // MARK: - Movie Retrieval

    /// Fetches the latest available movies from persistent storage.
    ///
    /// - Parameter page: The page number for pagination.
    /// - Returns: An array of `Movie` objects.
    /// - Throws: An error if the retrieval fails.
    func fetchMovies(by page: Int) async throws -> [Movie]

    /// Fetches the details of a specific movie by its ID.
    ///
    /// - Parameter movieID: The ID of the movie to fetch details for.
    /// - Returns: A `Movie` object containing detailed movie information.
    /// - Throws: An error if the retrieval fails.
    func fetchMovieDetails(for movieID: Int) async throws -> Movie

}
