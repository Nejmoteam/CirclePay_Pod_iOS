//
//  AppDelegate.swift
//  CirclePay_Pod_iOS
//
//  Created by adelmohey on 04/06/2022.
//  Copyright (c) 2022 adelmohey. All rights reserved.
//

import UIKit
import CirclePay_Pod_iOS
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CirclePay.prepareSDK()
        CirclePay.merchantToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgwLCJpc1ZlcmlmaWVkIjpmYWxzZSwidG9rZW4iOiIiLCJmb3JnZXRQYXNzd29yZHRva2VuIjoiIiwiZ29vZ2xlT2F1dGhJRCI6IiIsImZhY2Vib29rT2F0aElkIjoiIiwiYXV0aHlfaWQiOiIiLCJzdGF0dXMiOiIwIiwiYWRkcmVzcyI6IiIsImJ1c2luZXNzTmFtZSI6IiIsImZpcnN0TmFtZSI6Ik5vaGEiLCJsYXN0TmFtZSI6IkV0aXNhbGF0IHRlc3QiLCJlbWFpbCI6Im5vaGFyYWRpQGNpcmNsZXBheS5haSIsInBhc3N3b3JkIjoiJDJhJDA4JHhnc2lIeUNMcUVOWVptbDRheXJQeE9lOVo5TzF0VEI3YmNSTXU1VWd3Q3djemtTU2lSdk9hIiwibW9iaWxlIjoiKzIwMTE1NDMxMjQ4NSIsImJ1c2luZXNzQWRkcmVzcyI6Ik1hZGRpIHN0cmVldCIsInVzZXJuYW1lIjpudWxsLCJ1cGRhdGVkQXQiOiIyMDIyLTAyLTE2VDE1OjU1OjU0LjkxMloiLCJjcmVhdGVkQXQiOiIyMDIyLTAyLTE2VDE1OjU1OjU0LjkxMloiLCJhcHBfbmFtZSI6Ik5vaGEgUmFkaSIsImlhdCI6MTY0NTAyNjk1NH0.kJaiGeKWjtdJFec0vPAf2WKXh4eKrr2aJ4P_73EGLt0"
        
        CirclePay.accountToken = "Bearer eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2Iiwia2lkIjpudWxsLCJjdHkiOiJKV1QifQ..dwuPPjmNsyXv4ZuPsuWzQA.3pAMatxtxLHVsakkBnxHz0J57F-qrmpO-TikuVFHQqsVQxnm0bAWiOiC0ZUvL5EjK51ZBILQ483l0164RYqtqEsZkGw4bqyC5tY0v2oQvZrKpk_lUI92njCyKrsaS4BiCN4EOLIa3fOK3Nx5O0ITz1ohYEwbaXhgVm85_VzOhxzrlVf0IVBV3qjYpHAy5gaA8FYu0tQQGlLP3jK10oeVvSScwokk48gujXIRVnDwAuMtYCoWaWxtYxm1ZXQpfZekTV9EgEGAYvSiuC5FAF3a-yh3c7gwzYK5ips3EXhJVbzSaZcZnesCNV4h6EEoKzsb-f_BRiY9sw-SQXX71dzjOYYVS7mH4OrZvPIVw1H8tIJ1nVd3j2QlYsYfh4mfKVoS.5A12HGs6ExJiddpAF1B0oQ"
        
        CirclePay.accountKey = "e1a69fb4-193e-3756-b600-5fade92c5eb4"
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

