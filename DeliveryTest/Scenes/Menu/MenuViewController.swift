//
//  MenuViewController.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//

import Foundation
import UIKit

protocol MenuDisplayLogic: AnyObject {
    func displayMenu(viewModel: Menu.FetchBeer.ViewModel)
    func changeSection(viewModel: Menu.ChangeSection.ViewModel)
}

class MenuViewController: UIViewController, MenuDisplayLogic, SectionsDelegate {
    
    var interactor: MenuBusinessLogic?
    var router: (NSObjectProtocol & MenuRoutingLogic)?
    
    let table = UITableView()
    let saleCollectionView = SaleCollectionView()
    let sectionCollectionView = SectionsCollectionView()
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва ↓"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var beerViewModel = BeerViewModel.init(cells: [])
    private var beerItems = [Beer]()
    
    private func setup() {
        let viewController        = self
        let interactor            = MenuInteractor()
        let presenter             = MenuPresenter()
        let router                = MenuRouter()
        viewController.router     = router
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        sectionCollectionView.sectionDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9029724002, green: 0.9496296048, blue: 0.9983995557, alpha: 1)
        setup()
        setupView()
        setupTable()
        requestToFetchBeer()
    }
    
    func displayMenu(viewModel: Menu.FetchBeer.ViewModel) {
        beerViewModel = viewModel.beerViewModel
        beerItems = viewModel.beer
        table.reloadData()
    }
    
    private func requestToFetchBeer() {
        let request = Menu.FetchBeer.Request()
        interactor?.makeRequest(request: request)
    }
    
    func requestToChangeSection(sectionIndex: Int) {
        let request = Menu.ChangeSection.Request(section: sectionIndex)
        interactor?.goToSection(request: request)
    }
    
    func changeSection(viewModel: Menu.ChangeSection.ViewModel) {
        let indexPath = IndexPath(row: 0, section: viewModel.section)
        table.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    private func setupTable() {
        table.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseID)
        table.delegate = self
        table.dataSource = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerItems.filter({ $0.section == BeerSection.allCases[section] }).count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BeerSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseID, for: indexPath) as! MenuCell
        let cellViewModel = beerViewModel.cells.filter({ $0.beerItem.section == BeerSection.allCases[indexPath.section] })[indexPath.row]
        cell.set(beerModel: cellViewModel)
        return cell
    }
}

extension MenuViewController {
    private func setupView() {
        self.view.addSubview(table)
        self.view.addSubview(saleCollectionView)
        self.view.addSubview(sectionCollectionView)
        self.view.addSubview(cityLabel)
        
        updateConstraint()
        
        table.clipsToBounds = true
        table.layer.masksToBounds = true
        table.backgroundColor = .white
        table.layer.cornerRadius = 20
        table.allowsSelection = false
    }
    
    private func updateConstraint() {
        sectionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        saleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        table.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityLabel.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: nil,
                         trailing: view.trailingAnchor,
                         padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: 8))
        
        saleCollectionView.anchor(top: cityLabel.bottomAnchor,
                                  leading: view.leadingAnchor,
                                  bottom: nil,
                                  trailing: view.trailingAnchor)
        saleCollectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        sectionCollectionView.anchor(top: saleCollectionView.bottomAnchor,
                                     leading: view.leadingAnchor,
                                     bottom: nil,
                                     trailing: view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        sectionCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        table.anchor(top: sectionCollectionView.bottomAnchor,
                     leading: view.leadingAnchor,
                     bottom: view.bottomAnchor,
                     trailing: view.trailingAnchor)
    }
}
