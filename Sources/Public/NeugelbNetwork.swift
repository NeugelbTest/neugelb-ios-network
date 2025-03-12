import Foundation

public enum NeugelbNetwork {
    
    public static var movieService: MovieService {
        DefaultMovieService()
    }
}
