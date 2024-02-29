import SwiftUI


struct PizzaMainInfo: View {
    
    @EnvironmentObject var userData : UserData
    var pizzaplace : PizzaPlace
    
    @State var showActionSheet = false
    @State var showAlert = false
   
    var actionSheet:ActionSheet{
        ActionSheet(title:Text("Order Now"), message:Text("Currently unavailable!"), buttons:[
            .destructive(Text("Cancel"))
        ])
    }
    
    var alert:Alert{
        Alert(title:Text("Order"),
              primaryButton: .default(Text("Call"), action:{
                let telephone = "tel://"
                let formattedString=telephone+self.pizzaplace.phoneNo
                guard let url=URL(string: formattedString) else {return}
                UIApplication.shared.open(url)
              }),
              secondaryButton: .cancel())
    }
    var pizzaplaceIndex : Int {
        userData.pizzaplaces.firstIndex(where: { $0.id == pizzaplace.id })!
    }
    
  
    var body: some View {
        
        
        VStack {
            //Map	
            MapView(pizzaPlace: pizzaplace, coordinate: pizzaplace.locationCoordinate).frame(height:300).edgesIgnoringSafeArea(.top)
           
            //CircleImage
            PizzaCircleImage(image: Image(pizzaplace.imageName))
                .offset(y: -50)
                .frame(width:100, height:100)
                .padding(.bottom, 50)
                
            //TextViews
            VStack(alignment: .leading) {
                
                HStack {
                    Text(pizzaplace.name)
                    .font(.title)
                    
                    Button(action: {
                        self.userData.pizzaplaces[self.pizzaplaceIndex].isFavorite.toggle()
                    }) {
                        if self.userData.pizzaplaces[self.pizzaplaceIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                }
                
                
                
                HStack {
                    Text(pizzaplace.address)
                        .font(.subheadline)
                    Spacer()
                    Text(pizzaplace.city)
                    .font(.subheadline)
                }
            }.padding(.all, 10)
            Spacer()
            HStack{
                Button("Order Now"){
                    self.showActionSheet.toggle()
                }.actionSheet(isPresented: $showActionSheet, content: {self.actionSheet})
                Spacer()
                Button("Call"){
                    self.showAlert.toggle()
                }.alert(isPresented: $showAlert, content: {self.alert})
            }
            .padding(.all, 15).offset(y:-50)
            Spacer()
        }.navigationBarTitle(Text(pizzaplace.name), displayMode: .inline)
    }
}


struct PizzaMainInfo_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PizzaMainInfo(pizzaplace: userData.pizzaplaces[0])
            .environmentObject(userData)
    }
    
    
}
