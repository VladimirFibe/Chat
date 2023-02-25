import SwiftUI

struct MainMessagesView: View {
  @State private var shouldShowLogOut = false
  var body: some View {
    NavigationView {
      VStack {
        navbar
        messages
      }
      .overlay(
        newMessage, alignment: .bottom
      )
      .navigationBarHidden(true)
    }
    .navigationViewStyle(.stack)
    .confirmationDialog("What di you want to do?",
                        isPresented: $shouldShowLogOut) {
      Button("Log Out", role: .destructive) {
        print("log out")
      }
    }
  }
  var messages: some View {
    ScrollView {
      ForEach(0..<10, id: \.self) { num in
        content
      }
      .padding(.bottom, 50)
    }
  }
  var gear: some View {
    Button {
      shouldShowLogOut.toggle()
    } label: {
      Image(systemName: "gear")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(Color.label)
    }
    
  }
  var newMessage: some View {
    Button {
      
    } label: {
      Text("+ New Message")
        .foregroundColor(.white)
        .padding(.vertical)
        .font(.system(size: 16, weight: .bold))
        .frame(maxWidth: .infinity)
        .background(Color.blue, in: Capsule())
        .padding(.horizontal)
        .shadow(radius: 15)
    }
    
  }
  var navbar: some View {
    HStack(spacing: 16.0) {
      Image(systemName: "person.fill")
        .font(.system(size: 34, weight: .heavy))
      VStack(alignment: .leading, spacing: 4) {
        Text("Username").font(.system(size: 24, weight: .bold))
        HStack {
          Circle()
            .frame(width: 14, height: 14)
            .foregroundColor(.green)
          Text("online").font(.system(size: 12))
            .foregroundColor(Color(.lightGray))
        }
      }
      Spacer()
      gear
    }
    .padding()
  }
  var content: some View {
    VStack {
      HStack(spacing: 16.0) {
        Image(systemName: "person.fill")
          .font(.system(size: 32))
          .padding()
          .overlay(Circle().stroke())
        VStack(alignment: .leading) {
          Text("Username")
            .font(.system(size: 16, weight: .bold))
          Text("Message sent to user")
            .font(.system(size: 14))
            .foregroundColor(.lightGray)
        }
        Spacer()
        Text("22d")
          .font(.system(size: 14, weight: .semibold))
      }
      Divider()
    }
    .padding(.horizontal)
  }
}

struct MainMessagesView_Previews: PreviewProvider {
  static var previews: some View {
    MainMessagesView()
  }
}
