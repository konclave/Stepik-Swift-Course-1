//
//  FileNotebook.swift
//  Note
//
//  Created by Ivan Vasilyev on 01/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import Foundation

class FileNotebook {
    var notes: [Note]
    
    private let filename: String = "notes.json"
    
    init(notes: [Note]) {
        self.notes = notes
    }
    
    public func add(_ note: Note) {
        notes.append(note)
    }
    
    public func remove(with uid:String) {
        notes = notes.filter { $0.uid != uid }
    }
    
    public func saveToFile() {
        let file = self.getFile()
        
        do {
            let json = try JSONSerialization.data(withJSONObject: self.notes, options: [])
            try json.write(to: file)
        } catch {
            
        }
    }
    
    public func loadFromFile() {
        let fileURL = self.getFile()
        
        do {
            let json = try Data(contentsOf: fileURL, options: .mappedIfSafe)
            let notes = try JSONSerialization.jsonObject(with: json, options:[]) as! [[String: Any]]
            self.notes.removeAll();
            for note in notes {
                self.notes.append(Note.parse(json: note)!)
            }
        } catch {
            
        }
    }
    
    private func getFile() -> URL {
        let path = FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
            ).first
        
        return path!.appendingPathComponent(self.filename)
    }
}
