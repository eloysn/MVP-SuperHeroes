//
//  ListViewController.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 18/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit

protocol ListView: NSObjectProtocol{
    func updateResult()
    func startLoading()
    func finishLoading()
    func emptyHeroes( message: String)
    
}
class ListViewController: UITableViewController {
    let presenter: ListPresenter
    
    // MARK: - Init
    init( _ presenter: ListPresenter = ListPresenter()) {
        self.presenter = presenter
        super.init(style: .plain)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle file
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(view: self)
        setupView()
        setupTable()
        presenter.fetchData()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - Configure views
    func setupView() {
        self.title = "Super Heroes"
        view.backgroundColor = .white
    }
    
    func setupTable() {
        
        let nib = UINib(nibName: "HeroesViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: HeroesViewCell.cellIdentifier)
        tableView.rowHeight = HeroesViewCell.rowHeight
        tableView.backgroundColor = .white
        
        
    }
    
    deinit  {
        presenter.detachView()
    }
    
    
}


// MARK: - Table view data source
extension ListViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.heroes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HeroesViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroesViewCell.cellIdentifier, for: indexPath) as! HeroesViewCell
        
        cell.populateCell(heroe: presenter.getHeroe(index: indexPath.row))
        return cell
    }
    
}
// MARK: - UITableViewDelegate
extension ListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroe = presenter.getHeroe(index: indexPath.row)
        let vc = DetailHeroeViewController( heroe )
        //Podriamos tener una clase router que manejara
        //la navegacion y desacoplarlo de controller,
        //pero para este ejemplo no lo he visto necesario
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListViewController: ListView {
    
    func emptyHeroes(message: String) {
        self.showAlert("", description: message)
        
    }
    
    func startLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func finishLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    func updateResult() {
        tableView.reloadData()
    }
}
