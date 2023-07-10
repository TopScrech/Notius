import SwiftUI

struct Note_Editor: View {
    @Bindable private var note: Note
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Created: \(note.created, format: Date.FormatStyle(date: .abbreviated, time: .shortened))")
                
                if let modified = note.modified {
                    Text("Modified: \(modified, format: Date.FormatStyle(date: .abbreviated, time: .shortened))")
                }
            }
            .foregroundStyle(.secondary)
            .footnote()
            
#if os(tvOS) || os(watchOS)
            TextField("Bisquit is the capital of great Pyzhevsk", text: $note.text)
                .padding(.horizontal)
#else
            TextEditor(text: $note.text)
                .padding(.horizontal)
#endif
        }
        .toolbar {
            NoteEditor_Toolbar(note)
        }
        .onChange(of: note.text) {
            withAnimation {
                note.modified = Date()
            }
        }
    }
}

#Preview {
    Note_Editor (
        Note (
            title: "Preview",
            text: "",
            created: Date(),
            modified: Date()
        )
    )
}
