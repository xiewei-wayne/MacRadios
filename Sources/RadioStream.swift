//
//  RadioStream.swift
//  Radios
//
//  Created by Wayne on 2019/1/16.
//  Copyright © 2019 xiewei.max@gmail.com. All rights reserved.
//

import Foundation

struct RadioStream {
	var name: String
	var url: String
}

var radioArray: [RadioStream] = [
	RadioStream(name: "BBC1", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p" ),
	RadioStream(name: "BBC2", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio2_mf_p" ),
	RadioStream(name: "BBC3", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p" ),
	RadioStream(name: "BBC4", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p" ),
	RadioStream(name: "BBC5", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5live_mf_p" ),
	RadioStream(name: "BBC6", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p" ),
	RadioStream(name: "BBC1x", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p" ),
	RadioStream(name: "BBC5x", url: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5extra_mf_p" ),
]
