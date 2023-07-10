import Foundation
import SwiftData

@Model
final class Note {
    var title: String = "New Note"
    var text: String = ""
    var is_pinned: Bool = false
    var is_locked: Bool = false
    let created: Date = Date()
    var modified: Date?
    
    init (
        title: String = "New Note",
        text: String,
        is_pinned: Bool = false,
        is_locked: Bool = false,
        created: Date = Date(),
        modified: Date? = nil
    ) {
        self.title = title
        self.text = text
        self.is_pinned = is_pinned
        self.is_locked = is_locked
        self.created = created
        self.modified = modified
    }
}
