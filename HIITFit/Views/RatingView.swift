import SwiftUI

struct RatingView: View {
  var body: some View {
    HStack {
      ForEach(0 ..< 5) { _ in
        Image(systemName: "waveform.path.ecg")
          .font(.largeTitle)
          .foregroundColor(.gray)
      }
    }
  }
}

#Preview {
  RatingView()
}
