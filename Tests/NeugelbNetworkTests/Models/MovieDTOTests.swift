import Testing
import Foundation
@testable import NeugelbNetwork

struct MovieDTOTests {

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

        let data = try JSONEncoder().encode(movie)
        let movieDTO = try JSONDecoder().decode(MovieDTO.self, from: data)

        #expect(movieDTO.id == dummyMovie.id)
        #expect(movieDTO.title == dummyMovie.title)
        #expect(movieDTO.overview == dummyMovie.overview)
        #expect(movieDTO.releaseDate == dummyMovie.releaseDateString)
        #expect(movieDTO.posterPath == dummyMovie.posterPath)
        #expect(movieDTO.language ==  dummyMovie.lang)
        #expect(movieDTO.voteAverage == dummyMovie.voteAverage)
        #expect(movieDTO.voteCount == dummyMovie.voteCount)
    }

    @Test
    func test_to_movie_conversion() {
        let movieDTO = MovieDTO(
            id: dummyMovie.id,
            title: dummyMovie.title,
            overview: dummyMovie.overview,
            releaseDate: dummyMovie.releaseDateString,
            posterPath: dummyMovie.posterPath,
            language: dummyMovie.lang,
            voteAverage: dummyMovie.voteAverage,
            voteCount: dummyMovie.voteCount
        )

        let movie = movieDTO.toMovie()

        #expect(movie.id == dummyMovie.id)
        #expect(movie.title == dummyMovie.title)
        #expect(movie.overview == dummyMovie.overview)
        #expect(movie.releaseDate == dummyMovie.releaseDate)
        #expect(movie.poster == dummyMovie.posterPath)
        #expect(movie.language ==  dummyMovie.lang)
        #expect(movie.rating == dummyMovie.voteAverage)
    }
}
