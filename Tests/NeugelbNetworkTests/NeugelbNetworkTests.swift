import Testing
@testable import NeugelbNetwork

struct NeugelbNetworkTests {
    
    @Test
    func example() async throws {
        
        guard let movies: [Movie]? = try await NeugelbNetwork.movieService.fetchMovies(by: 1) else { return }
        
        #expect(movies?.count ==  20)
    }
}
