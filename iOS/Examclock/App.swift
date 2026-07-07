import SwiftUI

@main
struct ExamclockApp: App {
    @StateObject private var store = ExamclockStore()
    @StateObject private var purchases = PurchaseManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(purchases)
                .onAppear {
                    store.isPro = purchases.isPurchased
                }
                .onChange(of: purchases.isPurchased) { _, newValue in
                    store.isPro = newValue
                }
        }
    }
}
