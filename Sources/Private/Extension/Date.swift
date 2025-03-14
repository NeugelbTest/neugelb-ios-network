import Foundation

extension Date {
    init?(serverTime: String?) {
        guard let serverTime else { return nil }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = .current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        guard let date = dateFormatter.date(from: serverTime) else { return nil }
        self = date
    }
}
