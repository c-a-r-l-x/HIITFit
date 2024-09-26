import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let title: String
  
  var body: some View {
    VStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundColor(.white)
      HStack {
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ZStack {
            Circle()
              .frame(width: 32, height: 32)
              .foregroundColor(.white)
              .opacity(index == selectedTab ? 0.5 : 0.0)
            Circle()
              .frame(width: 16, height: 16)
              .foregroundColor(.white)
          }
          .onTapGesture {
            selectedTab = index
          }
        }
      }
    }
  }
}

#Preview {
  ZStack {
    Color("LaunchColor")
    HeaderView(selectedTab: .constant(0), title: "Squat")
  }
}
