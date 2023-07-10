import SwiftUI
import SwiftData
import ScrechKit

@main
struct NotiusApp: App {
    @Environment(\.undoManager) var undoManager
    
    var body: some Scene {
        WindowGroup {
            App_Container()
        }
        .modelContainer(for: Note.self, isUndoEnabled: true)
    }
}
