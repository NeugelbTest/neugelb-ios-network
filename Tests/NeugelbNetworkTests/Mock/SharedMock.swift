import Foundation

enum SharedMock {}

// MARK: - Movie

extension SharedMock {

    enum Movie {
        
        static let id = Int.random(in: 1000...9999)
        static let title = "Inception"
        static let overview = "A mind-bending thriller"
        static let releaseDateString = "2010-07-16"
        static let releaseDate = Date(timeIntervalSince1970: 1279238400)
        static let posterPath = "/inception.jpg"
        static let lang = "en"
        static let voteAverage = Double.random(in: 0...10)
        static let voteCount = Int.random(in: 0...100)

    }
}
