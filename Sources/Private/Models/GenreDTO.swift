import Foundation

struct GenreDTO: Decodable {
    let id: Int
    let name: String
}

extension GenreDTO {

    func toGenre() -> Genre {
        return Genre(
            id: id,
            name: name
        )
    }
}
