struct Card: Codable {
    let category: String
    let id: String
    let illustrator: String
    let image: String
    let localId: String
    let name: String
    let rarity: String
    let set: Set
    let variants: Variants
    let hp: Int
    let types: [String]
    let evolveFrom: String?
    let description: String
    let stage: String
    let attacks: [Attack]
    let weaknesses: [Weakness]
    let retreat: Int
    let regulationMark: String
    let legal: Legal
}

struct Legal: Codable {
    let standard: Bool
    let expanded: Bool
}
