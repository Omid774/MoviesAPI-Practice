import UIKit

var greeting = "Hello, playground"

let url = "https://reactnative.dev/movies.json"

func fetch() {
    
    guard let url = URL(string: url) else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error {
            print("Error in fetching: \(error.localizedDescription)")
        }
        
        guard let data = data else { return }
        
        print(data)
        
    }
    
    dataTask.resume()
}

fetch()

