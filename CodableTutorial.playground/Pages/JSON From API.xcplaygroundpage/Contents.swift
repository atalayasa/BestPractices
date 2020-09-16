/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## JSON From API
At some point in your career you are going to have to fetch or Get some data from an API.  In this section we will create a generic function that you can reuse to fetch the majority of feeds and decode it.
*/
import UIKit
// https://api.github.com/users/twostraws/followers
/*:
 ### Create struct for GitHub Follower
 */
struct Follower: Decodable {
    let login: String
    let id: Int
}
/*:
### Create create a function that will retrieve the data
*/
//func getJSON() {
//    guard let url = URL(string: "https://api.github.com/users/twostraws/followers") else {
//        return
//    }
//    let request = URLRequest(url: url)
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//
//        guard let data = data else {
//            return
//        }
//
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode([Follower].self, from: data) else {
//            return
//        }
//
//        let followers = decodedData
//        for follower in followers {
//            print(follower.login)
//            print(follower.id)
//        }
//    }.resume()
//}
/*:
### Update the function to use a closure
*/

//func getJSON(urlString: String, completion: @escaping ([Follower]?) -> Void) {
//    guard let url = URL(string: urlString) else {
//        return
//    }
//    let request = URLRequest(url: url)
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completion(nil)
//            return
//        }
//
//        guard let data = data else {
//            return
//        }
//
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode([Follower].self, from: data) else {
//            completion(nil)
//            return
//        }
//        completion(decodedData)
//    }.resume()
//}
//
//
//getJSON(urlString: "https://api.github.com/users/twostraws/followers") { (followers) in
//    guard let followers = followers else { return }
//    for follower in followers {
//        print(follower.login)
//        print(follower.id)
//    }
//}


/*:
### Change the function to use generics
*/
enum NetworkError: Error {
    case badURL
    case decodingError
}

func getJSON<T:Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
    guard let url = URL(string: urlString) else {
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print(error.localizedDescription)
            completion(.failure(.badURL))
            return
        }
        
        guard let data = data else {
            return
        }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            completion(.failure(.decodingError))
            return
        }
        completion(.success(decodedData))
    }.resume()
}


getJSON(urlString: "https://api.github.com/users/twostraws/followers") { ( result: Result<[Follower], NetworkError>) in
    switch result {
    case .success(let followers):
        for follower in followers {
            print(follower.login)
        }
    case .failure(let error):
        print(error.localizedDescription)
    }
}
/*:
### Use itunes Store API to find 25 Beatles songs
*/

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
