//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Apple on 2017/1/4.
//  Copyright © 2017年 Hans. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle // text of outlet videoTitle is set to the videoTitle in the class object
        
        // set image from URL
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async { // create a new thread
            do {
                let data = try Data(contentsOf: url) // download from the internet
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data) // put the image
                }
                
            } catch {
                // handle the error
            }
        }
        
        
    }

}
