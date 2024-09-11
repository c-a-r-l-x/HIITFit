import SwiftUI

struct RatingView: View {
  @Binding var rating: Int
  let maximumRating = 5
  let onColor = Color.red
  let offColor = Color.gray
  
  var body: some View {
    HStack {
      ForEach(1 ..< maximumRating + 1, id: \.self) { index in
        Image(systemName: "waveform.path.ecg")
          .font(.largeTitle)
          .foregroundColor(index > rating ? offColor : onColor)
          .onTapGesture {
            rating = index
          }
      }
    }
  }
}

#Preview {
  RatingView(rating: .constant(1))
}
