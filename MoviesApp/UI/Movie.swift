import SwiftUI

struct movieView: View {
    
    var movie: MovieUI
    var isCircular: Bool
    
    var body: some View {
        NavigationLink(destination: detailedView(movieTitle: movie.title)) {
            VStack {
                AsyncImage(url: URL(string: movie.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: isCircular ? 80 : 100)
                        .clipShape(isCircular ? AnyShape(Circle()) : AnyShape(Rectangle()))
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: isCircular ? 80 : 100)
                }
                Text(movie.title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 100)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
