//
//  DetailViewController.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    weak var coordinator: Coordinator?
    private var factory: Factory?

    var detailView: DetailView?
    
    lazy var viewModel: DetailViewModel? = {
        return factory?.makeDetailViewModel(coordinator: coordinator!)
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
        if let detailView = factory?.makeDetailView(viewModel: viewModel!) {
            self.detailView = detailView
            self.view = detailView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
