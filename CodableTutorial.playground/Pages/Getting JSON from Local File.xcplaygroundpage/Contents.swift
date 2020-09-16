/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Getting JSON from Local File
You may wish to seed your structs or classes from JSON files that you have stored in the Application Bundle.  Or, you may have stored some JSN in the applications Documents folder and want to restore from that JSON.  This section will show you how to retrive and decode JSON from a file.
*/
import UIKit
/*:
 ### Build the Decodable Model based on the Prettyfied FlatColors.json
 */
struct ColorPalette: Decodable {
    struct PaletteColor: Decodable {
        let sort_order: Int
        let description: String
        let red: Int
        let blue: Int
        let green: Int
        let alpha: Int
    }
    let palette_name: String
    let palette_info: String
    let palette_colors: [PaletteColor]
}

guard let sourcesURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else { fatalError() }
guard let colorData = try? Data(contentsOf: sourcesURL) else { fatalError() }
let decoder = JSONDecoder()
guard let flatColors = try? decoder.decode(ColorPalette.self, from: colorData) else { fatalError() }
print(flatColors.palette_name)
for color in flatColors.palette_colors {
    print(color.description)
}
/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
