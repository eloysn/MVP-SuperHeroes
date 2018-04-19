//
//  DetailHeroeViewController.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 19/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit
import Kingfisher

class DetailHeroeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imaHeroe: UIImageView!
    @IBOutlet weak var lblRealName: UILabel!
    

    @IBOutlet weak var lblGroups: UILabel!
    @IBOutlet weak var lblAbilities: UILabel!
    @IBOutlet weak var lblpower: UILabel!
    @IBOutlet weak var lblheight: UILabel!
    // MARK: - Properties
    let heroe: Heroe
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        populateView()

    
    }
    // MARK: - Init
    init(_ heroe: Heroe ) {
        self.heroe = heroe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        title = heroe.name
        imaHeroe.rounded(radius: 10)
    }
    
    func populateView()  {
        imaHeroe.kf.setImage(with: heroe.photo)
        lblRealName.text = heroe.realName
        lblheight.text = heroe.height
        lblpower.text = heroe.power
        lblAbilities.text = heroe.abilities
        lblGroups.text = heroe.groups

    }
}
