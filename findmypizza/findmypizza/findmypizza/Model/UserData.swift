import Foundation
import SwiftUI
import Combine

class UserData : ObservableObject {
    
    @Published var showFavoritesOnly = false
    @Published var isFavorite = false
    @Published var pizzaplaces = pizzaplaceData
    
}
