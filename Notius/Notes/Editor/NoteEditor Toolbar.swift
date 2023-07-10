import SwiftUI
import ScrechKit

struct NoteEditor_Toolbar: View {
//    @Environment(NavState.self) private var navState
    @Environment(\.modelContext) private var modelContext
    @Bindable private var note: Note
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
#if !os(tvOS)
        ShareLink(item: note.text)
#endif
        
        Menu {
//            MenuButton("Delete", role: .destructive, icon: "trash") {
//                navState.dismiss()
//                modelContext.delete(note)
//            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}

#Preview {
    NoteEditor_Toolbar(previewNote)
}
