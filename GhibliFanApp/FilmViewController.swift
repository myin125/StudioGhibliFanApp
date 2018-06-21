//
//  FilmViewController.swift
//  GhibliFanApp
//
//  Created by Maryann Yin on 6/19/18.
//  Copyright © 2018 Maryann Yin. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var filmTableView: UITableView!
    
    var ghibliMovies = [GhibliFilm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.filmTableView.reloadData()
        }
        filmTableView.delegate = self
        filmTableView.dataSource = self
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.ghibliMovies = try JSONDecoder().decode([GhibliFilm].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ghibliMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = ghibliMovies[indexPath.row]
        let filmCell = filmTableView.dequeueReusableCell(withIdentifier: "filmCell") as! FilmTableViewCell
        filmCell.movieTitleLabel.text = film.title
        filmCell.movieImage.image = UIImage(named: film.id)
        return filmCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FilmDetailViewController {
            destination.movie = ghibliMovies[(filmTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
}
