import Foundation

struct Tea: Identifiable, Codable {
    let id: UUID
    var name: String
    var type: TeaType
    var variant: Int
    var details: TeaDetails
    var notes: String?
    var collectionId: UUID
    var dateAdded: Date
    var isFavorite: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        type: TeaType,
        variant: Int,
        details: TeaDetails,
        notes: String? = nil,
        collectionId: UUID,
        dateAdded: Date = Date(),
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.variant = max(1, min(4, variant))
        self.details = details
        self.notes = notes
        self.collectionId = collectionId
        self.dateAdded = dateAdded
        self.isFavorite = isFavorite
    }
    
    var assetName: String {
        return type.assetName(variant: variant)
    }
}
