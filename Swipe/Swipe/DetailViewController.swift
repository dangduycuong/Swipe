//
//  DetailViewController.swift
//  Swipe
//
//  Created by cuongdd on 30/08/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
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
        title = "Multiple Swipe"
        
        // Add to View Hierarchy
        view.addSubview(swipeableView)
        
        // Create Swipe Gesture Recognizers
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
        
        // Create Swipe Gesture Recognizers for super view
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizer.direction = direction
        
        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        // Current Frame
        var frame = swipeableView.frame
        
        switch sender.direction {
        case .up:
            frame.origin.y -= 100.0
        case .down:
            frame.origin.y += 100.0
        case .left:
            frame.origin.x -= 100.0
        case .right:
            frame.origin.x += 100.0
        default:
            break
        }
        
        UIView.animate(withDuration: 0.25) {
            self.swipeableView.frame = frame
        }
    }
    
}
