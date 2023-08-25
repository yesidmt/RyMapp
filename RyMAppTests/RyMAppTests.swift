//
//  UserViewTests.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import XCTest
import CoreData
@testable import CeibaApp

final class UserViewTests: XCTestCase {

    var interactor: ListUserInteractor!
        
    override func setUp() {
           super.setUp()
           interactor = ListUserInteractor()
           // Configurar cualquier configuración adicional necesaria para las pruebas
       }
    func testGetUserDB() {
           // Crear un contexto de prueba en memoria
           let persistentContainer = NSPersistentContainer(name: "YourDataModel")
           let description = NSPersistentStoreDescription()
           description.type = NSInMemoryStoreType
           persistentContainer.persistentStoreDescriptions = [description]
           persistentContainer.loadPersistentStores { _, error in
               XCTAssertNil(error, "Error al cargar la base de datos en memoria: \(error?.localizedDescription ?? "")")
           }
           // Llamar a la función getUserDB()
            let returnedUsers = interactor.getUserDB()
           
           // Verificar si se devolvieron datos o no
           XCTAssertTrue(!returnedUsers.isEmpty, "La función getUserDB() no devolvió datos")
           
           // Realizar otras comprobaciones si es necesario
       }
    
    class MockURLSession: URLSession {
        var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
        
        override func dataTask(
            with url: URL,
            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
        ) -> URLSessionDataTask {
            self.completionHandler = completionHandler
            return MockURLSessionDataTask()
        }
    }
    
    // Mock object for URLSessionDataTask
    class MockURLSessionDataTask: URLSessionDataTask {
        override func resume() {
            // Do nothing as we are mocking the network call
        }
    }
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   
    
    

}
