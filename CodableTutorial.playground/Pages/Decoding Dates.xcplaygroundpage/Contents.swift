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

struct Person: Decodable {
    let id: Int
    let name: String
    let birthday: Date
}

let formatter = DateFormatter()
formatter.dateFormat = "dd-MM-yyyy"
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(formatter)
let personData = personJson.data(using: .utf8)!
let person = try decoder.decode(Person.self, from: personData)
person.birthday

/*:
### Example 2
 Other DateDecodingStrategies
*/
struct Events: Decodable {
    let name: String
    let date: Date
    let website: URL
}

guard let eventsFile = Bundle.main.url(forResource: "Events", withExtension: "json") else { fatalError() }
guard let eventsData = try? Data(contentsOf: eventsFile) else { fatalError() }
let decoder2 = JSONDecoder()
decoder2.dateDecodingStrategy = .secondsSince1970
let events = try! decoder2.decode([Events].self, from: eventsData)

for event in events {
    print(event.name)
    print(event.date)
    print(event.website)
}

