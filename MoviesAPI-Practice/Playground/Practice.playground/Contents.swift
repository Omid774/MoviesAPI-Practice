import UIKit

var greeting = "Hello, playground"

// MARK: - Properties

let url = "https://reactnative.dev/movies.json"

// MARK: - Models

struct MovieModel: Decodable {
    let title: String
    let description: String
    let movies: [Movies]
}

struct Movies: Decodable {
    let id: String
    let title: String
    let releaseYear: String
}

// MARK: - Fetch

func fetch() {
    
    guard let url = URL(string: url) else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error { print("There is fetching error: \(error.localizedDescription)") }
        
        guard let data = data else { return }
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(MovieModel.self, from: data)
            print(decodedData)
        } catch {
            print("Error decodeing data.")
        }
        
    }
   
    dataTask.resume()
}

fetch()
