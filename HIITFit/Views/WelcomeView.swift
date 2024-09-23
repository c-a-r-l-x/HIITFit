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
    ZStack {
      VStack {
        HeaderView(selectedTab: $selectedTab, title: "Welcome")
        Spacer()
        historyButton
          .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
          }
      }
      VStack {
        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
            Text("Get fit")
              .font(.largeTitle)
            Text("with high intensity interval training")
              .font(.headline)
          }
          Image("step-up")
            .resizedToFill(width: 240, height: 240)
            .clipShape(Circle())
        }
        getStartedButton
      }
    }
  }
}

#Preview {
  WelcomeView(selectedTab: .constant(9))
    .environmentObject(HistoryStore())
}
