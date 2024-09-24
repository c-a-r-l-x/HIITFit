import SwiftUI

struct ContainerView<Content: View>: View {
  var content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25.0)
        .foregroundColor(Color("background"))
      VStack {
        Spacer()
        Rectangle()
          .frame(height: 25)
          .foregroundColor(Color("background"))
      }
      content
    }
  }
}

#Preview {
  ContainerView {
    VStack {
      Color.red
      Color.green
      Color.blue
    }
    .padding(50)
  }
  .padding(25)
}
