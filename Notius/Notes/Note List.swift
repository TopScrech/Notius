import SwiftUI
import SwiftData
import ScrechKit

struct Note_List: View {
    //    @Environment(NavState.self) private var navState
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .default) private var notes: [Note]
    
    @State private var searchField = ""
    @State private var sheetSettings = false
    
    private var filteredNotes: [Note] {
        guard !searchField.isEmpty else { return notes }
        
        return notes.filter {
            $0.text.lowercased()
                .contains(searchField.lowercased())
        }
    }
    
    private var bookmarkedNotes: [Note] {
        filteredNotes.filter {
            $0.is_pinned
        }
    }
    
    private var pinnedNotes: [Note] {
        filteredNotes.filter {
            $0.is_pinned
        }
    }
    
    private var unpinnedNotes: [Note] {
        filteredNotes.filter {
            !$0.is_pinned
        }
        //        .sorted(by: {
        //            $0.modified > $1.modified
        //        })
    }
    
    var body: some View {
        List {
            if !pinnedNotes.isEmpty {
                Section {
                    ForEach(pinnedNotes) { note in
                        NavigationLink {
                            Note_Editor(note)
                        } label: {
                            Note_Item(note)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Pin_Button(note)
                        }
                    }
                    .onDelete(perform: deleteItems)
                } header: {
                    Label("Pinned", systemImage: "bookmark")
                }
            }
            
            ForEach(unpinnedNotes) { note in
                NavigationLink {
                    Note_Editor(note)
                } label: {
                    Note_Item(note)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Pin_Button(note)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle("Notes")
        .searchable(text: $searchField)
        .sheet($sheetSettings) {
            Settings_Parent()
        }
        .overlay(alignment: .bottomTrailing) {
            SFButton("square.and.pencil") {
                addItem()
            }
            .padding()
            .title2(.semibold)
            .foregroundStyle(.yellow)
            .background(.ultraThickMaterial, in: .circle)
            .padding(.horizontal)
        }
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .navigationBarLeading) {
                SFButton("gear") {
                    sheetSettings = true
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
#else
            SFButton("gear") {
                sheetSettings = true
            }
#endif
        }
    }
    
    private func addItem() {
        let newItem = Note(text: "New note")
        modelContext.insert(newItem)
    }
    
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(notes[index])
        }
    }
}

#Preview {
    Note_List()
        .modelContainer(for: Note.self, inMemory: true)
}
