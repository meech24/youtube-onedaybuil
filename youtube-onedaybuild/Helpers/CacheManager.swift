//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Demetrice Sims on 11/11/20.
//  Copyright © 2020 Demetrice Sims. All rights reserved.
//

import Foundation

class CacheManager{
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        
        // Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String) -> Data?{
        
        //Try to get the specified data for the url
        return cache[url]
        
    }
}
