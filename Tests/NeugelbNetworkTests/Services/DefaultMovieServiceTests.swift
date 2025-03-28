import Testing
@testable import NeugelbNetwork

struct DefaultMovieServiceTests {

    @Test
    func test_fetch_movies_success() async throws {

        let movies = try await NeugelbNetwork.movieService.fetchMovies(by: 1)

        print(movies.first?.id)
        #expect(movies.count ==  20)
    }

    @Test
    func test_fetch_movie_success() async throws {

        let movie = try await NeugelbNetwork.movieService.fetchMovieDetails(for: 393209)

        #expect(movie.id == 393209)
        #expect(movie.language == "English")
    }
}
