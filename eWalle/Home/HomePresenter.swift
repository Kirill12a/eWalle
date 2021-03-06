//
//  HomePresenter.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation

protocol HomeViewPresenterProtocol: AnyObject {
    var peoples: [People] { get }
    var services: [Service] { get }
    var peoplesCount: Int? { get }
    var servicesCount: Int? { get }

    func getPeoples()
    func getServices()
    func people(atIndex indexPath: IndexPath) -> People?
    func service(atIndex indexPath: IndexPath) -> Service?
    func menuPressed()
    func viewDidLoad()
}

class HomePresenter {


    var services = [Service]()
    var peoples = [People]()
    var peoplesCount: Int? = 0
    var servicesCount: Int? = 0

    weak var view: HomeViewProtocol!
    let dataFetcher = DataFetcherService()

    var servicesDictionary = [String : String]()

    init(view: HomeViewProtocol) {
        self.view = view
    }
}

extension HomePresenter: HomeViewPresenterProtocol {
    func menuPressed() {
        view.delegate?.toggleMenu()
    }

    func viewDidLoad() {
        getServices()
        getPeoples()
    }

    func getServices() {
        for service in ServicesModel.allCases {
            services.append(Service(serviceName: service.rawValue, serviceIcon: service.description))
        }

        servicesCount = services.count
        view?.reloadData()
    }

    func getPeoples() {

        dataFetcher.fetchPeoples { (peoples) in
            guard let peoples = peoples else { return }
            for people in peoples {
                self.peoples.append(people)
            }
        }
        
        peoplesCount = peoples.count
        view?.reloadData()
    }

    func people(atIndex indexPath: IndexPath) -> People? {
        if peoples.indices.contains(indexPath.row) {
            return peoples[indexPath.row]
        } else {
            return nil
        }
    }

    func service(atIndex indexPath: IndexPath) -> Service? {
        if services.indices.contains(indexPath.row) {
            return services[indexPath.row]
        } else {
            return nil
        }
    }
}

