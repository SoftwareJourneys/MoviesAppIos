import SwiftUI

struct searchView: View {
    @State private var movieName: String = ""
    
    var body: some View {
        VStack {
            TextField("Ingresa el nombre de la película", text: $movieName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Botón de búsqueda
            Button(action: {
                print("Buscar película: \(movieName)")
            }) {
                Text("Buscar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}
