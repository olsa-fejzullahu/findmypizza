import SwiftUI

struct PizzaCircleImage: View {
    
    var image:Image
    
    var body: some View {
        
        image
            .resizable()
            .frame(width:300, height:300)
            .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 15)
            
        
    }
}

struct PizzaCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        PizzaCircleImage(image: Image( pizzaplaceData[2].imageName))
    }
}
