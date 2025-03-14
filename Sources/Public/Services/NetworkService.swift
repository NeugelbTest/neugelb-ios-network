import Foundation

// MARK: - Network Manager
protocol NetworkService {
    /// Fetches and decodes JSON data from the given API endpoint.
    ///
    /// - Parameters:
    ///   - endpoint: The API endpoint.
    ///   - queryItems: Optional query parameters.
    /// - Returns: A decoded object of type `T`.
    /// - Throws: An error if the network request fails or decoding fails.
    func fetch<T: Decodable>(endpoint: String, queryItems: [URLQueryItem]?) async throws -> T

    /// Fetches image data from the given path.
    ///
    /// - Parameter path: The  image path.
    /// - Returns: Image data.
    /// - Throws: An error if the network request fails.
    func fetchImage(from path: String) async throws -> Data
}
