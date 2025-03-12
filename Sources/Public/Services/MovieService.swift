import Foundation

public protocol MovieService {
    
    // MARK: - Movie Retrieval

    /// Fetches the latest available movies from persistent storage.
    ///
    /// - Parameter page: The page number for pagination.
    /// - Returns: An array of `Movie` objects.
    /// - Throws: An error if the retrieval fails.
    func getMovies(by page: Int) async throws -> [Movie]

}
