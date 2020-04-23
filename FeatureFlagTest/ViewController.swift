//
//  ViewController.swift
//  FeatureFlagTest
//
//  Created by Chrystian on 19/02/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tryRequest), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        view.addConstraints([
            view.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

     @objc fileprivate func tryRequest() {
        
        // create mocable json
        let jsonValue: [String: Any] = [
            "features": [
                [
                    "key": "chatbot",
                    "explanation": "some explanation don't worry",
                    "available": true
                ]
                
            ]
        ]
        
        // parse data
        do {
            let jsonData = try jsonValue.convertToJsonData()
            try JSONDecoder().decode(FeatureResponse.self, from: jsonData)
            
            print(RegistredFeatures.chatbot.available)
        } catch {
            print("error")
        }
    }
}
