import SwiftUI
import Observation

@Observable class NavState {
    var path = NavigationPath()
    
    func navigate(_ navDestination: NavDestinations) {
        path.append(navDestination)
    }
    
    func dismiss() {
        path.removeLast()
    }
}
