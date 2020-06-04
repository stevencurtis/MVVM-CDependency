//
//  InitialView.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

final class InitialView: UIView {

    let traverseButton = UIButton(type: .custom)
    let networkButton = UIButton(type: .custom)
    let networkLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .red
        traverseButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        traverseButton.setTitle("Go to Detail", for: .normal)
        traverseButton.setTitleColor(.black, for: .normal)
        traverseButton.isUserInteractionEnabled = true
                
        self.addSubview(traverseButton)
        traverseButton.translatesAutoresizingMaskIntoConstraints = false
        traverseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        traverseButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        networkButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        networkButton.setTitle("Make Network Call", for: .normal)
        networkButton.setTitleColor(.black, for: .normal)
        networkButton.isUserInteractionEnabled = true
        
        self.addSubview(networkButton)
        networkButton.translatesAutoresizingMaskIntoConstraints = false
        networkButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        networkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100).isActive = true
        
        networkLabel.text = "No network calls made"
        networkLabel.backgroundColor = .purple
        self.addSubview(networkLabel)
        
        networkLabel.translatesAutoresizingMaskIntoConstraints = false
        networkLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        networkLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 200).isActive = true
        networkLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        networkLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setNetworkLabel(text: String){
        networkLabel.text = text
    }

}
