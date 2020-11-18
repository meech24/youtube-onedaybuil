//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Demetrice Sims on 8/26/20.
//  Copyright © 2020 Demetrice Sims. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
 
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var model = Model()
    var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set itself as the datasource and the delegate
        
        tableview.dataSource = self
        tableview.delegate = self
        // Set itself as the delegate of the model
        model.delegate = self 
        
        
        model.getVideos()
    }
    
    // Mark: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set our return videos to our video property
        self.videos = videos
        // Refresh the tableview
        
        tableview.reloadData()
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
      
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        //Return the cell
        return cell 
     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

