/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## CodingKeys
If your classes or structures use differnt property names than what the feed contains, you are going to have to map the keys to the class or struct property names.
*/
import UIKit
struct ColorPalette: Decodable {
    struct PaletteColor: Decodable {
        let sortOrder: Int
        let description: String
        let red: Int
        let green: Int
        let blue: Int
        let alpha: Double
    }
    let name: String
    let info: String
    let colors: [PaletteColor]
}

extension ColorPalette {
    enum CodingKeys: String, CodingKey {
        case name = "palette_name"
        case info = "palette_info"
        case colors = "palette_colors"
    }
}

extension ColorPalette.PaletteColor {
    enum CodingKeys: String, CodingKey {
        case sortOrder = "sort_order"
        case description
        case red
        case green
        case blue
        case alpha
    }
}
guard let sourcesURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else {
    fatalError("Could not find FlatColors.json")
}
guard let colorData = try? Data(contentsOf: sourcesURL) else {
    fatalError("Could not conver data")
}

let decoder = JSONDecoder()
guard let flatColors = try? decoder.decode(ColorPalette.self, from: colorData) else {
    fatalError("There was a problem decoding the data....")
}
print(flatColors.name)
for color in flatColors.colors {
    print(color.description)
}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
