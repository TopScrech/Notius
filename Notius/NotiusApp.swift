import SwiftUI
import SwiftData
import ScrechKit

@main
struct NotiusApp: App {
    var body: some Scene {
        WindowGroup {
            App_Container()
        }
        .modelContainer(for: Note.self)
    }
}
