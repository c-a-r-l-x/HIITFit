import SwiftUI

struct RaisedButtonView: View {
  let text: String
  let action: () -> Void
  
  var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(text)
        .raisedButtonTextStyle()
    })
    .buttonStyle(.raised)
  }
}

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
      .font(.body)
      .fontWeight(.bold)
  }
}

struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 12)
      .background(
        Capsule()
          .foregroundColor(Color("background"))
          .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
          .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
      )
  }
}

extension ButtonStyle where Self == RaisedButtonStyle {
  static var raised: RaisedButtonStyle {
    .init()
  }
}

#Preview {
  ZStack {
    RaisedButtonView(text: "Get Started", action: {
      print("Hello World")
    })
    .padding()
  }
  .background(Color("background"))
}
