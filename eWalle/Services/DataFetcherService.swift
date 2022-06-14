//
//  DataFetcherService.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation

class DataFetcherService {

    var dataFetcher: DataFetcher

    init(dataFetcher: DataFetcher = LocalDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    

    func fetchPeoples(completion: @escaping ([People]?) -> Void) {
        let localUrlString = "JSONPeoples.json"
        dataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
}
