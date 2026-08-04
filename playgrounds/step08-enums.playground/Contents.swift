import Foundation

enum LoginResult {
    case success(username: String)
    case failure(reason: String)
}

let result1 = LoginResult.success(username: "erensio")
let result2 = LoginResult.failure(reason: "Wrong password")


func handleLoginResult(_ result: LoginResult){
    switch result{
    case .success(let username):
        print("Welcome, \(username)")
    case .failure(let reason):
        print(reason)
    }
}

handleLoginResult(result1)
handleLoginResult(result2)

enum Season: String, CaseIterable {

    case spring = "Spring"
    case summer = "Summer"
    case autumn = "Autumn"
    case winter = "Winter"

}

for season in Season.allCases {
    print(season.rawValue)
}

