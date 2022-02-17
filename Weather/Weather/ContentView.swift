import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var manager = LocationManager()
    
    var body: some View {
        VStack{
            
            VStack{
                if let city = manager.city {
                    Text("\(city)")
                        .font(.system(size: 20))
                        .bold()
                        .padding()
                }
            }
            
            Image("clouds")
                .resizable()
                .scaledToFit()
                .frame(width: 150.0, height: 150.0)
            
            VStack{
                Spacer()
                Text("18°")
                    .font(.system(size: 75))
                    .padding()
                HStack{
                    if let weather = manager.result {
                        VStack{
                            Text("Actual")
                            Text("\(weather.temperature?.actual ?? 0.0)")
                        }
                        VStack{
                            Text("FeelsLike")
                            Text("\(weather.temperature?.feelsLike ?? 0.0)")
                        }
                        VStack{
                            Text("Min")
                            Text("\(weather.temperature?.min ?? 0.0)")
                        }
                        VStack{
                            Text("Max")
                            Text("\(weather.temperature?.max ?? 0.0)")
                        }
                        
                    }
                }
                Spacer()
            }
            
            VStack{
                Spacer()
                Text("Wind")
                    .bold()
                    .padding()
                HStack{
                    Text("speed")
                    Text("deg")
                }
                Spacer()
            }
            
            VStack{
                Text("Clouds")
                    .bold()
                    .padding()
                HStack{
                    Text("all")
                    Text("visibility")
                    Text("humidity")
                }
                Spacer()
            }
            
            Spacer()
        }
        .onAppear {
            manager.getWeather()
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

