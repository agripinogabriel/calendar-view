import SwiftUI

protocol NavigationControlDelegate {
    func moveBackward()
    func moveForward()
    func moveToCurrentDay()
}

struct NavigationControlView: View {
    var delegate: NavigationControlDelegate?
    
    var body: some View {
        HStack(spacing: 2) {
            Button { delegate?.moveBackward() }
                label: { Image(systemName: "chevron.backward") }
                .buttonStyle(GrowingButton())
            
            Button { delegate?.moveToCurrentDay() }
                label: {
                    Text("Hoje")
                        .font(.system(size: 14))
                }
                .buttonStyle(GrowingButton())
            
            Button { delegate?.moveForward() }
                label: { Image(systemName: "chevron.forward") }
                .buttonStyle(GrowingButton())
        }
    }
}

struct NavigationControlView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationControlView()
    }
}
