//: [Previous](@previous)

import Foundation

/// https://williamboles.me/sneaky-date-formatters-exposing-more-than-you-think/
private protocol DateFormatterType {
    func string(from date: Date) -> String
}

extension DateFormatter: DateFormatterType { }

class CachedDateFormattingHelper {
    
    // MARK: - Shared
    
    static let shared = CachedDateFormattingHelper()
    
    // MARK: - Queue
    
    let cachedDateFormattersQueue = DispatchQueue(label: "com.suggesto.date.formatter.queue")
    
    // MARK: - Cached Formatters
    
    private var cachedDateFormatters = [String: DateFormatterType]()
    
    private func cachedDateFormatter(withFormat format: String) -> DateFormatterType {
        return cachedDateFormattersQueue.sync {
            let key = format
            if let cachedFormatter = cachedDateFormatters[key] {
                return cachedFormatter
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = format
            
            cachedDateFormatters[key] = dateFormatter
            
            return dateFormatter
        }
    }
    
    // MARK: - DOB
    
    func formatDOBDate(_ date: Date) -> String {
        let dateFormatter = cachedDateFormatter(withFormat: "dd/MM/yyyy")
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    // MARK: - Account
    
    func formatLastActiveDate(_ date: Date, now: Date = Date()) -> String {
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now)!
        
        var dateFormatter = cachedDateFormatter(withFormat: "dd MMM @ HH:mm")
        if date > yesterday {
            dateFormatter = cachedDateFormatter(withFormat: "HH:mm")
        }
        
        let formattedDate = dateFormatter.string(from: date)
        return ("Last active: \(formattedDate)")
    }
    
    // MARK: - Post
    
    func formatPostCreatedDate(_ date: Date) -> String {
        let dateFormatter = cachedDateFormatter(withFormat: "d MMM 'of' y")
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    // MARK: - Commenting
    
    func formatCommentedDate(_ date: Date) -> String {
        let dateFormatter = cachedDateFormatter(withFormat: "dd MMM @ HH:mm")
        let formattedDate = dateFormatter.string(from: date)
        return ("Comment posted: \(formattedDate)")
    }
}


