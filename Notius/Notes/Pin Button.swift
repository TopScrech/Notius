import SwiftUI

struct Pin_Button: View {
    @Bindable private var note: Note
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        Button {
            note.is_pinned.toggle()
        } label : {
            Image(systemName: note.is_pinned ? "bookmark.slash" : "bookmark")
        }
        .tint(.orange)
    }
}

#Preview {
    Pin_Button(previewNote)
}
