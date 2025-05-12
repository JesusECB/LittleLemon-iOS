import SwiftUI
import SwiftData

struct OnboardingRegistrationView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var navigateToHome = false

    
    
    var body: some View {
           NavigationStack {
               VStack(spacing: 24) {
                   
                   // LOGO SEPARADO (encima del cuadro verde)
                   Image("logo")
                       .resizable()
                       .scaledToFit()
                       .frame(height: 60)
                       .padding(.top, 32)

                   
                   VStack(alignment: .leading, spacing: 12) {
                       Text("Let’s get to know you")
                           .font(.system(size:  32, weight: .heavy))
                           .foregroundColor(.llYellow)
                   }
                   .padding(.vertical, 80)
                   .padding(.horizontal)
                   .frame(maxWidth: .infinity)
                   .background(Color.llGreenDark)
                   .cornerRadius(12)
                   .padding(.horizontal)
                // Formulario
                VStack(alignment: .leading, spacing: 16) {
                    Text("Personal information")
                        .font(.headline)
                        .foregroundColor(.llGreenDark)

                    TextField("First name", text: $firstName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Last name", text: $lastName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)

                    Button("Register") {
                        let user = User(firstName: firstName, lastName: lastName, email: email)
                        context.insert(user)
                        try? context.save()
                        navigateToHome = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.llYellow)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                }
                .padding()
                .background(Color.llOffWhite)
                .cornerRadius(16)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView().environmentObject(HomeViewModel())
            }
        }
    }
}

#Preview {
    OnboardingRegistrationView()
        .environmentObject(HomeViewModel())
        .modelContainer(for: User.self)
}

