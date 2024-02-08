//
//  ViewController.swift
//  MoviesAPI-Practice
//
//  Created by Omid Heydarzadeh on 2/7/24.
//

import UIKit

class ViewController: UIViewController {
    var desiredURL = "https://www.save-free.com/cdn/https://instagram.fjdf7-1.fna.fbcdn.net/v/t51.2885-19/365431917_815678320106123_5690402445351449711_n.jpg?_nc_ht=instagram.fjdf7-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=j2T4CGD_27gAX_kqb6W&edm=AEF8tYYBAAAA&ccb=7-5&oh=00_AfB2SbY99bBcdGwBP69nFjCRhx-0ZXICiTafhBzWOXwb-A&oe=65CA04C3&_nc_sid=1e20d2"
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchImage()
    }
    
    

    // MARK: - Fetch

    func fetchImage() {
        
        guard let url = URL(string: desiredURL) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print("there is an fetching error: \(error.localizedDescription)")
            }
            
            guard let data = data else { return }
            
            print(data)
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
            
        }
        
        dataTask.resume()
    }
}

