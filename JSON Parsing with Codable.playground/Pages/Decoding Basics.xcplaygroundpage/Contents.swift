 import UIKit
/*:
 ### Simple Objects
 */
let person1JSON = """
{
    "name": "James",
    "age": 45,
    "gender": "Male",
    "sign": "Sagitarius",
    "partner": "Emily",
    "isEmployed": true
}
"""

 struct Person: Codable {
    var name: String
    var age: Int
    var gender: String
    var sign: String
    var partner: String?
    var isEmployed: Bool
 }
 
 let decoder = JSONDecoder()
 let data = person1JSON.data(using: .utf8)
 let person1 = try decoder.decode(Person.self, from: data!)
 
 extension Person: CustomStringConvertible {
    var description: String {
        return "Person name is \(name)\nage is \(age)\n gender is \(gender)\nsign is \(sign)\nemployment status is \(isEmployed)\npartner is \(partner ?? "Partner nil") \n\n"
    }
 }
 
 print(person1)
 
let person2JSON = """
{
    "name": "Mary",
    "age": 45,
    "gender": "Female",
    "sign": "Taurus",
    "isEmployed": false
}
"""

 let person2Data = person2JSON.data(using: .utf8)
 let person2 = try decoder.decode(Person.self, from: person2Data!)
 print(person2)
/*:
 ### Arrays
*/
let personsJSON = """
[
    {
        "name": "James",
        "age": 45,
        "gender": "Male",
        "sign": "Sagitarius",
        "partner": "Emily",
        "isEmployed": true
    },
    {
        "name": "Mary",
        "age": 45,
        "gender": "Female",
        "sign": "Taurus",
        "isEmployed": false
    }
]
"""

 let personsData = personsJSON.data(using: .utf8)
 let persons = try decoder.decode([Person].self, from: personsData!)
 print("person array \(persons[0])")
/*:
 #### More Complex Objects
 */
let familyJSON = """
{
    "familyName": "Smith",
    "members": [
        {
            "name": "James",
            "age": 45,
            "gender": "Male",
            "sign": "Sagitarius",
            "partner": "Emily",
            "isEmployed": true
        },
        {
            "name": "Mary",
            "age": 45,
            "gender": "Female",
            "sign": "Taurus",
            "isEmployed": false
        }
    ]
}
"""

 struct Family: Codable {
    enum Gender: String, Codable {
        case Male, Female
    }
    var familyName: String
    var members: [Person]
    struct Person: Codable {
       var name: String
       var age: Int
       var gender: Gender
       var sign: String
       var partner: String?
       var isEmployed: Bool
    }
 }
 
 let familyData = familyJSON.data(using: .utf8)
 let family = try decoder.decode(Family.self, from: familyData!)
 print("Family name is \(family.familyName) \(family.members[1].sign) gender is \(family.members[1].gender.rawValue)") // Smith and Taurus
/*:
 ## A Better model
 */

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
