/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Decoding Dates
There are many ways to represent a date on the Internet.  ISO-8601 is the most command and Decodable is able to handle dates that are in that format. but what if you have a date in your JSON file or fee that is a differen format?
*/
import UIKit// Consider this json code snippet
/*:
 ### Example 1
 DateFormatter strategy
 */
let personJson = """
{
  "id" : 7,
  "name" : "Aidan Lynch",
  "birthday" : "27-03-1993",
}
"""
struct Person: Codable {
    var id: Int
    var name: String
    var birthday: Date
}
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd-MM-yyyy"
let decoder = JSONDecoder()
let data = personJson.data(using: .utf8)!
decoder.dateDecodingStrategy = .formatted(dateFormatter)
let person = try decoder.decode(Person.self, from: data)
print(dateFormatter.string(from: person.birthday))
/*:
### Example 2
 Other DateDecodingStrategies
*/


