//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSCognitoIdentityResources.h"
#import <AWSCore/AWSLogging.h>

@interface AWSCognitoIdentityResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSCognitoIdentityResources

+ (instancetype)sharedInstance {
    static AWSCognitoIdentityResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSCognitoIdentityResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2014-06-30\",\
    \"endpointPrefix\":\"cognito-identity\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Cognito Identity\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AWSCognitoIdentityService\"\
  },\
  \"operations\":{\
    \"CreateIdentityPool\":{\
      \"name\":\"CreateIdentityPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateIdentityPoolInput\"},\
      \"output\":{\"shape\":\"IdentityPool\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a new identity pool. The identity pool is a store of user identity information that is specific to your AWS account. The limit on identity pools is 60 per account. The keys for <code>SupportedLoginProviders</code> are as follows: <ul> <li>Facebook: <code>graph.facebook.com</code></li> <li>Google: <code>accounts.google.com</code></li> <li>Amazon: <code>www.amazon.com</code></li> <li>Twitter: <code>api.twitter.com</code></li> <li>Digits: <code>www.digits.com</code></li> </ul> You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"DeleteIdentities\":{\
      \"name\":\"DeleteIdentities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteIdentitiesInput\"},\
      \"output\":{\"shape\":\"DeleteIdentitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"DeleteIdentityPool\":{\
      \"name\":\"DeleteIdentityPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteIdentityPoolInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a user pool. Once a pool is deleted, users will not be able to authenticate with the pool.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"DescribeIdentity\":{\
      \"name\":\"DescribeIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeIdentityInput\"},\
      \"output\":{\"shape\":\"IdentityDescription\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata related to the given identity, including when the identity was created and any associated linked logins.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"DescribeIdentityPool\":{\
      \"name\":\"DescribeIdentityPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeIdentityPoolInput\"},\
      \"output\":{\"shape\":\"IdentityPool\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"GetCredentialsForIdentity\":{\
      \"name\":\"GetCredentialsForIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCredentialsForIdentityInput\"},\
      \"output\":{\"shape\":\"GetCredentialsForIdentityResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidIdentityPoolConfigurationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"ExternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the appropriate role for the token.</p><p>This is a public API. You do not need any credentials to call this API.</p>\"\
    },\
    \"GetId\":{\
      \"name\":\"GetId\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdInput\"},\
      \"output\":{\"shape\":\"GetIdResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ExternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.</p><p>This is a public API. You do not need any credentials to call this API.</p>\"\
    },\
    \"GetIdentityPoolRoles\":{\
      \"name\":\"GetIdentityPoolRoles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityPoolRolesInput\"},\
      \"output\":{\"shape\":\"GetIdentityPoolRolesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the roles for an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"GetOpenIdToken\":{\
      \"name\":\"GetOpenIdToken\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOpenIdTokenInput\"},\
      \"output\":{\"shape\":\"GetOpenIdTokenResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"ExternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by <a>GetId</a>. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.</p> <p>The OpenId token is valid for 15 minutes.</p><p>This is a public API. You do not need any credentials to call this API.</p>\"\
    },\
    \"GetOpenIdTokenForDeveloperIdentity\":{\
      \"name\":\"GetOpenIdTokenForDeveloperIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOpenIdTokenForDeveloperIdentityInput\"},\
      \"output\":{\"shape\":\"GetOpenIdTokenForDeveloperIdentityResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"DeveloperUserAlreadyRegisteredException\"}\
      ],\
      \"documentation\":\"<p>Registers (or retrieves) a Cognito <code>IdentityId</code> and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the <code>Logins</code> map, which is linked to the identity pool. The developer provider is the \\\"domain\\\" by which Cognito will refer to your users.</p> <p>You can use <code>GetOpenIdTokenForDeveloperIdentity</code> to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the <code>IdentityId</code> should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing <code>IdentityId</code>. This API will create the identity in the specified <code>IdentityPoolId</code>.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"ListIdentities\":{\
      \"name\":\"ListIdentities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListIdentitiesInput\"},\
      \"output\":{\"shape\":\"ListIdentitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the identities in a pool.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"ListIdentityPools\":{\
      \"name\":\"ListIdentityPools\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListIdentityPoolsInput\"},\
      \"output\":{\"shape\":\"ListIdentityPoolsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists all of the Cognito identity pools registered for your account.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"LookupDeveloperIdentity\":{\
      \"name\":\"LookupDeveloperIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"LookupDeveloperIdentityInput\"},\
      \"output\":{\"shape\":\"LookupDeveloperIdentityResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the <code>IdentityID</code> associated with a <code>DeveloperUserIdentifier</code> or the list of <code>DeveloperUserIdentifier</code>s associated with an <code>IdentityId</code> for an existing identity. Either <code>IdentityID</code> or <code>DeveloperUserIdentifier</code> must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, <code>DeveloperUserIdentifier</code> will be matched against <code>IdentityID</code>. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise a <code>ResourceConflictException</code> is thrown.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"MergeDeveloperIdentities\":{\
      \"name\":\"MergeDeveloperIdentities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"MergeDeveloperIdentitiesInput\"},\
      \"output\":{\"shape\":\"MergeDeveloperIdentitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Merges two users having different <code>IdentityId</code>s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user (<code>SourceUserIdentifier</code>) with the <code>IdentityId</code> of the <code>DestinationUserIdentifier</code>. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"SetIdentityPoolRoles\":{\
      \"name\":\"SetIdentityPoolRoles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIdentityPoolRolesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Sets the roles for an identity pool. These roles are used when making calls to <code>GetCredentialsForIdentity</code> action.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"UnlinkDeveloperIdentity\":{\
      \"name\":\"UnlinkDeveloperIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnlinkDeveloperIdentityInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Unlinks a <code>DeveloperUserIdentifier</code> from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    },\
    \"UnlinkIdentity\":{\
      \"name\":\"UnlinkIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnlinkIdentityInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"ExternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.</p><p>This is a public API. You do not need any credentials to call this API.</p>\"\
    },\
    \"UpdateIdentityPool\":{\
      \"name\":\"UpdateIdentityPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IdentityPool\"},\
      \"output\":{\"shape\":\"IdentityPool\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Updates a user pool.</p><p>You must use AWS Developer credentials to call this API.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ARNString\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"AccessKeyString\":{\"type\":\"string\"},\
    \"AccountId\":{\
      \"type\":\"string\",\
      \"max\":15,\
      \"min\":1,\
      \"pattern\":\"\\\\d+\"\
    },\
    \"CognitoIdentityProvider\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProviderName\":{\
          \"shape\":\"CognitoIdentityProviderName\",\
          \"documentation\":\"<p>The provider name for a Cognito User Identity Pool. For example, <code>cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789</code>.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"CognitoIdentityProviderClientId\",\
          \"documentation\":\"<p>The client ID for the Cognito User Identity Pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A provider representing a Cognito User Identity Pool and its client ID.</p>\"\
    },\
    \"CognitoIdentityProviderClientId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w_]+\"\
    },\
    \"CognitoIdentityProviderList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CognitoIdentityProvider\"}\
    },\
    \"CognitoIdentityProviderName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w._:/-]+\"\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message returned by a ConcurrentModificationException.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Thrown if there are parallel requests to modify a resource.</p>\",\
      \"exception\":true\
    },\
    \"CreateIdentityPoolInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolName\",\
        \"AllowUnauthenticatedIdentities\"\
      ],\
      \"members\":{\
        \"IdentityPoolName\":{\
          \"shape\":\"IdentityPoolName\",\
          \"documentation\":\"<p>A string that you provide.</p>\"\
        },\
        \"AllowUnauthenticatedIdentities\":{\
          \"shape\":\"IdentityPoolUnauthenticated\",\
          \"documentation\":\"<p>TRUE if the identity pool supports unauthenticated logins.</p>\"\
        },\
        \"SupportedLoginProviders\":{\
          \"shape\":\"IdentityProviders\",\
          \"documentation\":\"<p>Optional key:value pairs mapping provider names to provider app IDs.</p>\"\
        },\
        \"DeveloperProviderName\":{\
          \"shape\":\"DeveloperProviderName\",\
          \"documentation\":\"<p>The \\\"domain\\\" by which Cognito will refer to your users. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. For the <code>DeveloperProviderName</code>, you can use letters as well as period (<code>.</code>), underscore (<code>_</code>), and dash (<code>-</code>).</p> <p>Once you have set a developer provider name, you cannot change it. Please take care in setting this parameter.</p>\"\
        },\
        \"OpenIdConnectProviderARNs\":{\
          \"shape\":\"OIDCProviderList\",\
          \"documentation\":\"<p>A list of OpendID Connect provider ARNs.</p>\"\
        },\
        \"CognitoIdentityProviders\":{\
          \"shape\":\"CognitoIdentityProviderList\",\
          \"documentation\":\"<p>A list representing a Cognito User Identity Pool and its client ID.</p>\"\
        },\
        \"SamlProviderARNs\":{\"shape\":\"SAMLProviderList\"}\
      },\
      \"documentation\":\"<p>Input to the CreateIdentityPool action.</p>\"\
    },\
    \"Credentials\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessKeyId\":{\
          \"shape\":\"AccessKeyString\",\
          \"documentation\":\"<p>The Access Key portion of the credentials.</p>\"\
        },\
        \"SecretKey\":{\
          \"shape\":\"SecretKeyString\",\
          \"documentation\":\"<p>The Secret Access Key portion of the credentials</p>\"\
        },\
        \"SessionToken\":{\
          \"shape\":\"SessionTokenString\",\
          \"documentation\":\"<p>The Session Token portion of the credentials</p>\"\
        },\
        \"Expiration\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date at which these credentials will expire.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Credentials for the provided identity ID.</p>\"\
    },\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DeleteIdentitiesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityIdsToDelete\"],\
      \"members\":{\
        \"IdentityIdsToDelete\":{\
          \"shape\":\"IdentityIdList\",\
          \"documentation\":\"<p>A list of 1-60 identities that you want to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>DeleteIdentities</code> action.</p>\"\
    },\
    \"DeleteIdentitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnprocessedIdentityIds\":{\
          \"shape\":\"UnprocessedIdentityIdList\",\
          \"documentation\":\"<p>An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned in response to a successful <code>DeleteIdentities</code> operation.</p>\"\
    },\
    \"DeleteIdentityPoolInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        }\
      },\
      \"documentation\":\"<p>Input to the DeleteIdentityPool action.</p>\"\
    },\
    \"DescribeIdentityInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityId\"],\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>DescribeIdentity</code> action.</p>\"\
    },\
    \"DescribeIdentityPoolInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        }\
      },\
      \"documentation\":\"Input to the DescribeIdentityPool action.\"\
    },\
    \"DeveloperProviderName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w._-]+\"\
    },\
    \"DeveloperUserAlreadyRegisteredException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>This developer user identifier is already registered with Cognito.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The provided developer user identifier is already registered with Cognito under a different identity ID.</p>\",\
      \"exception\":true\
    },\
    \"DeveloperUserIdentifier\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[\\\\w.@_-]+\"\
    },\
    \"DeveloperUserIdentifierList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeveloperUserIdentifier\"}\
    },\
    \"ErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AccessDenied\",\
        \"InternalServerError\"\
      ]\
    },\
    \"ExternalServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message returned by an ExternalServiceException</p>\"\
        }\
      },\
      \"documentation\":\"<p>An exception thrown when a dependent service such as Facebook or Twitter is not responding</p>\",\
      \"exception\":true\
    },\
    \"GetCredentialsForIdentityInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityId\"],\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"Logins\":{\
          \"shape\":\"LoginsMap\",\
          \"documentation\":\"<p>A set of optional name-value pairs that map provider names to provider tokens.</p>\"\
        },\
        \"CustomRoleArn\":{\"shape\":\"ARNString\"}\
      },\
      \"documentation\":\"<p>Input to the <code>GetCredentialsForIdentity</code> action.</p>\"\
    },\
    \"GetCredentialsForIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"Credentials\":{\
          \"shape\":\"Credentials\",\
          \"documentation\":\"<p>Credentials for the provided identity ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned in response to a successful <code>GetCredentialsForIdentity</code> operation.</p>\"\
    },\
    \"GetIdInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"A standard AWS account ID (9+ digits).\"\
        },\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        },\
        \"Logins\":{\
          \"shape\":\"LoginsMap\",\
          \"documentation\":\"<p>A set of optional name-value pairs that map provider names to provider tokens.</p> <p>The available provider names for <code>Logins</code> are as follows: <ul> <li>Facebook: <code>graph.facebook.com</code></li> <li>Amazon Cognito Identity Provider: <code>cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789</code></li> <li>Google: <code>accounts.google.com</code></li> <li>Amazon: <code>www.amazon.com</code></li> <li>Twitter: <code>api.twitter.com</code></li> <li>Digits: <code>www.digits.com</code></li> </ul> </p>\"\
        }\
      },\
      \"documentation\":\"Input to the GetId action.\"\
    },\
    \"GetIdResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A unique identifier in the format REGION:GUID.\"\
        }\
      },\
      \"documentation\":\"Returned in response to a GetId request.\"\
    },\
    \"GetIdentityPoolRolesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>GetIdentityPoolRoles</code> action.</p>\"\
    },\
    \"GetIdentityPoolRolesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        },\
        \"Roles\":{\
          \"shape\":\"RolesMap\",\
          \"documentation\":\"<p>The map of roles associated with this pool. Currently only authenticated and unauthenticated roles are supported.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned in response to a successful <code>GetIdentityPoolRoles</code> operation.</p>\"\
    },\
    \"GetOpenIdTokenForDeveloperIdentityInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"Logins\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"Logins\":{\
          \"shape\":\"LoginsMap\",\
          \"documentation\":\"<p>A set of optional name-value pairs that map provider names to provider tokens. Each name-value pair represents a user from a public provider or developer provider. If the user is from a developer provider, the name-value pair will follow the syntax <code>\\\"developer_provider_name\\\": \\\"developer_user_identifier\\\"</code>. The developer provider is the \\\"domain\\\" by which Cognito will refer to your users; you provided this domain while creating/updating the identity pool. The developer user identifier is an identifier from your backend that uniquely identifies a user. When you create an identity pool, you can specify the supported logins.</p>\"\
        },\
        \"TokenDuration\":{\
          \"shape\":\"TokenDuration\",\
          \"documentation\":\"<p>The expiration time of the token, in seconds. You can specify a custom expiration time for the token so that you can cache it. If you don't provide an expiration time, the token is valid for 15 minutes. You can exchange the token with Amazon STS for temporary AWS credentials, which are valid for a maximum of one hour. The maximum token duration you can set is 24 hours. You should take care in setting the expiration time for a token, as there are significant security implications: an attacker could use a leaked token to access your AWS resources for the token's duration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>GetOpenIdTokenForDeveloperIdentity</code> action.</p>\"\
    },\
    \"GetOpenIdTokenForDeveloperIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"Token\":{\
          \"shape\":\"OIDCToken\",\
          \"documentation\":\"<p>An OpenID token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned in response to a successful <code>GetOpenIdTokenForDeveloperIdentity</code> request.</p>\"\
    },\
    \"GetOpenIdTokenInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityId\"],\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A unique identifier in the format REGION:GUID.\"\
        },\
        \"Logins\":{\
          \"shape\":\"LoginsMap\",\
          \"documentation\":\"<p>A set of optional name-value pairs that map provider names to provider tokens. When using graph.facebook.com and www.amazon.com, supply the access_token returned from the provider's authflow. For accounts.google.com, an Amazon Cognito Identity Provider, or any other OpenId Connect provider, always include the <code>id_token</code>.</p>\"\
        }\
      },\
      \"documentation\":\"Input to the GetOpenIdToken action.\"\
    },\
    \"GetOpenIdTokenResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A unique identifier in the format REGION:GUID. Note that the IdentityId returned may not match the one passed on input.\"\
        },\
        \"Token\":{\
          \"shape\":\"OIDCToken\",\
          \"documentation\":\"An OpenID token, valid for 15 minutes.\"\
        }\
      },\
      \"documentation\":\"Returned in response to a successful GetOpenIdToken request.\"\
    },\
    \"HideDisabled\":{\"type\":\"boolean\"},\
    \"IdentitiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityDescription\"}\
    },\
    \"IdentityDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A unique identifier in the format REGION:GUID.\"\
        },\
        \"Logins\":{\
          \"shape\":\"LoginsList\",\
          \"documentation\":\"A set of optional name-value pairs that map provider names to provider tokens.\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>Date on which the identity was created.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>Date on which the identity was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"A description of the identity.\"\
    },\
    \"IdentityId\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+:[0-9a-f-]+\"\
    },\
    \"IdentityIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityId\"},\
      \"max\":60,\
      \"min\":1\
    },\
    \"IdentityPool\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityPoolName\",\
        \"AllowUnauthenticatedIdentities\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        },\
        \"IdentityPoolName\":{\
          \"shape\":\"IdentityPoolName\",\
          \"documentation\":\"<p>A string that you provide.</p>\"\
        },\
        \"AllowUnauthenticatedIdentities\":{\
          \"shape\":\"IdentityPoolUnauthenticated\",\
          \"documentation\":\"TRUE if the identity pool supports unauthenticated logins.\"\
        },\
        \"SupportedLoginProviders\":{\
          \"shape\":\"IdentityProviders\",\
          \"documentation\":\"<p>Optional key:value pairs mapping provider names to provider app IDs.</p>\"\
        },\
        \"DeveloperProviderName\":{\
          \"shape\":\"DeveloperProviderName\",\
          \"documentation\":\"<p>The \\\"domain\\\" by which Cognito will refer to your users.</p>\"\
        },\
        \"OpenIdConnectProviderARNs\":{\
          \"shape\":\"OIDCProviderList\",\
          \"documentation\":\"<p>A list of OpendID Connect provider ARNs.</p>\"\
        },\
        \"CognitoIdentityProviders\":{\
          \"shape\":\"CognitoIdentityProviderList\",\
          \"documentation\":\"<p>A list representing a Cognito User Identity Pool and its client ID.</p>\"\
        },\
        \"SamlProviderARNs\":{\"shape\":\"SAMLProviderList\"}\
      },\
      \"documentation\":\"An object representing a Cognito identity pool.\"\
    },\
    \"IdentityPoolId\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+:[0-9a-f-]+\"\
    },\
    \"IdentityPoolName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w ]+\"\
    },\
    \"IdentityPoolShortDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        },\
        \"IdentityPoolName\":{\
          \"shape\":\"IdentityPoolName\",\
          \"documentation\":\"A string that you provide.\"\
        }\
      },\
      \"documentation\":\"A description of the identity pool.\"\
    },\
    \"IdentityPoolUnauthenticated\":{\"type\":\"boolean\"},\
    \"IdentityPoolsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityPoolShortDescription\"}\
    },\
    \"IdentityProviderId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w.;_/-]+\"\
    },\
    \"IdentityProviderName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"IdentityProviderToken\":{\
      \"type\":\"string\",\
      \"max\":50000,\
      \"min\":1\
    },\
    \"IdentityProviders\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"IdentityProviderName\"},\
      \"value\":{\"shape\":\"IdentityProviderId\"},\
      \"max\":10\
    },\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The message returned by an InternalErrorException.\"\
        }\
      },\
      \"documentation\":\"Thrown when the service encounters an error during processing the request.\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidIdentityPoolConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message returned for an <code>InvalidIdentityPoolConfigurationException</code></p>\"\
        }\
      },\
      \"documentation\":\"<p>Thrown if the identity pool has no role associated for the given auth type (auth/unauth) or if the AssumeRole fails.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The message returned by an InvalidParameterException.\"\
        }\
      },\
      \"documentation\":\"Thrown for missing or bad input parameter(s).\",\
      \"exception\":true\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The message returned by a LimitExceededException.\"\
        }\
      },\
      \"documentation\":\"Thrown when the total number of user pools has exceeded a preset limit.\",\
      \"exception\":true\
    },\
    \"ListIdentitiesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"MaxResults\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"QueryLimit\",\
          \"documentation\":\"The maximum number of identities to return.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"A pagination token.\"\
        },\
        \"HideDisabled\":{\
          \"shape\":\"HideDisabled\",\
          \"documentation\":\"<p>An optional boolean parameter that allows you to hide disabled identities. If omitted, the ListIdentities API will include disabled identities in the response.</p>\"\
        }\
      },\
      \"documentation\":\"Input to the ListIdentities action.\"\
    },\
    \"ListIdentitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"An identity pool ID in the format REGION:GUID.\"\
        },\
        \"Identities\":{\
          \"shape\":\"IdentitiesList\",\
          \"documentation\":\"An object containing a set of identities and associated mappings.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"A pagination token.\"\
        }\
      },\
      \"documentation\":\"The response to a ListIdentities request.\"\
    },\
    \"ListIdentityPoolsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"MaxResults\"],\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"QueryLimit\",\
          \"documentation\":\"The maximum number of identities to return.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"A pagination token.\"\
        }\
      },\
      \"documentation\":\"Input to the ListIdentityPools action.\"\
    },\
    \"ListIdentityPoolsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPools\":{\
          \"shape\":\"IdentityPoolsList\",\
          \"documentation\":\"The identity pools returned by the ListIdentityPools action.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"A pagination token.\"\
        }\
      },\
      \"documentation\":\"The result of a successful ListIdentityPools action.\"\
    },\
    \"LoginsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityProviderName\"}\
    },\
    \"LoginsMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"IdentityProviderName\"},\
      \"value\":{\"shape\":\"IdentityProviderToken\"},\
      \"max\":10\
    },\
    \"LookupDeveloperIdentityInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"DeveloperUserIdentifier\":{\
          \"shape\":\"DeveloperUserIdentifier\",\
          \"documentation\":\"<p>A unique ID used by your backend authentication process to identify a user. Typically, a developer identity provider would issue many developer user identifiers, in keeping with the number of users.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"QueryLimit\",\
          \"documentation\":\"<p>The maximum number of identities to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>A pagination token. The first call you make will have <code>NextToken</code> set to null. After that the service will return <code>NextToken</code> values as needed. For example, let's say you make a request with <code>MaxResults</code> set to 10, and there are 20 matches in the database. The service will return a pagination token as a part of the response. This token can be used to call the API again and get results starting from the 11th match.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>LookupDeveloperIdentityInput</code> action.</p>\"\
    },\
    \"LookupDeveloperIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"DeveloperUserIdentifierList\":{\
          \"shape\":\"DeveloperUserIdentifierList\",\
          \"documentation\":\"<p>This is the list of developer user identifiers associated with an identity ID. Cognito supports the association of multiple developer user identifiers with an identity ID.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>A pagination token. The first call you make will have <code>NextToken</code> set to null. After that the service will return <code>NextToken</code> values as needed. For example, let's say you make a request with <code>MaxResults</code> set to 10, and there are 20 matches in the database. The service will return a pagination token as a part of the response. This token can be used to call the API again and get results starting from the 11th match.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned in response to a successful <code>LookupDeveloperIdentity</code> action.</p>\"\
    },\
    \"MergeDeveloperIdentitiesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceUserIdentifier\",\
        \"DestinationUserIdentifier\",\
        \"DeveloperProviderName\",\
        \"IdentityPoolId\"\
      ],\
      \"members\":{\
        \"SourceUserIdentifier\":{\
          \"shape\":\"DeveloperUserIdentifier\",\
          \"documentation\":\"<p>User identifier for the source user. The value should be a <code>DeveloperUserIdentifier</code>.</p>\"\
        },\
        \"DestinationUserIdentifier\":{\
          \"shape\":\"DeveloperUserIdentifier\",\
          \"documentation\":\"<p>User identifier for the destination user. The value should be a <code>DeveloperUserIdentifier</code>.</p>\"\
        },\
        \"DeveloperProviderName\":{\
          \"shape\":\"DeveloperProviderName\",\
          \"documentation\":\"<p>The \\\"domain\\\" by which Cognito will refer to your users. This is a (pseudo) domain name that you provide while creating an identity pool. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. For the <code>DeveloperProviderName</code>, you can use letters as well as period (.), underscore (_), and dash (-).</p>\"\
        },\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>MergeDeveloperIdentities</code> action.</p>\"\
    },\
    \"MergeDeveloperIdentitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned in response to a successful <code>MergeDeveloperIdentities</code> action.</p>\"\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The message returned by a NotAuthorizedException\"\
        }\
      },\
      \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\",\
      \"exception\":true\
    },\
    \"OIDCProviderList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ARNString\"}\
    },\
    \"OIDCToken\":{\"type\":\"string\"},\
    \"PaginationKey\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"QueryLimit\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":1\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The message returned by a ResourceConflictException.\"\
        }\
      },\
      \"documentation\":\"Thrown when a user tries to use a login which is already linked to another account.\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The message returned by a ResourceNotFoundException.\"\
        }\
      },\
      \"documentation\":\"Thrown when the requested resource (for example, a dataset or record) does not exist.\",\
      \"exception\":true\
    },\
    \"RoleType\":{\
      \"type\":\"string\",\
      \"pattern\":\"(un)?authenticated\"\
    },\
    \"RolesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"RoleType\"},\
      \"value\":{\"shape\":\"ARNString\"},\
      \"max\":2\
    },\
    \"SAMLProviderList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ARNString\"}\
    },\
    \"SecretKeyString\":{\"type\":\"string\"},\
    \"SessionTokenString\":{\"type\":\"string\"},\
    \"SetIdentityPoolRolesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"Roles\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        },\
        \"Roles\":{\
          \"shape\":\"RolesMap\",\
          \"documentation\":\"<p>The map of roles associated with this pool. For a given role, the key will be either \\\"authenticated\\\" or \\\"unauthenticated\\\" and the value will be the Role ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>SetIdentityPoolRoles</code> action.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"TokenDuration\":{\
      \"type\":\"long\",\
      \"max\":86400,\
      \"min\":1\
    },\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"Message returned by a TooManyRequestsException\"\
        }\
      },\
      \"documentation\":\"Thrown when a request is throttled.\",\
      \"exception\":true\
    },\
    \"UnlinkDeveloperIdentityInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityId\",\
        \"IdentityPoolId\",\
        \"DeveloperProviderName\",\
        \"DeveloperUserIdentifier\"\
      ],\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>An identity pool ID in the format REGION:GUID.</p>\"\
        },\
        \"DeveloperProviderName\":{\
          \"shape\":\"DeveloperProviderName\",\
          \"documentation\":\"<p>The \\\"domain\\\" by which Cognito will refer to your users.</p>\"\
        },\
        \"DeveloperUserIdentifier\":{\
          \"shape\":\"DeveloperUserIdentifier\",\
          \"documentation\":\"A unique ID used by your backend authentication process to identify a user.\"\
        }\
      },\
      \"documentation\":\"<p>Input to the <code>UnlinkDeveloperIdentity</code> action.</p>\"\
    },\
    \"UnlinkIdentityInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityId\",\
        \"Logins\",\
        \"LoginsToRemove\"\
      ],\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A unique identifier in the format REGION:GUID.\"\
        },\
        \"Logins\":{\
          \"shape\":\"LoginsMap\",\
          \"documentation\":\"A set of optional name-value pairs that map provider names to provider tokens.\"\
        },\
        \"LoginsToRemove\":{\
          \"shape\":\"LoginsList\",\
          \"documentation\":\"Provider names to unlink from this identity.\"\
        }\
      },\
      \"documentation\":\"Input to the UnlinkIdentity action.\"\
    },\
    \"UnprocessedIdentityId\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"<p>A unique identifier in the format REGION:GUID.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>The error code indicating the type of error that occurred.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.</p>\"\
    },\
    \"UnprocessedIdentityIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UnprocessedIdentityId\"},\
      \"max\":60\
    }\
  },\
  \"documentation\":\"<fullname>Amazon Cognito</fullname> <p>Amazon Cognito is a web service that delivers scoped temporary credentials to mobile devices and other untrusted environments. Amazon Cognito uniquely identifies a device and supplies the user with a consistent identity over the lifetime of an application.</p> <p>Using Amazon Cognito, you can enable authentication with one or more third-party identity providers (Facebook, Google, or Login with Amazon), and you can also choose to support unauthenticated access from your app. Cognito delivers a unique identifier for each user and acts as an OpenID token provider trusted by AWS Security Token Service (STS) to access temporary, limited-privilege AWS credentials.</p> <p>To provide end-user credentials, first make an unsigned call to <a>GetId</a>. If the end user is authenticated with one of the supported identity providers, set the <code>Logins</code> map with the identity provider token. <code>GetId</code> returns a unique identifier for the user.</p> <p>Next, make an unsigned call to <a>GetCredentialsForIdentity</a>. This call expects the same <code>Logins</code> map as the <code>GetId</code> call, as well as the <code>IdentityID</code> originally returned by <code>GetId</code>. Assuming your identity pool has been configured via the <a>SetIdentityPoolRoles</a> operation, <code>GetCredentialsForIdentity</code> will return AWS credentials for your use. If your pool has not been configured with <code>SetIdentityPoolRoles</code>, or if you want to follow legacy flow, make an unsigned call to <a>GetOpenIdToken</a>, which returns the OpenID token necessary to call STS and retrieve AWS credentials. This call expects the same <code>Logins</code> map as the <code>GetId</code> call, as well as the <code>IdentityID</code> originally returned by <code>GetId</code>. The token returned by <code>GetOpenIdToken</code> can be passed to the STS operation <a href=\\\"http://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html\\\">AssumeRoleWithWebIdentity</a> to retrieve AWS credentials.</p> <p>If you want to use Amazon Cognito in an Android, iOS, or Unity application, you will probably want to make API calls via the AWS Mobile SDK. To learn more, see the <a href=\\\"http://docs.aws.amazon.com/mobile/index.html\\\">AWS Mobile SDK Developer Guide</a>.</p>\"\
}\
";
}

@end
