import SwiftUI

struct Note_Item: View {
    private let note: Note
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.text)
                .lineLimit(1)
            
            if let modified = note.modified {
                Text(modified, format: .dateTime)
                    .footnote()
                    .foregroundStyle(.secondary)
            } else {
                Text(note.created, format: .dateTime)
                    .footnote()
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    Note_Item(previewNote)
}
