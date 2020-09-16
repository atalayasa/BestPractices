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

let person2JSON = """
{
    "name": "Mary",
    "age": 45,
    "gender": "Female",
    "sign": "Taurus",
    "isEmployed": false
}
"""

 struct Person: Decodable {
    let name: String
    let age: Int
    let gender: String
    let partner: String?
    let isEmployed: Bool
 }
 
 let decoder = JSONDecoder()
 let person1Data = person1JSON.data(using: .utf8)!
 let person2Data = person2JSON.data(using: .utf8)!
    do {
        let person1 = try decoder.decode(Person.self, from: person1Data)
        let person2 = try decoder.decode(Person.self, from: person2Data)
        person1.name
        person1.age
        person1.partner
        
        person2.name
        person2.age
        person2.partner
    } catch {
        print(error.localizedDescription)
    }

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

 let personsJsonData = personsJSON.data(using: .utf8)!
 let personsArray = try! decoder.decode([Person].self, from: personsJsonData)
 for person in personsArray {
//    print("\(person.name)'s name and partner is \(person.partner)")
 }
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

 struct Family: Decodable {
    let familyName: String
    let members: [Person]
 }
 
 let familyJsonData = familyJSON.data(using: .utf8)!
 let family = try! decoder.decode(Family.self, from: familyJsonData)
 family.familyName
 family.members.first!.name

/*:
 ## A Better model
 */
 struct Family2: Decodable {
    enum Gender: String, Decodable {
        case Male, Female, Other
    }
    struct Person: Decodable {
       let name: String
       let age: Int
       let gender: Gender
       let partner: String?
       let isEmployed: Bool
    }
    let familyName: String
    let members: [Person]
 }
 
 let family2 = try! decoder.decode(Family.self, from: familyJsonData)
 family2.familyName
 family2.members.first!.name
 family2.members.first!.gender
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
