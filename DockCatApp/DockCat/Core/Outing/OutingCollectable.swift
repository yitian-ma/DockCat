import Foundation

struct OutingCollectable: Codable, Equatable, Identifiable {
    var id: String
    var chineseName: String
    var englishName: String
    var rarity: Int
    var author: String
    var imagePath: String
    var isRetired: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case chineseName = "chinese_name"
        case englishName = "english_name"
        case rarity
        case author
        case imagePath = "image_path"
        case isRetired = "retired"
    }

    init(
        id: String,
        chineseName: String,
        englishName: String,
        rarity: Int,
        author: String,
        imagePath: String,
        isRetired: Bool = false
    ) {
        self.id = id
        self.chineseName = chineseName
        self.englishName = englishName
        self.rarity = rarity
        self.author = author
        self.imagePath = imagePath
        self.isRetired = isRetired
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        chineseName = try container.decode(String.self, forKey: .chineseName)
        englishName = try container.decode(String.self, forKey: .englishName)
        rarity = try container.decode(Int.self, forKey: .rarity)
        author = try container.decode(String.self, forKey: .author)
        imagePath = try container.decode(String.self, forKey: .imagePath)
        isRetired = try container.decodeIfPresent(Bool.self, forKey: .isRetired) ?? false
    }
}
