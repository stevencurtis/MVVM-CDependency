//
//  ViewController.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

final class InitialViewController: UIViewController {
    private var coordinator: ProjectCoordinator?
    
    var intialView: InitialView?
    
    private var viewModel: InitialViewModel

    init(coordinator: ProjectCoordinator, viewModel: InitialViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let initialView = InitialView()
        initialView.traverseButton.addTarget(self, action: #selector(traverseButton(_:)), for: .touchDown)
        initialView.networkButton.addTarget(self, action: #selector(networkButton), for: .touchDown)
        self.intialView = initialView
        self.view = initialView
    }
    
    @IBAction func traverseButton(_ sender: UIButton) {
        coordinator?.moveToDetail()
    }
    
    @IBAction func networkButton(_ sender: UIButton) {
        viewModel.fetchData(completion: { [weak self] data in
            switch data {
            case .failure: fatalError()
            case .success(let data):
                if let data = data.first {
                    self?.intialView?.setNetworkLabel(text: data.dataString)
                }
            }
        })
    }
}
