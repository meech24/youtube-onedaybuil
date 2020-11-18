//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Demetrice Sims on 10/28/20.
//  Copyright © 2020 Demetrice Sims. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video){
        
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else{
            return
        }
        
        // Set the title
        
        self.titleLabel.text = video?.title
        
        // set the date
        let df = DateFormatter()
        
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the Thumbnail
        guard self.video!.thumbnail != "" else{
                return
        }
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            // Set the thumbnail imageView
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get shared URL Session object
        let session = URLSession.shared
        
        // Creat a data Task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                //Save the Data in Cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                //check to see if download url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail{
                    //Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                //creat the image object
                let image = UIImage(data: data!)
                
                //Set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
            
        }
        // Start data task
        dataTask.resume()
    }

}
