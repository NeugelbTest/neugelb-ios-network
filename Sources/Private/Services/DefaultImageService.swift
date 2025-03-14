import Foundation
import UIKit

final class DefaultImageService {

    private let networkManager: NetworkService
    private let folder = "poster"

    init(networkManager: NetworkService = DefaultNetworkService()) {
        self.networkManager = networkManager
    }
}

extension DefaultImageService: ImageService {

    func fetchImage(from path: String) async throws -> UIImage? {

        guard let url = URL(string: path) else { return nil }
        let imageName = url.lastPathComponent
        // print("folder: \(folder), imageName: \(imageName)")

        if let savedImage = await loadLocalImage(from: imageName) {
            // print("ImageService: Retrieved image from File Manager!")
            return savedImage
        } else {
            print("ImageService: Downloading Image")
            return await downloadImage(from: path, imageName: imageName)
        }
    }

    private func loadLocalImage(from imageName: String) async -> UIImage? {

        guard let savedImage = await LocalFileManager.shared.getImage(imageName: imageName, folderName: folder) else {
            return nil
        }
        return savedImage
    }

    private func downloadImage(from path: String, imageName: String) async -> UIImage? {

        guard let data = try? await networkManager.fetchImage(from: path) else { return nil }
        guard let image = UIImage(data: data) else { return nil }
        await LocalFileManager.shared.saveImage(image: image, imageName: imageName, folderName: folder)
        return image
    }
}
