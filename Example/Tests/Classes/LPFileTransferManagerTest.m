//
//  LPFileTransferManagerTest.m
//  Leanplum-SDK_Tests
//
//  Created by Mayank Sanganeria on 2/10/19.
//  Copyright © 2019 Leanplum. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Leanplum/LPFileTransferManager.h>

@interface LPFileTransferManagerTest : XCTestCase

@end

@interface LPFileTransferManager(UnitTest)

@property (nonatomic, strong) NSMutableDictionary *fileTransferStatus;

@property (nonatomic, strong) NSMutableDictionary *fileUploadSize;
@property (nonatomic, strong) NSMutableDictionary *fileUploadProgress;
@property (nonatomic, strong) NSString *fileUploadProgressString;
@property (nonatomic, strong) NSMutableDictionary *pendingUploads;
@property (nonatomic, strong) NSDictionary *requestHeaders;

@property (nonatomic, assign) int pendingDownloads;
@property (nonatomic, strong) LeanplumVariablesChangedBlock noPendingDownloadsBlock;

@property (nonatomic, strong) id<LPNetworkEngineProtocol> engine;

@end


@implementation LPFileTransferManagerTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testSendFilesNow {
}

- (void)testDownloadFile {
    LPFileTransferManager *manager = [[LPFileTransferManager alloc] init];

    manager.engine = OCMProtocolMock(@protocol(LPNetworkEngineProtocol));
    id opMock = OCMProtocolMock(@protocol(LPNetworkOperationProtocol));
    OCMStub([manager.engine operationWithPath:[OCMArg any] params:[OCMArg any] httpMethod:[OCMArg any] ssl:[OCMArg any] timeoutSeconds:60]).andReturn(opMock);
    id<LPNetworkOperationProtocol> p = [manager.engine operationWithPath:@"" params:nil httpMethod:@"post" ssl:nil timeoutSeconds:60];

    [manager downloadFile:@"file.jpg" onResponse:^(id<LPNetworkOperationProtocol> operation, id json) {
    } onError:^(NSError *error) {
    }];

    OCMVerify([manager.engine operationWithPath:[OCMArg any] params:[OCMArg any] httpMethod:[OCMArg any] ssl:[OCMArg any] timeoutSeconds:60]);

//    OCMVerify([manager.engine enqueueOperation:opMock]);
//    OCMVerify([opMock addCompletionHandler:[OCMArg any] errorHandler:[OCMArg any]]);
}

- (void)testDownloadFile2 {
    //    XCTestExpectation *expectation = [self expectationWithDescription:@"success callback called"];
//    [manager downloadFile:@"file.jpg" onResponse:^(id<LPNetworkOperationProtocol> operation, id json) {
        //        NSLog(@"success");
        //        [expectation fulfill];
//    } onError:^(NSError *error) {
        //        NSLog(@"failure");
//    }];
//
    //    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
    //        if (error) {
    //            NSLog(@"Timeout Error: %@", error);
    //        }
    //    }];
}
- (void)testOnNoPendingDownloads {

}

@end
