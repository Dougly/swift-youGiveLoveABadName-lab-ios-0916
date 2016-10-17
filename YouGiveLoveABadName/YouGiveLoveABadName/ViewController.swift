//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bonJoviImageView: UIImageView!
    
    var height: NSLayoutConstraint!
    var width: NSLayoutConstraint!
    
    var heightAfterExpanded: NSLayoutConstraint!
    var imageExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bonJoviImageView.translatesAutoresizingMaskIntoConstraints = false
        bonJoviImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bonJoviImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        width = bonJoviImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        width.isActive = true
        height = bonJoviImageView.heightAnchor.constraint(equalTo: self.bonJoviImageView.widthAnchor, multiplier: 310/466)
        width.isActive = true
        height.identifier = "height"
        
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        
        if !imageExpanded {
            expandImage(image: bonJoviImageView, heightConstraint: height)
        } else if imageExpanded {
            shrinkImage(image: bonJoviImageView, heightConstraint: height)
        }
    

    }
    
    func expandImage(image: UIImageView, heightConstraint: NSLayoutConstraint) {
        var newHeightConstraint = heightConstraint
        UIView.animateKeyframes(withDuration: 0.6, delay: 0.0, options: .allowUserInteraction, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                heightConstraint.isActive = false
                newHeightConstraint = image.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 310/500)
                newHeightConstraint.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5, animations: {
                newHeightConstraint.isActive = false
                newHeightConstraint = image.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.3)
                newHeightConstraint.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                newHeightConstraint.isActive = false
                self.height = image.heightAnchor.constraint(equalTo: self.view.heightAnchor)
                self.height.isActive = true
                self.view.layoutIfNeeded()
            })
            
            
            }, completion: nil)
        
        imageExpanded = true
    }
    
    func shrinkImage(image: UIImageView, heightConstraint: NSLayoutConstraint) {
        var newHeightConstraint = heightConstraint
        
        UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: .allowUserInteraction, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: { 
                self.height.isActive = false
                newHeightConstraint = image.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.3)
                newHeightConstraint.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5, animations: { 
                newHeightConstraint.isActive = false
                newHeightConstraint = image.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 310/500)
                newHeightConstraint.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: { 
                newHeightConstraint.isActive = false
                self.height = image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 310/466)
                self.height.isActive = true
                self.view.layoutIfNeeded()
            })
            
            }, completion: nil)
        
        imageExpanded = false
    }
    
}











