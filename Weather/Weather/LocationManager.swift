import Foundation
import CoreLocation

class LocationManager: NSObject,CLLocationManagerDelegate, ObservableObject {
    private let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var city: String?
    @Published var result: WeatherDateQueryQuery.Data.GetCityByName.Weather?
    
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
        Network.shared.apollo.fetch(query: WeatherDateQueryQuery()) { result in
          switch result {
          case .success(let graphQLResult):
              self.result = graphQLResult.data?.getCityByName?.weather
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
}
