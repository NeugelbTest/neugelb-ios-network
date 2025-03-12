import Foundation

extension Date {

    init(_ serverTime: String) {
        
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale     = Locale.current
        dateFormatter.timeZone   = TimeZone(abbreviation: "UTC")
        self = dateFormatter.date(from: serverTime)!
    }
}

