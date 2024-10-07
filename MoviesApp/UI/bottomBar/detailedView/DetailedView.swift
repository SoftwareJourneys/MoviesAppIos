import SwiftUI

struct detailedView: View {
    var movieTitle : String
    
    var body: some View {
        NavigationView{
            Text("Detailed View for \(movieTitle)")
                .font(.largeTitle)
                .padding()
        }
    }
}
