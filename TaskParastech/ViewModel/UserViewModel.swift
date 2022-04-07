//
//  UserViewModel.swift
//  TaskParastech
//
//  Created by Deeksha Sharma on 07/04/22.
//

import Foundation

class UserViewModel {
    
    var userModel : UserModel?
    
    func getAllUserData(completion: @escaping(_ status: Bool) -> ()) {
          let string = "https://randomuser.me/api/0.4/?randomapi"
          let url = NSURL(string: string)
          let request = NSMutableURLRequest(url: url! as URL)
          request.httpMethod = "GET"
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
   
          let session = URLSession.shared

          let _ = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error == nil{
                if let data = data {
                    do{
                        let userResponse = try JSONDecoder().decode(UserModel.self, from: data)
                        print(userResponse)
                        self.userModel = userResponse
                        completion(true)
                    }catch let err{
                        completion(false)
                        print(err.localizedDescription)
                    }
                }
            }else{
                completion(false)
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
    func getUserData() -> [Results] {
        return userModel?.results ?? []
    }

}
