import Foundation

final class DefaultNetworkService {}

extension DefaultNetworkService: NetworkService {
    func fetch<T: Decodable>(endpoint: String, queryItems: [URLQueryItem]? = nil) async throws -> T {
        guard var urlComponents = URLComponents(string: "\(APIConstants.baseURL)\(endpoint)") else {
            throw URLError(.badURL)
        }

        var items = queryItems ?? []
        items.append(URLQueryItem(name: "api_key", value: APIConstants.apiKey))
        urlComponents.queryItems = items

        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    func fetchImage(from path: String) async throws -> Data {
        let urlString = APIConstants.imageBaseURL + path
        guard let imageURL = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: imageURL)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return data
    }
}
