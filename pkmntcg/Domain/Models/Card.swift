import Foundation

struct Card {
    let category: String
    let id: String
    let illustrator: String
    let imageBaseURL: URL?
    let localId: String
    let name: String
    let rarity: String
    let set: CardSet
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
