/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Custom CodingKeys

Some JSON does not immediately conform to the Decodable protocol so you may have to do some extra work with CodingKeys to may the JSON comply.

*/
import UIKit
let booksJSON = """
[
  {
    "feed": {
      "publisher": "Penguin",
      "country": "ca"
    },
    "entry": [
      {
        "author": "Margaret Atwood",
        "nationality": "Canadian"
      },
      {
        "author": "Dan Brown",
        "nationality": "American"
      }
    ]
  },
  {
    "feed": {
      "publisher": "Penguin",
      "country": "ca"
    },
    "entry": {
      "author": "Pierre Burton",
      "nationality": "Canadian"
    }
  }
]
"""

struct Book: Decodable {
    var feed: Feed
    var entry: [Entry]
    
    enum CodingKeys: String, CodingKey {
        case feed, entry
    }
    
    struct Feed: Decodable {
        var publisher: String
        var country: String
    }
    
    struct Entry: Decodable {
        var author: String
        var nationality: String
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        feed = try container.decode(Feed.self, forKey: .feed)
        do {
            entry = try container.decode([Entry].self, forKey: .entry)
        } catch {
            let newValue = try container.decode(Entry.self, forKey: .entry)
            entry = [newValue]
        }
    }
}

let decoder = JSONDecoder()
let data = booksJSON.data(using: .utf8)!
let books = try decoder.decode([Book].self, from: data)
for book in books {
    book.feed.publisher
    for entry in book.entry {
        print(entry.author)
    }
}
/*:
 ### Adding Decodable conformance for Property Wrappers
Property wrappers such as @Published, do not conform to codable
 */
class User: Decodable {
    var name = "Aidan Lynch"
    var age = 27
    
}

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
