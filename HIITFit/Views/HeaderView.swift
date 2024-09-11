import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let title: String
  
  var body: some View {
    VStack {
      Text(title)
        .font(.largeTitle)
      HStack {
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          let fill = index == selectedTab ? ".fill" : ""
          Image(systemName: "\(index + 1).circle\(fill)")
            .font(.title2)
            .onTapGesture {
              selectedTab = index
            }
        }
      }
    }
  }
}

#Preview {
  HeaderView(selectedTab: .constant(0), title: "Squat")
}
