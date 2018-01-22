//
//  DateFormatter+utils.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 22/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation


struct UtilDates {
    static func date(from dateString: String) -> Date? {
        let formatter = DateFormatter.serverFormat
        return formatter.date(from: dateString)
    }
    
    static func string(from date: Date?) -> String {
        guard let d = date else { return ""}
        let formatter = DateFormatter.viewFormat
        return formatter.string(from: d)
    }
    
    static func date(timestampString: String) -> Date? {
        guard let timestamp = Double(timestampString) else { return nil }
        return Date.init(timeIntervalSince1970: timestamp)
    }
}

extension DateFormatter {
    static let serverFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"   //2017-10-24T15:24:44Z
        return dateFormatter
    }()
    
    static let viewFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter
    }()
}
