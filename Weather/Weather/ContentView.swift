import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var manager = LocationManager()
    
    var body: some View {
        if let location = manager.location {
            Text("Your location: \(location.latitude), \(location.longitude)")
        }
        
        if let city = manager.city {
            Text("Welcome to: \(city)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

