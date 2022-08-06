//
//  DetailsViewController.swift
//  MemesProject
//
//  Created by Raşit Kaplan on 5.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var imageURL = "https://i.imgflip.com/30b1gx.jpg"
    var memesdata : Meme?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = memesdata?.name
        imageView.kf.setImage(with: URL(string: memesdata?.url ?? ""))
    }

}
