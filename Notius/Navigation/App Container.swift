import SwiftUI

struct App_Container: View {
    private var navState = NavState()
    
    var body: some View {
        NavigationStack {
            Note_List()
        }
        .environment(navState)
    }
}
