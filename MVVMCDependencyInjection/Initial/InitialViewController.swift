//
//  ViewController.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    private var coordinator: Coordinator?
    private var factory: Factory?
    
    var intialView: InitialView?
    
    lazy var viewModel: InitialViewModel? = {
        return factory?.makeInitialViewModel(coordinator: coordinator!)
    }()
    
    init(factory: Factory, coordinator: Coordinator) {
        self.factory = factory
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        if let initialView = factory?.makeInitialView(viewModel: viewModel!) {
            initialView.traverseButton.addTarget(self, action: #selector(traverseButton(_:)), for: .touchDown)
            initialView.networkButton.addTarget(self, action: #selector(networkButton), for: .touchDown)
            self.intialView = initialView
            self.view = initialView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func traverseButton(_ sender: UIButton) {
        coordinator?.moveToDetail()
    }
    
    @IBAction func networkButton(_ sender: UIButton) {
        viewModel?.fetchData(completion: { data in
            switch data {
            case .failure: fatalError()
            case .success(let data):
                if let data = data.first {
                    self.intialView?.setNetworkLabel(text: data.dataString)
                }
            }
        })
    }

}

