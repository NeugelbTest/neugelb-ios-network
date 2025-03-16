import Foundation

extension String {
    func getLanguageNameFromCode() -> String? {
        let locale = Locale(identifier: "en")
        return locale.localizedString(forLanguageCode: self)
    }
}


