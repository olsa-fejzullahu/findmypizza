import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
        
    var pizzaPlace:PizzaPlace
    var coordinate : CLLocationCoordinate2D
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //update ui view
        
        uiView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
            
        uiView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        annotation.title = pizzaPlace.name
        annotation.subtitle = pizzaPlace.address + pizzaPlace.city
        uiView.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(pizzaPlace: pizzaplaceData[0], coordinate: pizzaplaceData[0].locationCoordinate)
    }
}
