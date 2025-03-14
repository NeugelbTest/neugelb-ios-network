import Foundation

public enum NeugelbNetwork {
    
    public static var movieService: MovieService {
        DefaultMovieService()
    }
    
    public static var imageService: ImageService {
        DefaultImageService()
    }
}
