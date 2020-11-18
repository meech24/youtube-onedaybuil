//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Demetrice Sims on 10/12/20.
//  Copyright © 2020 Demetrice Sims. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items:[Video]?
    
    enum CodingKeys:String, CodingKey{
        
        case items
    }
    
    init (from decoder: Decoder) throws{
        let container = try
            decoder.container(keyedBy: CodingKeys.self)
        
        self.items =  try container.decode([Video].self, forKey: .items)
    }
}
