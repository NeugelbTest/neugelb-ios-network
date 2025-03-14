import Foundation

public struct Movie: Hashable, Identifiable {

    public let id: Int
    public let title: String
    public let overview: String
    public let poster: String?
    public let cover: String?
    public let rating: Double?
    public let releaseDate: Date
    public let language: String?
    public var runtime: Int?
    public var budget: Int?
    public var revenue: Int?
    public var status: String?
    public var adult: Bool?
    public var genres: [Genre] = []
}
