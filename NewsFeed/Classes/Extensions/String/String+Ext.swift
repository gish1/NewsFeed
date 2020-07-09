//
//  String+Ext.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

extension String {
    var first: String {
        return String(prefix(1))
    }
    var uppercasedFirst: String {
        return first.uppercased() + String(dropFirst())
    }
    var stringDate: String {
        return createDate(string: self)
    }
}

extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func createDate(string: String?) ->String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "E, d MMM yyyy HH:mm:ss Z"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yy HH:mm"

        if let date = dateFormatterGet.date(from: string ?? "") {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
        }
    }
}
