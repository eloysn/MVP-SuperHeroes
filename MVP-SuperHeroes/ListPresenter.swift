//
//  ListPresenter.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 18/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import Foundation



class ListPresenter {
    
    private let session = HeroesService()
    weak private var listView: ListView?
    var heroes = [Heroe] ()
    
    func attachView(view: ListView) {
        listView = view
    }
    
    func detachView()  {
        listView = nil
    }
    
    func fetchData() {
        listView?.startLoading()
        session.getHeroes(request: API.ListHeroes) {[weak self] result in
            switch result {
                
            case .Success(let data):
                DispatchQueue.main.async {
                    self?.heroes = data.superheroes.sorted(by: { $0 > $1})
                    self?.listView?.updateResult()
                    self?.listView?.finishLoading()
                }
                
            case .Failure(let err):
                DispatchQueue.main.async {
                print(err)
                    self?.listView?.finishLoading()
                    self?.listView?.emptyHeroes(message: self?.getError(err: err) ?? "Error")
                    
                }
            }
            
        }
    }
    func getHeroe(index: Int) -> Heroe {
        return heroes[index]
    }
    
    private func getError(err: ErrorSessionAPI) -> String {
        switch err {
        case .errorNotDecodeJson, .errorBadResponse:
            return ConstantsError.respuestaInvalida
        case .responseErrorServer, .errorBadStatusCode:
            return ConstantsError.noAutorizado
        }
    }
    
    
    
}
