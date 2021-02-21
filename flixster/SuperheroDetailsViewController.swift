//
//  SuperheroDetailsViewController.swift
//  flixster
//
//  Created by Okwuolisa Umeokolo on 2/21/21.
//

import UIKit

class SuperheroDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()

        let baseUrl = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)

        posterView.af.setImage(withURL: posterUrl!)

        let backdropPath = movie["backdrop_path"] as? String ?? "?"
        var backdropUrl = URL(string: baseUrl + backdropPath)
        
        // I've added the following line of code because no backdrop
        // image url exists for "The Flash". When backdrop_path is
        // nil, the backdropUrl is set for a poster I found online
        
        if backdropPath == "?" {
            backdropUrl = URL(string: "https://m.media-amazon.com/images/M/MV5BZjhlYmIyNzAtNzJmZC00YTFlLThhNmMtMWFlMDQ0MjAwYjE4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1024_.jpg")
        }
        
        

        backdropView.af.setImage(withURL: backdropUrl!)
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
