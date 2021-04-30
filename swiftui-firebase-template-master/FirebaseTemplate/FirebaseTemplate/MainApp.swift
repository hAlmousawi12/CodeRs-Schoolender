import SwiftUI
import Firebase
@main
struct MainApp: App {
    init() {
        // configuring Firebase
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(FirebaseEnv())
                .environmentObject(ClassesEnv())
                .environmentObject(LectureEnv())
                .environmentObject(TaskEnv())
                .accentColor(Color("Primary"))
                .colorScheme(.light)
        }
    }
}
