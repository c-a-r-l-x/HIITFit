import SwiftUI

struct HeaderView: View {
  let title: String
  
  var body: some View {
    VStack {
      Text(title)
        .font(.largeTitle)
      HStack {
        Image(systemName: "hand.wave")
        Image(systemName: "1.circle")
        Image(systemName: "2.circle")
        Image(systemName: "3.circle")
        Image(systemName: "4.circle")
      }
      .font(.title2)
    }
  }
}

#Preview {
  HeaderView(title: "Squat")
}
