//
//  NewsApiRequestBuilder.swift
//  AppSUI
//
//  Created by Exey Panteleev on 28.08.2023.
//

import Foundation
import LoLDictionaryNetwork
import ComposableArchitecture
//import DIProject
final class URLSessionRequestBuilderFactoryLoLDictionary: RequestBuilderFactory {
    
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type {
        URLSessionRequestBuilder<T>.self
    }
    
    func getBuilder<T>() -> RequestBuilder<T>.Type where T : Decodable {
        LoLDictionaryRequestBuilder<T>.self
    }
    
}

final class LoLDictionaryRequestBuilder<T:Decodable>: URLSessionDecodableRequestBuilder<T> {
    
    override func createURLSession() -> URLSessionProtocol {
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = buildHeaders()
            let sessionDelegate: SSLPinnedSessionDelegate = .init()
            sessionDelegate.credential = OpenAPIClientAPI.credential
            sessionDelegate.taskDidReceiveChallenge = taskDidReceiveChallenge
            return URLSession(configuration: configuration,
                              delegate: sessionDelegate,
                              delegateQueue: nil)

    }
    
    /// For Logging and Caching
    override func createURLRequest(urlSession: URLSessionProtocol, method: HTTPMethod, encoding: ParameterEncoding, headers: [String: String]) throws -> URLRequest {

        guard let url = URL(string: URLString) else {
            throw DownloadException.requestMissingURL
        }

        var originalRequest = URLRequest(url: url)

        originalRequest.httpMethod = method.rawValue

        headers.forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        buildHeaders().forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        let modifiedRequest = try encoding.encode(originalRequest, with: parameters)

        return modifiedRequest
    }
    
}

final class SSLPinnedSessionDelegate: NSObject, URLSessionDelegate, URLSessionDataDelegate {
 
    var credential: URLCredential?

    var taskDidReceiveChallenge: ((URLSession, URLSessionTask, URLAuthenticationChallenge) -> (URLSession.AuthChallengeDisposition, URLCredential?))?

    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil);
            return
        }
            
        guard let certificate:SecCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
            // SSL Policies for domain name check
            let policy = NSMutableArray()
            policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))
            
            //evaluate server certifiacte
            let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
            //Local and Remote certificate Data
            let remoteCertificateData:NSData = SecCertificateCopyData(certificate)
            let pathToCertificate = Bundle.main.path(forResource: "", ofType: "cer")
            let localCertificateData:NSData = NSData(contentsOfFile: pathToCertificate!)!
            
            //Compare certificates
        if(isServerTrusted && remoteCertificateData.isEqual(to: localCertificateData as Data)){
                let credential: URLCredential =  URLCredential(trust: serverTrust)
                print("✅ Certificate pinning is successfully completed")
                completionHandler(.useCredential, credential)
            }
            else {
                print("❌ Certificate pinning is failed")
                completionHandler(.cancelAuthenticationChallenge, nil)
            }
    }

}
