import SwiftUI

struct HistoryView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var showHistory: Bool
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Button(action: {
        showHistory.toggle()
      }, label: {
        Image(systemName: "xmark.circle")
          .font(.title)
          .padding()
      })
      VStack {
        Text("History")
          .font(.title)
          .padding()
        Form {
          ForEach(history.exerciseDays) { day in
            Section(header: Text(day.date.formatted(as: "MMM d")).font(.headline)) {
              ForEach(day.exercises, id: \.self) { exercise in
                Text(exercise)
              }
            }
          }
        }
      }
    }
  }
}

#Preview {
  HistoryView(showHistory: .constant(true))
    .environmentObject(HistoryStore())
}
