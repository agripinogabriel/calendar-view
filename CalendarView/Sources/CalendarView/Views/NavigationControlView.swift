import SwiftUI

struct NavigationControlView: View {
    
    var onForward: () -> Void
    var onBackward: () -> Void
    var onCurrentDate: () -> Void
    
    var body: some View {
        HStack(spacing: 2) {
            Button { onBackward() }
                label: { Image(systemName: "chevron.backward") }
                .buttonStyle(GrowingButton())
            
            Button { onCurrentDate() }
                label: {
                    Text("Hoje")
                        .font(.system(size: 14))
                }
                .buttonStyle(GrowingButton())
            
            Button { onForward() }
                label: { Image(systemName: "chevron.forward") }
                .buttonStyle(GrowingButton())
        }
    }
}

struct NavigationControlView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationControlView {
            
        } onBackward: {
            
        } onCurrentDate: {
            
        }
    }
}
