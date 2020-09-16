//
//  MasterViewModel.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import Foundation

final class MasterViewModel {
    private let networkManager = NetworkManager()
    private let followerUrl: String = "https://api.github.com/users/twostraws/followers"
    var followers: [Follower] = [Follower]() {
        didSet {
            DispatchQueue.main.async {
                self.reloadTable?()
            }
        }
    }
    var reloadTable: (() -> Void)?
    
    func getFollowers() {
        networkManager.getJSON(at: followerUrl) { [weak self] (result: Result<[Follower], NetworkError>) in
            guard let `self` = self else { return }
            switch result {
            case .success(let followers):
                self.followers = followers
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
