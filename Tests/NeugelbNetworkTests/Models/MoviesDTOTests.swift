import Testing
import Foundation
@testable import NeugelbNetwork

struct MoviesDTOTests {
    
    typealias dummyMovie = SharedMock.Movie
    
    @Test
    func test_decoding() throws {
        
        let movie = MovieDTO(
            id: dummyMovie.id,
            title: dummyMovie.title,
            overview: dummyMovie.overview,
            releaseDate: dummyMovie.releaseDateString,
            posterPath: dummyMovie.posterPath,
            language: dummyMovie.lang,
            voteAverage: dummyMovie.voteAverage,
            voteCount: dummyMovie.voteCount
        )
        
        let movies = MoviesDTO(
            page: 1,
            results: [movie, movie],
            totalPages: 12,
            totalResults: 40
        )
        
        let data = try JSONEncoder().encode(movies)
        let moviesDTO = try JSONDecoder().decode(MoviesDTO.self, from: data)

        #expect(moviesDTO.page == 1)
        #expect(moviesDTO.results.count == 2)
        #expect(moviesDTO.totalPages == 12)
        #expect(moviesDTO.totalResults == 40)
    }
}
