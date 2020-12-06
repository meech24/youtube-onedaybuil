//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Demetrice Sims on 8/31/20.
//  Copyright © 2020 Demetrice Sims. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyBUIf3CXDdDxU9geFNlaad17Kna757xASo"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
