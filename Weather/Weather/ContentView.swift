import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var manager = LocationManager()
    
    var body: some View {
        VStack{
            if let city = manager.city {
                Text("\(city)")
                    .bold()
                    .padding()
            }
            Spacer()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

