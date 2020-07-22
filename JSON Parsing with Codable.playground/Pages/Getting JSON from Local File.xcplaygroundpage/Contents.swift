/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Getting JSON from Local File
You may wish to seed your structs or classes from JSON files that you have stored in the Application Bundle.  Or, you may have stored some JSN in the applications Documents folder and want to restore from that JSON.  This section will show you how to retrive and decode JSON from a file.
*/
import UIKit
/*:
 ### Build the Decodable Model based on the Prettyfied FlatColors.json
 */
struct FlatColors: Decodable {
    var paletteName: String
    var paletteInfo: String
    var paletteColors: [PaletteColors]
    
    struct PaletteColors: Decodable {
        var sortOrder: Int
        var description: String
        var red: Int
        var green: Int
        var blue: Int
        var alpha: Int
    }
}

let localFile = Bundle.main.url(forResource: "FlatColors", withExtension: "json")
let data = try Data(contentsOf: localFile!)
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let flatColors = try decoder.decode(FlatColors.self, from: data)
flatColors.paletteName // Flat colurs
flatColors.paletteInfo // For Design
flatColors.paletteColors.first!.green // 186
flatColors.paletteColors[2].blue // 217
/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
