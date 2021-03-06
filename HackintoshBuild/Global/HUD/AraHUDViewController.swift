//
//  AraHUDViewController.swift
//  HackintoshBuild
//
//  Created by 刘靖禹 on 2020/2/4.
//  Copyright © 2020 Arabaku. All rights reserved.
//

import Cocoa

class AraHUDViewController: NSObject {
    
    static let shared = AraHUDViewController()
    
    private var currentHUD: AraHUDView?
    
    func showHUDWithTitle(title: String) {
        if currentHUD != nil {
            currentHUD?.removeFromSuperview()
        }
        
        let nib = NSNib(nibNamed: "AraHUDView", bundle: nil)!
        var myArray: NSArray? = nil
        nib.instantiate(withOwner: nil, topLevelObjects: &myArray)
        guard let objects = myArray else {
            return
        }
        for object in objects {
            if let HUD = object as? AraHUDView {
                currentHUD = HUD
                break
            }
        }
        
        (currentHUD?.viewWithTag(1) as? NSTextField)?.stringValue = title
        currentHUD?.setAccessibilityEnabled(false)
        currentHUD?.frame = (NSApplication.shared.keyWindow?.contentView!.frame)!
        currentHUD?.progressIndicator.startAnimation(nil)
        NSApplication.shared.keyWindow?.contentView?.addSubview(currentHUD!)
    }
    
    func hideHUD() {
        if currentHUD == nil {
            return
        }
        currentHUD?.progressIndicator.stopAnimation(nil)
        self.currentHUD?.removeFromSuperview()
    }
}
