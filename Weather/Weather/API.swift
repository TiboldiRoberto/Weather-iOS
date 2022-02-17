// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class WeatherDateQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WeatherDateQuery($name: String!, $country: String) {
      getCityByName(name: $name, country: $country, config: {units: metric}) {
        __typename
        name
        weather {
          __typename
          temperature {
            __typename
            actual
            feelsLike
            min
            max
          }
        }
      }
    }
    """

  public let operationName: String = "WeatherDateQuery"

  public var name: String
  public var country: String?

  public init(name: String, country: String? = nil) {
    self.name = name
    self.country = country
  }

  public var variables: GraphQLMap? {
    return ["name": name, "country": country]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getCityByName", arguments: ["name": GraphQLVariable("name"), "country": GraphQLVariable("country"), "config": ["units": "metric"]], type: .object(GetCityByName.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getCityByName: GetCityByName? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getCityByName": getCityByName.flatMap { (value: GetCityByName) -> ResultMap in value.resultMap }])
    }

    public var getCityByName: GetCityByName? {
      get {
        return (resultMap["getCityByName"] as? ResultMap).flatMap { GetCityByName(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getCityByName")
      }
    }

    public struct GetCityByName: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["City"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("weather", type: .object(Weather.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, weather: Weather? = nil) {
        self.init(unsafeResultMap: ["__typename": "City", "name": name, "weather": weather.flatMap { (value: Weather) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var weather: Weather? {
        get {
          return (resultMap["weather"] as? ResultMap).flatMap { Weather(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "weather")
        }
      }

      public struct Weather: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Weather"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("temperature", type: .object(Temperature.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: Temperature? = nil) {
          self.init(unsafeResultMap: ["__typename": "Weather", "temperature": temperature.flatMap { (value: Temperature) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var temperature: Temperature? {
          get {
            return (resultMap["temperature"] as? ResultMap).flatMap { Temperature(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "temperature")
          }
        }

        public struct Temperature: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Temperature"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("actual", type: .scalar(Double.self)),
              GraphQLField("feelsLike", type: .scalar(Double.self)),
              GraphQLField("min", type: .scalar(Double.self)),
              GraphQLField("max", type: .scalar(Double.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(actual: Double? = nil, feelsLike: Double? = nil, min: Double? = nil, max: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "Temperature", "actual": actual, "feelsLike": feelsLike, "min": min, "max": max])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var actual: Double? {
            get {
              return resultMap["actual"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "actual")
            }
          }

          public var feelsLike: Double? {
            get {
              return resultMap["feelsLike"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "feelsLike")
            }
          }

          public var min: Double? {
            get {
              return resultMap["min"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "min")
            }
          }

          public var max: Double? {
            get {
              return resultMap["max"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "max")
            }
          }
        }
      }
    }
  }
}
