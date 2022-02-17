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
                    Text(manager.actualTemp)
                        .font(.system(size: 75))
                        .padding()
                HStack{
                        VStack{
                            Text("FeelsLike")
                                .bold()
                            Text(manager.feelsLikeTemp)
                        }
                        VStack{
                            Text("Min")
                                .bold()
                            Text(manager.minTemp)
                        }
                        VStack{
                            Text("Max")
                                .bold()
                            Text(manager.maxTemp)
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
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

