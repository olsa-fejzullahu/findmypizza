import SwiftUI


struct PizzaRow: View {
    var pizzaPlace:PizzaPlace
    
    var body: some View {
     
        HStack {
            Image(pizzaPlace.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width:50, height: 50)
            Text(pizzaPlace.name)
            Spacer()
            
            if pizzaPlace.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.large)
            }
            
        }.padding(.leading, 10)
        
        

    }
}

struct PizzaRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PizzaRow(pizzaPlace: pizzaplaceData[0])
            PizzaRow(pizzaPlace: pizzaplaceData[1])
        }.previewLayout(.fixed(width:300, height: 70))
        
    }
}
