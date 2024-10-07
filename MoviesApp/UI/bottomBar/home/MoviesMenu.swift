import Foundation
import SwiftUI

struct moviesMenu: View {
    var menuTitle: String
    var movies: [MovieUI]
    var isCircular: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(menuTitle)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(movies) { movie in
                        movieView(movie: movie, isCircular: isCircular)
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(alignment: .topLeading)
        .padding()
    }
}

struct AnyShape: Shape {
    var path: @Sendable (CGRect) -> Path
    
    func path(in rect: CGRect) -> Path {
        return path(rect)
    }
    
    init<S: Shape>(_ shape: S) {
        self.path = {@Sendable rect in shape.path(in: rect) }
    }
}
