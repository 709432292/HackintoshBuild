//
//  ViewControllerIoreg.swift
//  HackintoshBuild
//
//  Created by bugprogrammer on 2020/2/12.
//  Copyright © 2020 bugprogrammer. All rights reserved.
//

import Cocoa
import WebKit

class ViewControllerIoreg: NSViewController {
    
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var medolBox: NSPopUpButtonCell!
    
    var medolList: [String] =
    [
    "MacPro6,1",
    "MacPro5,1",
    "MacPro4,1",
    "MacPro3,1",
    "MacMini8,1",
    "MacMini7,1",
    "MacBookPro14,1",
    "MacBookPro13,3",
    "MacBookPro12,1",
    "MacBookPro11,3",
    "MacBookPro11,2",
    "MacBookPro10,1",
    "MacBook8,1",
    "iMac19,1",
    "iMac18,3",
    "iMac17,1",
    "iMac16,2",
    "iMac16,1",
    "iMac15,1",
    "iMac14,1",
    "iMac13,2"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        medolBox.addItems(withTitles: medolList)
        medolBox.selectItem(at: 0)
        loadWeb("https://ioregs.bugprogrammer.me/" + medolList[0] + "-IORegFileViewer.html")
    }
    
    @IBAction func selectedMedol(_ sender: NSPopUpButtonCell) {
        loadWeb("https://ioregs.bugprogrammer.me/" + medolList[sender.indexOfSelectedItem] + "-IORegFileViewer.html")
    }
    
    func loadWeb(_ name: String) {
        let ioregs = URL(string: name)
        let request = URLRequest(url: ioregs!)
        webview.load(request)
    }
    
}
