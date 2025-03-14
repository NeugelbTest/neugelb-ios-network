import Foundation

extension Movie {

    final class Builder: ModelBuilder {

        // MARK: - Properties

        private(set) var id: Int = 0
        private(set) var title: String = ""
        private(set) var overview: String = ""
        private(set) var poster: String?
        private(set) var cover: String?
        private(set) var rating: Double?
        private(set) var releaseDate: Date?
        private(set) var language: String?
        private(set) var runtime: Int?
        private(set) var budget: Int?
        private(set) var revenue: Int?
        private(set) var status: String?
        private(set) var adult: Bool?
        private(set) var genres: [Genre] = []

        // MARK: - Initialization

        public init() {}
    }
}

// MARK: - Public Methods

extension Movie.Builder {

    func with(movieDTO: MovieDTO) -> Self {
        return with(id: movieDTO.id)
            .with(title: movieDTO.title)
            .with(overview: movieDTO.overview)
            .with(poster: movieDTO.posterPath)
            .with(rating: movieDTO.voteAverage)
            .with(releaseDate: movieDTO.releaseDate)
            .with(language: movieDTO.language)
    }

    func with(movieCompleteDTO: MovieCompleteDTO) -> Self {
        return with(id: movieCompleteDTO.id)
            .with(title: movieCompleteDTO.title)
            .with(overview: movieCompleteDTO.overview)
            .with(poster: movieCompleteDTO.belongsToCollection?.posterPath)
            .with(cover: movieCompleteDTO.belongsToCollection?.backdropPath)
            .with(rating: movieCompleteDTO.rating)
            .with(releaseDate: movieCompleteDTO.releaseDate)
            .with(language: movieCompleteDTO.originalLanguage)
            .with(releaseDate: movieCompleteDTO.releaseDate)
            .with(runtime: movieCompleteDTO.runtime)
            .with(budget: movieCompleteDTO.budget)
            .with(revenue: movieCompleteDTO.revenue)
            .with(status: movieCompleteDTO.status)
            .with(adult: movieCompleteDTO.adult)
            .with(genres: movieCompleteDTO.genres)
    }

    func with(id: Int) -> Self {
        self.id = id
        return self
    }

    func with(title: String) -> Self {
        self.title = title
        return self
    }

    func with(overview: String) -> Self {
        self.overview = overview
        return self
    }

    func with(poster: String?) -> Self {
        self.poster = poster
        return self
    }

    func with(cover: String?) -> Self {
        self.cover = cover
        return self
    }

    func with(rating: Double?) -> Self {
        self.rating = rating
        return self
    }

    func with(releaseDate: String?) -> Self {
        guard let releaseDate else {
            return self
        }
        self.releaseDate = Date(serverTime: releaseDate)
        return self
    }

    func with(language: String?) -> Self {
        self.language = language
        return self
    }

    func with(runtime: Int?) -> Self {
        self.runtime = runtime
        return self
    }

    func with(budget: Int?) -> Self {
        self.budget = budget
        return self
    }

    func with(revenue: Int?) -> Self {
        self.revenue = revenue
        return self
    }

    func with(status: String?) -> Self {
        self.status = status
        return self
    }

    func with(adult: Bool?) -> Self {
        self.adult = adult
        return self
    }

    func with(genres: [GenreDTO]) -> Self {
        self.genres = genres.map({ $0.toGenre() })
        return self
    }

    func build() -> Movie {
        .init(
            id: id,
            title: title,
            overview: overview,
            poster: poster,
            cover: cover,
            rating: rating,
            releaseDate: releaseDate,
            language: language,
            runtime: runtime,
            budget: budget,
            revenue: revenue,
            status: status,
            adult: adult,
            genres: genres
        )
    }
}
