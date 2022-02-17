import Foundation
import CoreLocation

class LocationManager: NSObject,CLLocationManagerDelegate, ObservableObject {
    private let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var city: String?
    @Published var countryCode: String?
    @Published var result: WeatherDateQueryQuery.Data.GetCityByName.Weather?
    
    var actualTemp: String {
        let actual = result?.temperature?.actual ?? 0.0  
        return String(format: "%.1f °C", actual)
    }
    
    var feelsLikeTemp: String {
        let feelsLike = result?.temperature?.feelsLike ?? 0.0
        return String(format: "%.1f °C ", feelsLike)
    }
    
    var minTemp: String {
        let min = result?.temperature?.min ?? 0.0
        return String(format: "%.1f °C", min)
    }
    
    var maxTemp: String {
        let max = result?.temperature?.max ?? 0.0
        return String(format: "%.1f °C", max)
    }
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        location = locations.first?.coordinate
        
        lookUpCurrentLocation { response in
            self.city = response?.locality
            self.countryCode = response?.isoCountryCode
            self.getWeather()
        }
    }
    
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
                               -> Void ) {
        if let lastLocation = self.manager.location {
            let geocoder = CLGeocoder()
    
            geocoder.reverseGeocodeLocation(lastLocation,
                                            completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                }
                else {
                    completionHandler(nil)
                }
            })
        }
        else {
            completionHandler(nil)
        }
    }
    
    func getWeather(){
        Network.shared.apollo.fetch(query: WeatherDateQueryQuery(name: city ?? "", country: countryCode)) { result in
          switch result {
          case .success(let graphQLResult):
              self.result = graphQLResult.data?.getCityByName?.weather
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
}
