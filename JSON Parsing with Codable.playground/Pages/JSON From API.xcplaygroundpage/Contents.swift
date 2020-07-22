/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## JSON From API
At some point in your career you are going to have to fetch or Get some data from an API.  In this section we will create a generic function that you can reuse to fetch the majority of feeds and decode it.
*/
import UIKit
/*:
 ### Create struct for GitHub Follower
 */
struct GHFollower: Decodable {
    var login: String
    var id: Int
}
/*:
### Create create a function that will retrieve the data
*/
enum Errors: Error {
    case badURL
}
func getData<T: Decodable>(from url: String, completion: @escaping (Result<T,Errors>) -> ()) {
    guard let url = URL(string: url) else {
        print("Error while converting Url")
        completion(.failure(.badURL))
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        if let _ = error {
            completion(.failure(.badURL))
        }
        if let data = data {
            let fetchedData = try? JSONDecoder().decode(T.self, from: data)
            if let data = fetchedData {
                completion(.success(data))
            } else {
                completion(.failure(.badURL))
            }
        } else {
            completion(.failure(.badURL))
        }
    }).resume()
}
/*:
### Update the function to use a closure
*/
getData(from: "https://api.github.com/users/atalayasa/followers") { (result: Result<[GHFollower], Errors>) in
    switch result {
    case .success(let data):
        for i in data {
            print("\(i.login)\n")
        }
    case .failure(let error):
        print(error)
    }
}
/*:
### Change the function to use generics
*/

/*:
### Use itunes Store API to find 25 Beatles songs
*/

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
