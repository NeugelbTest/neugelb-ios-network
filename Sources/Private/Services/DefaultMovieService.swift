import Foundation

final class DefaultMovieService {}

extension DefaultMovieService: MovieService {
    
    func fetchMovies(by page: Int) async throws -> [Movie] {
        
        let url = URL(string: TheMovieDBAPI.tv_popular)!
        
        let moviesResource = Resource<MoviesDTO>(url: url) { data in
            
            let movies = try? JSONDecoder().decode(MoviesDTO.self, from: data)
            return movies
        }
        
        do {
            let result = try await NetworkHandler().load(resource: moviesResource)
            return result.results.map({ $0.toMovie() })
        } catch {
            
            throw error
        }

    }
}


struct TheMovieDBAPI {
    
    private static let base = "https://api.themoviedb.org/3"
    private static let key  = "?api_key=96b18532d428bfa590d8e9d8a7200c0e"
    
    static let image_server = "https://image.tmdb.org/t/p/w500"
    
    static let tv_popular   = base + "/tv/popular" + key
}


struct Resource<T>{
    let url : URL
    let parse: (Data) -> T?
}

final class NetworkHandler {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.global().async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func load<T>(resource: Resource<T>) async throws -> T {
        
        do {
            let (data,_) = try await URLSession.shared.data(from: resource.url)
            
            if let parsedData = resource.parse(data) {
                return parsedData
            } else {
                throw URLError(.cancelled)
            }
        } catch {
            throw error
        }
    }
}
