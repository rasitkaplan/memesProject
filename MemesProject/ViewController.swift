//
//  ViewController.swift
//  MemesProject
//
//  Created by Raşit Kaplan on 5.08.2022.
//

import UIKit
import Alamofire
import Kingfisher


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var memesdata : Memes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MemesTableViewCell", bundle: nil), forCellReuseIdentifier: "MemesTableViewCell")
        getMemes()
    }

    // MARK: Fetch Data Methods
    func getMemes() {
        
        
        let url = "https://api.imgflip.com/get_memes"
        AF.request(url, method: .get,
                   parameters: nil,
                   encoding: URLEncoding(destination: .queryString)).response { (response) in
            if let data = response.data {
                do {
                    let memesJson = try JSONDecoder.init().decode(Memes.self, from: data)
                    self.memesdata = memesJson
                    self.tableView.reloadData()
                } catch {
                    print(error.localizedDescription)
                    print(error)
                }
            }
        }
    }

}

// MARK: - TableView Functions
extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memesdata?.data?.memes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemesTableViewCell", for: indexPath) as! MemesTableViewCell
        cell.memesNameLabel.text = memesdata?.data?.memes?[indexPath.row].name
        cell.memesİmageView.kf.setImage(with: URL(string: memesdata?.data?.memes![indexPath.row].url ?? ""))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        vc.memesdata = self.memesdata?.data?.memes?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
