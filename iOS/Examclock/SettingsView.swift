import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var store: ExamclockStore
    @EnvironmentObject var purchases: PurchaseManager
    @Environment(\.dismiss) private var dismiss

    @State private var categoryToggles: [String: Bool] = Dictionary(
        uniqueKeysWithValues: ExamclockCategory.allCases.map { ($0.rawValue, true) }
    )
    @State private var showingRestoreAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Categories") {
                    ForEach(ExamclockCategory.allCases, id: \.rawValue) { cat in
                        Toggle(cat.rawValue, isOn: Binding(
                            get: { categoryToggles[cat.rawValue] ?? true },
                            set: { categoryToggles[cat.rawValue] = $0 }
                        ))
                        .accessibilityIdentifier("categoryToggle_\(cat.rawValue)")
                    }
                }
                Section("Subscription") {
                    if purchases.isPurchased {
                        Label("Home Screen Widgets unlocked", systemImage: "checkmark.seal.fill")
                            .foregroundStyle(Theme.accent)
                    } else {
                        Button("Upgrade to Home Screen Widgets") {
                            dismiss()
                        }
                        .accessibilityIdentifier("upgradeButton")
                    }
                    Button("Restore Purchases") {
                        Task {
                            await purchases.restore()
                            showingRestoreAlert = true
                        }
                    }
                    .accessibilityIdentifier("restoreButton")
                }
                Section("About") {
                    Link("Privacy Policy", destination: URL(string: "https://shimondeitel.github.io/examclock-app/privacy.html")!)
                        .accessibilityIdentifier("privacyPolicyLink")
                    Link("Terms of Use", destination: URL(string: "https://shimondeitel.github.io/examclock-app/terms.html")!)
                        .accessibilityIdentifier("termsLink")
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0")
                            .foregroundStyle(Theme.mutedInk)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                        .accessibilityIdentifier("settingsDoneButton")
                }
            }
            .alert("Restore Complete", isPresented: $showingRestoreAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .tint(Theme.accent)
    }
}
