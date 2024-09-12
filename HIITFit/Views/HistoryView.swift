import SwiftUI

struct HistoryView: View {
  let history = HistoryStore()
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Button(action: {}, label: {
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
  HistoryView()
}
