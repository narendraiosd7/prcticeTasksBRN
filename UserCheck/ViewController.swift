//
//  ViewController.swift
//  UserCheck
//
//  Created by Vadde Narendra on 12/16/19.
//  Copyright © 2019 Vadde Narendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var mainView: UIView!
    //    var mainView:UIView!
    var edges = UIRectEdge()
    
    let box:UIView =
    {
        let subview = UIView()
        
        subview.layer.masksToBounds = true
        subview.layer.cornerRadius = 2
        subview.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return subview
    }()
    
    var initialCentrePoint = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        mainView = UIView(frame: CGRect(x: 20, y: 100, width: 380, height: (380*1.75)))
//        mainView.backgroundColor = .yellow
//        mainView.layer.borderWidth = 1
//        mainView.layer.cornerRadius = 15
//        view.addSubview(mainView)
        
        mainView.addSubview(box)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        
        box.addGestureRecognizer(panGesture)
        
        setupLayout()
        
        view.backgroundColor = UIColor.black
        
    }

    @objc func handlePan(pan: UIPanGestureRecognizer)
    {
        if (pan.state == .began)
        {
            self.initialCentrePoint = box.center
        }
        
        let translation = pan.translation(in: mainView)
        
        if pan.state != .cancelled
        {
            let newCentre = CGPoint(x: initialCentrePoint.x + translation.x, y: initialCentrePoint.y + translation.y)
            box.center = newCentre
        }
        else
        {
            box.center = initialCentrePoint
        }
        
    }
    
    func setupLayout()
    {
        NSLayoutConstraint.activate([
            box.centerXAnchor.constraint(equalTo: mainView!.centerXAnchor),
            box.centerYAnchor.constraint(equalTo: mainView!.centerYAnchor),
            box.widthAnchor.constraint(equalToConstant: 20),
            box.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
 

}

