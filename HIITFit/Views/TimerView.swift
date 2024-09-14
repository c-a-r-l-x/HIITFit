import SwiftUI

struct TimerView: View {
  @State private var timeRemaining: Int = 3
  @Binding var timerDone: Bool
  let size: Double
  
  var body: some View {
    TimelineView(
      .animation(minimumInterval: 1.0, paused: timeRemaining <= 0)
    ) { context in
      CountdownView(
        date: context.date,
        timeRemaining: $timeRemaining,
        size: size
      )
    }
    .onChange(of: timeRemaining) {
      if timeRemaining < 1 {
        timerDone = true
      }
    }
  }
}

struct CountdownView: View {
  let date: Date
  @Binding var timeRemaining: Int
  let size: Double
  
  var body: some View {
    Text("\(timeRemaining)")
      .font(.system(size: size, design: .rounded))
      .padding()
      .onChange(of: date) {
        timeRemaining -= 1
      }
  }
}

#Preview {
  TimerView(timerDone: .constant(false), size: 90)
}
