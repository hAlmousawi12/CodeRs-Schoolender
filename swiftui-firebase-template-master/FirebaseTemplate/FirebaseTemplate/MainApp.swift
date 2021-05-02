import SwiftUI
import Firebase
import UserNotifications
@main
struct MainApp: App {
    init() {
        // configuring Firebase
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
//            Testing()
                .environmentObject(FirebaseEnv())
                .environmentObject(ClassesEnv())
                .environmentObject(LectureEnv())
                .environmentObject(TaskEnv())
                .environmentObject(CalenderEnc())
                .accentColor(Color("Primary"))
                .colorScheme(.light)
                .onAppear {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, err in
                        if success {
                            print("All set!")
                        } else if let err = err {
                            print(err.localizedDescription)
                        }
                    }
                }
        }
    }
}
