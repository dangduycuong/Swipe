//
//  ViewController.swift
//  Swipe
//
//  Created by cuongdd on 30/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let swipeableView: UIView = {
        // Initialize View
        let view = UIView(frame: CGRect(origin: CGPoint(x: 100, y: 100),
                                        size: CGSize(width: 200.0, height: 200.0)))
        
        // Configure View
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "One Swipe"
        // Add to View Hierarchy
        view.addSubview(swipeableView)
        
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizerDown.direction = .right
        
        // Add Swipe Gesture Recognizer
        swipeableView.addGestureRecognizer(swipeGestureRecognizerDown)
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        // Current Frame
        var frame = swipeableView.frame
        
        // New Frame
        frame.origin.x += 100.0
        
        UIView.animate(withDuration: 0.25) {
            self.swipeableView.frame = frame
        }
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

