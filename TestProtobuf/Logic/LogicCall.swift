//
//  LogicCall.swift
//  MNGA
//
//  Created by Bugen Zhao on 2021/10/6.
//

import Foundation
import SwiftProtobuf
import SubProtobuf

func logicCallAsync<Response: SwiftProtobuf.Message>(
  _ requestValue: AsyncRequest.OneOf_Value,
  requestDispatchQueue: DispatchQueue = .global(qos: .userInitiated),
  onSuccess: @escaping (Response) -> Void,
  onError: @escaping (LogicError) -> Void = { _ in }
) {
  basicLogicCallAsync(requestValue, requestDispatchQueue: requestDispatchQueue, onSuccess: onSuccess, onError: onError)
}

#if os(iOS)
  @available(iOS 15.0, *)
  func logicCallAsync<Response: SwiftProtobuf.Message>(
    _ requestValue: AsyncRequest.OneOf_Value,
    requestDispatchQueue: DispatchQueue = .global(qos: .userInitiated)
  ) async -> Result<Response, LogicError> {
    await withCheckedContinuation { (continuation: CheckedContinuation<Result<Response, LogicError>, Never>) in
      logicCallAsync(requestValue, requestDispatchQueue: requestDispatchQueue)
        { (res: Response) in
          continuation.resume(returning: .success(res))
        } onError: { err in
          continuation.resume(returning: .failure(err))
        }
    }
  }
#endif
