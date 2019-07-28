//
//  NoteExtension.swift
//  Note
//
//  Created by Ivan Vasilyev on 01/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import Foundation
import UIKit

extension Note {
    static func parse(json: [String: Any]) -> Note? {
        let uid = json["uid"] as! String
        let title = json["title"] as! String
        let content = json["content"] as! String
        
        let color: UIColor
        if  json["color"] != nil {
            color = json["color"] as! UIColor
        } else {
            color = UIColor.white
        }
        
        let importance: Importance
        if json["importance"] != nil {
            importance = json["importance"] as! Importance
        } else {
            importance = Importance.normal
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let selfDestructionDate: Date?
        if json["selfDestructionDate"] != nil {
            selfDestructionDate = formatter.date(from: json["selfDestructionDate"] as! String)
        } else {
            selfDestructionDate = nil
        }
        
        return Note(
            uid: uid,
            title: title,
            content: content,
            color: color,
            importance: importance,
            selfDestructionDate: selfDestructionDate
        )
    }
    
    var json: [String: Any] {
        get {
            var res = [
                "uid": self.uid,
                "title": self.title,
                "content": self.content
            ]
            
            if (self.color != UIColor.white) {
                res["color"] = getRGBAString(self.color)
            }
            
            
            switch self.importance {
            case .hi: res["importance"] = self.importance.rawValue
            case .low: res["importance"] = self.importance.rawValue
            default:
                break
            }
            
            if (self.selfDestructionDate != nil) {
                res["selfDestructionDate"] = getDateString(self.selfDestructionDate!)
            }
            
            return res
        }
    }
}

func getRGBAString(_ color: UIColor) -> String {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    return "rgba(\(red),\(green),\(blue),\(alpha))"
}

func getDateString(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    return formatter.string(from: date)
}
