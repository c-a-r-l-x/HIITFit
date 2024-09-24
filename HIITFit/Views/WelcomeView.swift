import SwiftUI

struct WelcomeView: View {
  @Binding var selectedTab: Int
  @State private var showHistory = false
  var getStartedButton: some View {
    RaisedButtonView(text: "Get Started") {
      selectedTab = 0
    }
    .padding()
  }
  var historyButton: some View {
    Button(action: {
      showHistory.toggle()
    }, label: {
      Text("History")
        .fontWeight(.bold)
        .padding([.leading, .trailing], 5)
    })
    .padding(.bottom, 10)
    .buttonStyle(EmbossedButtonStyle())
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(selectedTab: $selectedTab, title: "Welcome")
        Spacer()
        ContainerView {
          ViewThatFits {
            VStack {
              WelcomeView.images
              WelcomeView.texts
              getStartedButton
              Spacer()
              historyButton
            }
            VStack {
              WelcomeView.texts
              getStartedButton
              Spacer()
              historyButton
            }
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
      }
    }
  }
}

#Preview {
  WelcomeView(selectedTab: .constant(9))
    .environmentObject(HistoryStore())
}
