//
//  ViewController.swift
//  proto-chain-animations-ios
//
//  Created by Santosh Krishnamurthy on 3/16/23.
//

import UIKit

class ViewController: UIViewController {

    // Create UI lable
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func setupLabels() {
        // Do any additional setup after loading the view.
        
        // set background color

        titleLabel.text = "Welcome to company XYZ"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.text = "Hello there! Thank you for downloading the app and giving us a try"
        bodyLabel.numberOfLines = 0
    }
    
    fileprivate func setupStackView() {
        // Create stackview with subviews
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        // set the alignment of subviews
        stackView.axis = .vertical
        
        // add some spacing between items in stack view
        stackView.spacing = 8
        
        // set the size of the stack view
        // stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        
        // add stackview as subview
        view.addSubview(stackView)
        
        
        // setting up auto layout for stack view to make it center align withing view
        // below flag enables auto-layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // align the stack view to the center of view
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupStackView()
        
        // Create and add a gesture recognizer
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
        
    }

    @objc func handleTapGesture(gesture: UITapGestureRecognizer){
        print("Tap recognized")
        print(self.titleLabel.frame)
        // Add animation to move the label left by 30 points
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { done in
            print("Animation 1 complete")
            print("\(self.titleLabel.frame) vs \(self.titleLabel.transform)")
            // Perform new animtion upon completion of first animation
            // move the label higher and make alpha 0
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                self.titleLabel.alpha = 0
                // self.titleLabel.transform = CGAffineTransform(translationX: self.titleLabel.frame.origin.x, y: -100)
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -100)
            } completion: { done in
                print("Animation 2 complete")
                print(self.titleLabel.frame)
            }

        }
        
        // Perform same sequesnce of animation on Body label with a small delay
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { done in
            print("Animation 1 complete")
            print("\(self.bodyLabel.frame) vs \(self.bodyLabel.transform)")
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                self.bodyLabel.alpha = 0
                // self.titleLabel.transform = CGAffineTransform(translationX: self.titleLabel.frame.origin.x, y: -100)
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -100)
            } completion: { done in
                print("Animation 2 complete")
                print(self.bodyLabel.frame)
            }

        }

        
    }

}

