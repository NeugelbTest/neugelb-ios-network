import Testing
@testable import NeugelbNetwork

struct DefaultMovieServiceTests {

    @Test
    func test_fetch_movies_success() async throws {

        let movies = try await NeugelbNetwork.movieService.fetchMovies(by: 1)

        #expect(movies.count ==  20)
    }
}
