//
//  Network.swift
//  Weather
//
//  Created by Freak on 17.02.2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql-weather-api.herokuapp.com")!)
}
