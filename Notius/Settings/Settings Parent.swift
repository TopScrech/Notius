import SwiftUI

struct Settings_Parent: View {
    var body: some View {
#if os(watchOS)
        Settings()
#else
        NavigationView {
            Settings()
        }
#endif
    }
}

#Preview {
    Settings_Parent()
}
