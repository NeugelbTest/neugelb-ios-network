import Foundation
import UIKit

public protocol ImageService {

    // MARK: - Image Loading

    /// Fetch an image from the specified path asynchronously.
    ///
    /// - Parameter path: The URL or local path of the image as a `String`.
    /// - Returns: A `UIImage?`, or `nil` if the image could not be loaded.
    /// - Throws: An error if the image loading fails.
    func fetchImage(from path: String) async throws -> UIImage?
}
