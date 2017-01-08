//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Apple on 2017/1/4.
//  Copyright © 2017年 Hans. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource { // protocols that need to be implemented
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoURLTest1 = "<iframe width='560' height='315' src='https://www.youtube.com/embed/ev4bY1SkZLg' frameborder='0' allowfullscreen></iframe>"
        let imageURLTest1 = "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg"
        let videoURLTest2 = "<iframe width='560' height='315' src='https://www.youtube.com/embed/1w9DiGlZksU' frameborder='0' allowfullscreen></iframe>"
        let imageURLTest2 = "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg"
        let videoURLTest3 = "<iframe width='560' height='315' src='https://www.youtube.com/embed/vg_nvEGryA4' frameborder='0' allowfullscreen></iframe>"
        let imageURLTest3 = "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg"
        let videoURLTest4 = "<iframe width='560' height='315' src='https://www.youtube.com/embed/gZIqW92GaTQ' frameborder='0' allowfullscreen></iframe>"
        let imageURLTest4 = "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg"
        let videoURLTest5 = "<iframe width='560' height='315' src='https://www.youtube.com/embed/tWyuglGCKgE' frameborder='0' allowfullscreen></iframe>"
        let imageURLTest5 = "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg"
        
        let p1 = PartyRock(imageURL: imageURLTest1, videoURL: videoURLTest1, videoTitle: "Lights Out")
        let p2 = PartyRock(imageURL: imageURLTest2, videoURL: videoURLTest2, videoTitle: "Let's Get Ridiculous")
        let p3 = PartyRock(imageURL: imageURLTest3, videoURL: videoURLTest3, videoTitle: "Juicy Wiggle Lesson")
        let p4 = PartyRock(imageURL: imageURLTest4, videoURL: videoURLTest4, videoTitle: "Party Rock Commercial")
        let p5 = PartyRock(imageURL: imageURLTest5, videoURL: videoURLTest5, videoTitle: "Juicy Wiggle")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self   // when table view is doing work, call the functions in this class
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            // get the new partyRock
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock) // update the UI
            return cell
        }
        
        else {
            return UITableViewCell() // shouldn't go here
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count // we want as many items as possible
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock) // transferring data from one view to the other
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let partyRock = sender as? PartyRock {
                destination.partyRock = partyRock // partyRock at destination is going to be loaded in
            }
        }
    }



}

