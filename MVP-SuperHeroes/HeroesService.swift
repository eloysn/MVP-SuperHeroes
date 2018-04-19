

import Foundation


enum ErrorSessionAPI  {
    case responseErrorServer(_ : Error)
    case errorNotDecodeJson
    case errorBadStatusCode
    case errorBadResponse 
    
}

final class HeroesService {
    // MARK: - API Private
    
    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        return session
    }()
    
     func getHeroes(request: Resource, completion: @escaping (Result<Heroes, ErrorSessionAPI>) -> Void ) {
        
            let request = request.requestWithBaseURL()
            let task = self.session.dataTask(with: request) { (data, response, error) in
                
                if let err = error  {
                    completion(.Failure(.responseErrorServer(err)))
                    return
                }
                    //print(String(data: data ?? Data(), encoding: .utf8))
                guard let data = data else{
                    completion(.Failure(ErrorSessionAPI.errorBadResponse))
                    return
                }
                guard let heroes = try? JSONDecoder().decode(Heroes.self, from: data) else {
                    completion(Result.Failure(ErrorSessionAPI.errorNotDecodeJson))
                    return
                }
                
                completion(.Success(heroes))
                
            }
            task.resume()
        
    }
    
    
    
    



}


    
    
    





