import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView {
            
            
            ZStack {
                
                Image("pizzabackground").resizable().edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    
                    Text("Welcome Pizza Lovers!")
                        .font(.headline)
                        .fontWeight(.light)
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        
                     NavigationLink(destination: PizzaPlaces()) {
                                     
                        Text("Find My Pizza")
                            .font(.title)
                            .fontWeight(.thin)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.all,30)
                           .background(Color.orange.opacity(0.9))
                           .cornerRadius(20)
                     }
                    Spacer()
                }
               
            }

        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
