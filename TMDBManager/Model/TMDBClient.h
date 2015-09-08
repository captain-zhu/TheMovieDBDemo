//
//  TMDBClient.h
//  TMDBManager
//
//  Created by zhu yongxuan on 15/9/7.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Constants

struct ConstantsStruct {
    __unsafe_unretained NSString * const ApiKey;
    __unsafe_unretained NSString * const BaseURL;
    __unsafe_unretained NSString * const AuthorizationURL;
};

#pragma mark - Methods

struct MethodsStruct {
    // 关于账号的method
    __unsafe_unretained NSString *Account;
    __unsafe_unretained NSString *AccountIDFavoriteMovie;
    __unsafe_unretained NSString *AccountIDFavorite;
    __unsafe_unretained NSString *AccountIDWatchlistMovie;
    __unsafe_unretained NSString *AccountIDWatchlist;

    // 关于认证的method
    __unsafe_unretained NSString *AuthenticationTokenNew;
    __unsafe_unretained NSString *AuthticationSessionNew;

    // 关于search的method
    __unsafe_unretained NSString *SearchMovie;

    // 关于配置的method
    __unsafe_unretained NSString *Configuration;
};

#pragma mark - URLKeys

struct URLKeysStruct {
    __unsafe_unretained NSString *URLID;
};

#pragma mark  - ParameterKeys

struct ParameterKeysStruct {
    __unsafe_unretained NSString *ApiKey;
    __unsafe_unretained NSString *SessionID;
    __unsafe_unretained NSString *RequestToken;
    __unsafe_unretained NSString *Query;
};

#pragma mark  - JSONBodyKeys

struct JSONBodyKeysStruct {
    __unsafe_unretained NSString *MediaType;
    __unsafe_unretained NSString *MediaID;
    __unsafe_unretained NSString *Favorite;
    __unsafe_unretained NSString *Watchlist;
};


@interface TMDBClient : NSObject

@property (nonatomic, weak) struct ConstantsStruct Constants;
@property (nonatomic, weak) struct MethodsStruct Methods;
@property (nonatomic, weak) struct URLKeysStruct URLKeys;
@property (nonatomic, weak) struct ParameterKeysStruct ParameterKeys;
@property (nonatomic, weak) struct JSONBodyKeysStruct JSONBodyKeys;

@end
