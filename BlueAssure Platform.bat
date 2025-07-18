BlueAssure Platform
Integration API Documentation
JSON API Version 3.0.0
Last Update: April 9th
, 2025
Table of Contents
Overview ....................................................................................................................................................... 8
Introduction .............................................................................................................................................. 8
Endpoints .................................................................................................................................................. 8
Request ......................................................................................................................................................... 8
Headers ..................................................................................................................................................... 8
Authentication .......................................................................................................................................... 8
IP Restrictions ....................................................................................................................................... 8
Customer Reference Field ......................................................................................................................... 8
Response ....................................................................................................................................................... 9
Meta .......................................................................................................................................................... 9
Web Service Warnings .......................................................................................................................... 9
Errors ......................................................................................................................................................... 9
Solution Decision Workflow ........................................................................................................................ 10
Test Data ..................................................................................................................................................... 10
Example .NET Code ..................................................................................................................................... 11
Example PHP Code ...................................................................................................................................... 12
BlueAssure Products ................................................................................................................................... 13
AssureKYC ............................................................................................................................................... 13
Service URL .......................................................................................................................................... 13
Input Fields .......................................................................................................................................... 13
Test Data ............................................................................................................................................. 13
AssureKYC Request JSON Example ..................................................................................................... 13
AssureKYC Response JSON Example ................................................................................................... 14
AssureID .................................................................................................................................................. 17
Service URL .......................................................................................................................................... 17
Input Fields .......................................................................................................................................... 17
Test Data ............................................................................................................................................. 18
AssureID Request JSON Example ........................................................................................................ 18
AssureID Response JSON Example ...................................................................................................... 18
AssureCorp .............................................................................................................................................. 29
Service URL .......................................................................................................................................... 29
Input Fields .......................................................................................................................................... 29
BlueAssure Platform Integration Documentation | Overview 2
Test Data ............................................................................................................................................. 29
AssureCorp Request JSON Example .................................................................................................... 29
AssureCorp Response JSON Example .................................................................................................. 29
AssureSSN ............................................................................................................................................... 31
Service URL .......................................................................................................................................... 31
Input Fields .......................................................................................................................................... 31
Test Data ............................................................................................................................................. 31
AssureSSN Request JSON Example ..................................................................................................... 31
AssureSSN Response JSON Example ................................................................................................... 31
AssureCanada.......................................................................................................................................... 34
Service URL .......................................................................................................................................... 34
Input Fields .......................................................................................................................................... 34
AssureCanada Request JSON Example ................................................................................................ 34
AssureCanada Response JSON Example ............................................................................................. 35
AssurePhone ........................................................................................................................................... 38
Service URL .......................................................................................................................................... 38
Input Fields .......................................................................................................................................... 38
Test Data ............................................................................................................................................. 38
AssurePhone Request JSON Example ................................................................................................. 38
AssurePhone Response JSON Example ............................................................................................... 38
AssureWatch ........................................................................................................................................... 40
Service URL .......................................................................................................................................... 40
Input Fields .......................................................................................................................................... 40
Test Data ............................................................................................................................................. 40
AssureWatch Request JSON Example ................................................................................................. 41
AssureWatch Response JSON Example ............................................................................................... 41
AssureFinCEN .......................................................................................................................................... 45
Service URL .......................................................................................................................................... 45
Input Fields .......................................................................................................................................... 45
Test Data ............................................................................................................................................. 45
AssureFinCEN Request JSON Example ................................................................................................ 46
AssureFinCEN Response JSON Example .............................................................................................. 46
AssureCard .............................................................................................................................................. 48
BlueAssure Platform Integration Documentation | Overview 3
Service URL .......................................................................................................................................... 48
Input Fields .......................................................................................................................................... 48
Upload Images Directly ....................................................................................................................... 49
Capture Images From Mobile Phone .................................................................................................. 49
Capture Images From Web Portal ....................................................................................................... 49
Receiving Submitted Images ............................................................................................................... 49
Image Quality & Size Recommendations ............................................................................................ 49
Asynchronous Request/Response Process ......................................................................................... 49
Linking the Initial Request and Final Callback ..................................................................................... 50
Test Data ............................................................................................................................................. 51
AssureCard Initial Request (Image Upload) JSON Example ................................................................ 51
AssureCard Initial Request (Web to Mobile) JSON Example............................................................... 51
AssureCard Initial Request (Web Portal) JSON Example ..................................................................... 52
AssureCard Initial Response (Image Upload) JSON Example .............................................................. 52
AssureCard Initial Response (Web to Mobile) JSON Example ............................................................ 52
AssureCard Initial Response (Web Portal) JSON Example .................................................................. 52
AssureCard Webhook Uploaded Images JSON Example .................................................................... 52
AssureCard WebHook Callback JSON Example ................................................................................... 53
AssureFill ................................................................................................................................................. 64
Service URL .......................................................................................................................................... 64
Input Fields .......................................................................................................................................... 64
Image Quality & Size Recommendations ............................................................................................ 64
Upload Images Directly ....................................................................................................................... 65
Capture Images From Mobile Phone .................................................................................................. 65
Capture Images From Web Portal ....................................................................................................... 65
Receiving Submitted Images ............................................................................................................... 65
Test Data ............................................................................................................................................. 65
AssureFill Request (Image Upload) JSON Example ............................................................................. 66
AssureFill Request (Web to Mobile) JSON Example ........................................................................... 66
AssureFill Request (Web Portal) JSON Example ................................................................................. 66
AssureFill Response (Web Portal) JSON Example ............................................................................... 67
AssureFill Webhook Uploaded Images JSON Example ....................................................................... 67
AssureFill Response JSON Example ..................................................................................................... 67
BlueAssure Platform Integration Documentation | Overview 4
AssureAMS .............................................................................................................................................. 69
Service URL .......................................................................................................................................... 69
Input Fields .......................................................................................................................................... 69
Test Data ............................................................................................................................................. 69
AssureAMS Request JSON Example (Individual) ................................................................................. 69
AMS Request JSON Example (Entity) .................................................................................................. 70
AssureAMS Response JSON Example .................................................................................................. 70
PEP .......................................................................................................................................................... 74
Service URL .......................................................................................................................................... 74
Input Fields .......................................................................................................................................... 74
Test Data ............................................................................................................................................. 74
PEP Request JSON Example (Individual) ............................................................................................. 74
PEP Response JSON Example .............................................................................................................. 75
AssurePay ................................................................................................................................................ 77
Service URL .......................................................................................................................................... 77
Input Fields .......................................................................................................................................... 77
Test Data ............................................................................................................................................. 78
AssurePay Request JSON Example ...................................................................................................... 78
AssurePay Response JSON Example.................................................................................................... 78
AssureLocate ........................................................................................................................................... 80
Service URL .......................................................................................................................................... 80
Input Fields .......................................................................................................................................... 80
Test Data ............................................................................................................................................. 80
AssureLocate Request (Web Portal) JSON Example ........................................................................... 80
AssureLocate Request (Web to Mobile) JSON Example ..................................................................... 80
AssureLocate Initial Response (Web Portal) JSON Example ............................................................... 81
AssureLocate Initial Response (Web to Mobile) JSON Example ......................................................... 81
AssureLocate Webhook Callback JSON Example ................................................................................ 81
Appendix A: Response Codes ...................................................................................................................... 83
Address Verification (Level 5) Result Codes............................................................................................ 83
Address Verification (Level 4) Result Codes............................................................................................ 83
Address Verification (Level 3) Result Codes............................................................................................ 86
Address Verification (Level 2) Result Codes............................................................................................ 93
BlueAssure Platform Integration Documentation | Overview 5
Address Verification (Level 1) Result Codes.......................................................................................... 101
Address Verification (Level 0) Result Codes.......................................................................................... 104
Address Unit Mismatch Result Codes ................................................................................................... 104
Phone Mismatch Result Codes ............................................................................................................. 105
Change Of Address Result Codes .......................................................................................................... 105
Address Type Result Codes ................................................................................................................... 105
Address High Risk Result Codes ............................................................................................................ 107
Driver's License Result Codes ................................................................................................................ 107
Phone Verification (Level 5) Result Codes ............................................................................................ 108
Phone Verification (Level 4) Result Codes ............................................................................................ 108
Phone Verification (Level 3) Result Codes ............................................................................................ 109
Phone Verification (Level 2) Result Codes ............................................................................................ 110
Phone Verification (Level 1) Result Codes ............................................................................................ 111
Phone Verification (Level 0) Result Codes ............................................................................................ 111
Caller Type Result Codes ....................................................................................................................... 112
Phone High Risk Result Codes ............................................................................................................... 112
Phone Type Result Codes ...................................................................................................................... 112
Phone Verification Delivery Type Result Codes .................................................................................... 112
SSN Format Validation Result Codes..................................................................................................... 112
Driver's License Format Validation Result Codes .................................................................................. 112
SSN Issue Result Codes ......................................................................................................................... 113
SSN Deceased Result Codes .................................................................................................................. 113
Consumer ID (SSN) Result Codes .......................................................................................................... 113
Date of Birth Result Codes .................................................................................................................... 115
Fraud Shield Results .............................................................................................................................. 116
Exclusion Conditions ............................................................................................................................. 116
Shared Application Result Codes .......................................................................................................... 117
Email Verification Result Codes ............................................................................................................ 124
Email Validation Result Codes............................................................................................................... 124
Email Reason Result Codes ................................................................................................................... 124
Email Repository Result Codes ............................................................................................................. 124
IP Address Verification Result Codes - City ........................................................................................... 125
IP Address Verification Result Codes - State ......................................................................................... 125
BlueAssure Platform Integration Documentation | Overview 6
IP Address Verification Result Codes – Zip Code .................................................................................. 125
IP Address Verification Result Codes – Country ................................................................................... 125
Card Document Validation Result Codes .............................................................................................. 126
Card Image Parsing Result Codes .......................................................................................................... 126
Fill Document Validation Result Codes ................................................................................................. 126
Fill Document Expiration Result Codes ................................................................................................. 126
Legacy Address Verification Result Codes ............................................................................................ 127
Legacy Phone Verification Result Codes ............................................................................................... 128
Appendix B: AssureCanada Match Codes ................................................................................................ 131
Appendix C: AssureWatch Match Codes .................................................................................................. 134
AssureWatch Field-Level Result Codes ................................................................................................. 134
Appendix D: AssureFinCEN Match Codes ................................................................................................. 135
AssureFinCEN Validation Result Codes ................................................................................................. 135
Appendix E: AssureAMS Match Codes ...................................................................................................... 136
AssureAMS Match Found Codes ........................................................................................................... 136
AssureAMS Type Categories ................................................................................................................. 136
AssureAMS SubType Categories ........................................................................................................... 138
Appendix F: PEP Match Codes .................................................................................................................. 139
PEP Match Result Codes ....................................................................................................................... 139
PEP Risk Types ....................................................................................................................................... 139
Appendix G: AssurePay Match Codes ....................................................................................................... 140
AssurePay Attribute Match Codes ........................................................................................................ 140
Appendix H: AssureLocate Match Codes .................................................................................................. 141
AssureLocate VPN Probability Result Codes ......................................................................................... 141
BlueAssure Platform Integration Documentation | Overview 7
Overview
Introduction
The BlueAssure Platform integration API is an XML and JSON web service over HTTPS. All requests and
responses are encrypted using 256 bit TLS 1.2. BlueAssure supports any platform capable of sending
and receiving XML or JSON.
Endpoints
Each product within the BlueAssure platform has a separate URL endpoint. All requests are formatted in
XML or JSON and must use the POST method for the request to be accepted.
For auditing and troubleshooting purposes, please include a unique customer reference number for
each transaction that relates to an account, identity, or transaction within your own system.
Request
Headers
Only three headers are required: Host, Content-Length, and Content-Type. The Host header value
should be “blueassure.evssolutions.com:443”, the Content-Length header value should be calculated
when the request is sent, and the Content-Type header value should be either “application/json” or
“text/xml”, depending on the format of your request body.
Authentication
BlueAssure uses a username/password credential set included within the request body for
authentication, as well as request IP whitelisting. To set up web service credentials to make API calls go
to the account security page on the platform site and then click the Add button under the Integration
Credentials section. The username and password is automatically generated. Enter a description, copy
the password to a secure storage solution (such as a password manager or secrets vault), and click save.
Don't forget to copy the password before clicking save because it will not be available again after saving.
If you do lose the password you can click the edit button in the list of integration credentials to have the
option to regenerate a new password. Please note that the old password will no longer work.
IP Restrictions
All users of the BlueAssure Management Platform are restricted by IP Address for security purposes. A
user with an invalid IP range can still login but are restricted in what they can both see and do. EVS will
add any initial IP ranges so that you can fully manage your account including adding any additional IP
ranges yourself. To add additional IP ranges go to the account security page on the platform site and
then click on the Edit button under the IP Restrictions section.
Customer Reference Field
The CustomerReference property is a field that will accept any text data including letters, numbers, and
special characters. This data will be stored with the transaction being processed and can be used to
associate a transaction in BlueAssure with a record or identity in your system. This field can also be used
to find the transaction at a later date using the BlueAssure Management Platform.
BlueAssure Platform Integration Documentation | Overview 8
Response
There are three possible top-level objects in the BlueAssure platform JSON response body. The “meta”
object is always present and contains metadata regarding the transaction itself. The “errors” array is
only present when unrecoverable errors have occurred and is an array of objects each containing a code
and error message (see below). The “data” object contains all fields pertaining to the individual product
response, i.e., AssureID. The “errors” array and “data” object are mutually exclusive.
Meta
This object contains the following fields:
Field Name Description
TransactionID A unique ID generated for this transaction.
TransactionDate Timestamp of the transaction
ProductName Name of the BlueAssure product used, i.e., “AssureID”
ProductVersion Web service version used, i.e., “3.0.0”
CustomerReference The value of the CustomerReference field provided in the request
Data Provider Duration Time in seconds waiting for responses from BlueAssure’s data providers
Total Duration Total time in seconds processing the transaction
Warnings Array of strings describing recoverable issues with the request (see below)
Web Service Warnings
When submitting requests to the web service the BlueAssure platform will attempt to clean input data
that fails validation. For instance, with the consumer product the SSN field can have no digits, four
digits, or nine digits. If the request includes an SSN that includes hyphens (123-456-789) then it is
technically invalid for the field since only numbers are allowed. However, we remove non-numeric
characters for that field which then leaves a valid nine-digit SSN. We continue the transaction with the
cleaned SSN field and return a warning in the Warnings string array in the JSON response. This process
occurs for all fields we are able to clean including zip codes, phone numbers, addresses, etc.
Errors
The top-level array of Error objects is similar to the Warnings array, except that errors are problems we
were unable to recover from. For instance, the first name field is required for the consumer product. If
a first name is not provided we cannot continue with the transactions. In this case we return an error
message with the reason the transaction was stopped. Whereas the Warnings section deals primarily
with input validation, the Errors section is used for unrecoverable input validation, an invalid JSON
request, an account or using being locked or disabled, invalid credentials, etc. Below is a list of errors
and their codes.
BlueAssure Platform Integration Documentation | Response 9
Error Code Error Message
1000 An unknown internal error occurred
1001 Creation of transaction failed
1002 Data provider returned an error
1003 Request parse error
2000 Account is locked
2001 Account is disabled
2002 Account not found
2003 User is locked
2004 User is disabled
2005 User not found
2006 Not enough permissions to perform the action
2007 Account does not have access to the product being requested
2008 User is not allowed to run web service requests
2009 Account has reached its transaction limit
2010 IP address is not in acceptable range
3000 An input field failed validation
4000 An active FinCEN list could not be found
Solution Decision Workflow
BlueAssure Management Platform allows you to define a custom decision workflow that is used each
time a request is made to determine if the identity passes or fails based on your needs and business
rules. If a workflow match cannot be made that either passes or fails a transaction it will be marked with
an outcome of needing further review. The web service returns a WorkflowOutcome result code
containing one of the outcomes listed in the table below.
Workflow Code Workflow Message
P Pass
F Fail
R Needs Further Review
Test Data
Since EVS has no data in-house, we cannot offer any real test data; however, for each of our products,
we offer canned responses that can be used for testing purposes. To use this dummy data, turn on test
transactions for your account on the Account Options page on the BlueAssure Platform Management
site, click Edit at the bottom of the page, turn on test transaction under the Product Options header, and
click Save. Then, in your request, use the special request data values for the product you’re using
(detailed below in each product’s section). There are no charges for using dummy data.
BlueAssure Platform Integration Documentation | Solution Decision Workflow 10
Example .NET Code
using System.IO;
using System.Net;
using System.Text.Json;
var request = new
{
meta = new
{
{
credentials = new
username = "Your Username",
password = "Your Password"
customerReference = "123456789ABC"
},
},
data = new
{
firstName = "John",
lastName = "Test",
ssn = "222222222",
street = "123 Main St",
city = "Louisville",
state = "KY",
zipCode = "40223",
dateOfBirth = "1950-01-31"
}
};
string url = "https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureId";
byte[] postData = Encoding.UTF8.GetBytes(JsonSerializer.Serialize(request));
HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);
webRequest.ProtocolVersion = HttpVersion.Version11;
webRequest.Method = "POST";
webRequest.ContentType = "application/json";
webRequest.ContentLength = postData.Length;
Stream requestStream = webRequest.GetRequestStream();
requestStream.Write(postData, 0, postData.Length);
requestStream.Close();
HttpWebResponse webResponse = (HttpWebResponse)webRequest.GetResponse();
StreamReader reader = new StreamReader(webResponse.GetResponseStream());
BlueAssure Platform Integration Documentation | Example .NET Code 11
Example PHP Code
// URL of the AssureID Product Service
$serviceUrl =
'https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureID';
// Username generated from platform site for use only with the web service
$username =
'';
// Password generated from platform site for use only with the web service
$password =
'';
// Identity information to search for
$identity = array(
'FirstName' => 'John',
'LastName' => 'Test'
,
'Street' => '123 Main St',
'City' => 'Louisville',
'State' => 'KY',
'ZipCode' => '40223',
'DateOfBirth' => '1950-01-31'
);
// Build the JSON Request Object
$requestJson = array(
'meta' => array(
'credentials' => array(
'username' => $username,
'password' => $password
),
'customerReference' => '123456789ABC'
)
‘data’ => $identity
);
// Make the request
$ch = curl_init($serviceUrl);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json));
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($requestJson, JSON_FORCE_OBJECT));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$response = curl_exec($ch);
curl_close($ch);
// Debug output of the response
header("Content-Type:application/json");
echo $response;
BlueAssure Platform Integration Documentation | Example PHP Code 12
BlueAssure Products
AssureKYC
The AssureKYC product is used to authenticate a consumer based on whole or partial social security
number, name, address, phone number, and date of birth in the United States.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureKyc
Input Fields
Field Required Notes
FirstName Yes
MiddleName No
LastName Yes
Generation No
Ssn No 4 or 9-digit social security number
Street Yes
City No
State No 2 letter state abbreviation
ZipCode Yes 5 or 9-digit zip code
DateOfBirth No Format: yyyy-MM-dd
PhoneNumber No 10-digit phone number
SimilarityThreshold No AssureWatch Option Only. See
AssureWatch for more details.
LookbackDate No AssureAMS Option Only. See AssureAMS
for more details.
Test Data
Use any name and address of your choosing in conjunction with any of the below SSNs to receive the
canned/dummy response. If Solution Engine Workflow has been enabled of your account, the dummy
response will also include a workflow outcome. There are no transaction charges associated with using
the below test data. Note: test transactions must be enabled for your account for this feature to work.
SSN Workflow Code Workflow Message
222222222 P Pass
333333333 F Fail
444444444 R Needs Further Review
AssureKYC Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
BlueAssure Platform Integration Documentation | BlueAssure Products 13
},
"customerReference": "123456789ABC"
},
"data": {
"ssn": "222222222",
"firstName": "John",
"middleName": null,
"lastName": "Test",
"generation": null,
"street": "123 Main St",
"city": "Louisville",
"state": "KY",
"zipCode": "40223",
"dateOfBirth": "1950-01-31",
"phoneNumber": "5554443333",
"similarityThreshold": null
}
}
AssureKYC Response JSON Example
{
"meta": {
"transactionId": 134888,
"transactionDate": "2023-12-05T22:48:13.6",
"productName": "AssureKYC",
"productVersion": "3.0.0",
"customerReference": "123456789ABC",
"dataProviderDuration": "1.425",
"totalDuration": "2.623599"
},
"data": {
"workflowOutcome": {
"code": "P",
"description": "Pass"
},
"assureKyc": {
"primaryResult": {
"code": "00"
},
"addressVerificationResult": {
"code": "Y",
"description": "Supplied full name matches supplied address. Address confirmed residenti
al."
},
"addressTypeResult": {
"code": "S",
"description": "Submitted address is residential address."
},
"addressHighRiskResult": {
"code": "N",
"description": "No address high risk information found for submitted address."
},
"phoneVerificationResult": {
"code": "M",
"description": "Phone number was not entered on search request."
},
"phoneHighRiskResult": {
"code": "N",
"description": "No phone high risk information found."
},
"changeOfAddressResult": {
"code": "N",
"description": "No change of address information was found."
},
"socialSecurityNumberResult": {
"code": "YA",
"description": "Match to full name and address using Social Security Number."
},
BlueAssure Platform Integration Documentation | BlueAssure Products 14
"dateOfBirthResult": {
"code": "6",
"description": "DOB not on input."
},
"minorResult": {
"code": "N",
"description": "The matched consumer is an adult."
},
"reportedFraudResult": {
"code": "N",
"description": "No fraud has been reported for the matched consumer"
},
"standardizedAddress": {
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
"consumerIdDetail": {
"areaCode": ""
,
"phone": ""
,
"reportedDate": {
"year": "2012",
"month": "11",
"day": "16"
},
"lastTouchedDate": {
"year": "2015",
"month": "09",
"day": "01"
},
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
"residentialAddressDetails": [
{
"residenceLength": "0047",
"aliasName": ""
,
"areaCode": "502",
"phone": "0000000",
"lastTouchedDate": {
"year": "2015",
"month": "11",
"day": "02"
},
"firstName": "JOHN",
"middleInitial": "R",
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
{
"residenceLength": ""
,
BlueAssure Platform Integration Documentation | BlueAssure Products 15
es."
e."
}
}
}
"aliasName": ""
,
"areaCode": ""
,
"phone": ""
,
"lastTouchedDate": {
"year": "2015",
"month": "09",
"day": "01"
},
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "SMITH",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
}
],
"ssnValidation": {
"deceasedResult": {
"code": "N",
"description": "Not deceased - no matching files found on the death master list."
},
"formatResult": {
"code": "V",
"description": "Social Security Number is valid per Social Security Administration fil
},
"issueResult": {
"code": "I",
"description": "Social Security Number has been issued with a beginning and ending dat
},
"stateIssued": "KY",
"issueStartRange": "1966",
"issueEndRange": "1968"
}
BlueAssure Platform Integration Documentation | BlueAssure Products 16
AssureID
The AssureID product is used to authenticate a consumer based on whole or partial social security
number, name, address, phone number, driver’s license, and date of birth in the United States. Fraud
shield codes and additional addresses are also returned.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureId
Input Fields
Field Required Notes
FirstName Yes
MiddleName No
LastName Yes
Generation No
Ssn No 4 or 9-digit social security number
Street Yes
City No
State No 2 letter state abbreviation
ZipCode Yes 5 or 9-digit zip code
DateOfBirth No Format: yyyy-MM-dd
DriverLicenseNumber No, except when
DriverLicenseState is present.
DriverLicenseState No, except when
DriverLicenseNumber is present. 2 letter state abbreviation
PhoneNumber No 10-digit phone number
SendPhoneVerification No
AssurePhone Option Only. Send a value
of True to have a verification code sent as a
text message / voice call to the phone
number provided in the PhoneNumber field.
ForceVerificationByCall No
AssurePhone Option Only. Send a value
of True to force Phone Verification to be sent
by voice call, even if the provided phone
number is found to be a mobile phone.
EmailAddress No
IpAddress No IPv4 address. Format:
###.###.###.###
SimilarityThreshold No AssureWatch Option Only. See
AssureWatch for more details.
LookbackDate No AssureAMS Option Only. See AssureAMS
for more details.
BlueAssure Platform Integration Documentation | BlueAssure Products 17
Test Data
Use any name and address of your choosing in conjunction with any of the below SSNs to receive the
canned/dummy response. If Solution Engine Workflow has been enabled of your account, the dummy
response will also include a workflow outcome. There are no transaction charges associated with using
the below test data. Note: test transactions must be enabled for your account for this feature to work.
SSN Workflow Code Workflow Message
222222222 P Pass
333333333 F Fail
444444444 R Needs Further Review
AssureID Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"ssn": "222222222",
"firstName": "John",
"middleName": null,
"lastName": "Test",
"generation": null,
"street": "123 Main St",
"city": "Louisville",
"state": "KY",
"zipCode": "40223",
"dateOfBirth": "1950-01-31",
"phoneNumber": "5554443333",
"ipAddress": "127.0.0.1"
,
"emailAddress": "johntest@example.com"
,
"similarityThreshold": null
}
}
AssureID Response JSON Example
{
"meta": {
"transactionId": 134890,
"transactionDate": "2023-12-05T22:53:17.823",
"productName": "AssureID",
"productVersion": "3.0.0",
"customerReference": "123456789ABC",
"dataProviderDuration": "0.093",
"totalDuration": "0.2491494"
},
"data": {
"workflowOutcome": {
"code": "P",
"description": "Pass"
},
"assureId": {
"primaryResult": {
"code": "00"
},
"addressVerificationResult": {
"code": "Y",
BlueAssure Platform Integration Documentation | BlueAssure Products 18
"description": "Supplied full name matches supplied address. Address confirmed residenti
al."
},
"addressTypeResult": {
"code": "S",
"description": "Submitted address is residential address."
},
"addressHighRiskResult": {
"code": "N",
"description": "No address high risk information found for submitted address."
},
"phoneVerificationResult": {
"code": "M",
"description": "Phone number was not entered on search request."
},
"phoneHighRiskResult": {
"code": "N",
"description": "No phone high risk information found."
},
"changeOfAddressResult": {
"code": "N",
"description": "No change of address information was found."
},
"driverLicenseResult": {
"code": "M",
"description": "DL number not submitted."
},
"socialSecurityNumberResult": {
"code": "YA",
"description": "Match to full name and address using Social Security Number."
},
"dateOfBirthResult": {
"code": "6",
"description": "DOB not on input."
},
"emailVerificationResult": {
"code": "T1",
"description": "Match to Name associated with Email in repository"
},
"emailValidationResult": {
"code": "V",
"description": "Possible valid email address"
},
"emailReasonResult": {
"code": "N",
"description": "No Failure Identified – the email had proper syntax and domain"
},
"emailRepositoryResult": {
"code": "Y",
"description": "Email address found in repository"
},
"minorResult": {
"code": "N",
"description": "The matched consumer is an adult."
},
"reportedFraudResult": {
"code": "N",
"description": "No fraud has been reported for the matched consumer"
},
"standardizedAddress": {
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
BlueAssure Platform Integration Documentation | BlueAssure Products 19
},
"consumerIdDetail": {
"areaCode": ""
,
"phone": ""
,
"reportedDate": {
"year": "2012",
"month": "11",
"day": "16"
},
"lastTouchedDate": {
"year": "2015",
"month": "09",
"day": "01"
},
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
"residentialAddressDetails": [
{
"spouseName": ""
,
"houseMembers": [],
"residenceLength": "0047",
"aliasName": ""
,
"areaCode": "502",
"phone": "0000000",
"lastTouchedDate": {
"year": "2015",
"month": "11",
"day": "02"
},
"firstName": "JOHN",
"middleInitial": "R",
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
{
"spouseName": ""
,
"houseMembers": [],
"residenceLength": ""
,
"aliasName": ""
,
"areaCode": ""
,
"phone": ""
,
"lastTouchedDate": {
"year": "2015",
"month": "09",
"day": "01"
},
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "SMITH",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
}
BlueAssure Platform Integration Documentation | BlueAssure Products 20
es."
e."
],
"ssnValidation": {
"deceasedResult": {
"code": "N",
"description": "Not deceased - no matching files found on the death master list."
},
"formatResult": {
"code": "V",
"description": "Social Security Number is valid per Social Security Administration fil
},
"issueResult": {
"code": "I",
"description": "Social Security Number has been issued with a beginning and ending dat
},
"stateIssued": "KY",
"issueStartRange": "1966",
"issueEndRange": "1968"
},
"additionalAddresses": [
{
"reportDate": {
"year": "2013",
"month": "12",
"day": "10"
},
"updateDate": {
"year": "2014",
"month": "06",
"day": "02"
},
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4333",
"county": "Jefferson"
},
{
"reportDate": {
"year": "2002",
"month": "05",
"day": "11"
},
"updateDate": {
"year": "2011",
"month": "11",
"day": "06"
},
"street": "456 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4333",
"county": "Jefferson"
},
{
"reportDate": {
"year": "1994",
"month": "09",
"day": "14"
},
"updateDate": {
"year": "2004",
"month": "04",
"day": "13"
},
"street": "1111 BROADWAY AVE",
BlueAssure Platform Integration Documentation | BlueAssure Products 21
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40202",
"zipPlusFour": "1111",
"county": "Jefferson"
},
{
"reportDate": {
"year": "1994",
"month": "09",
"day": "14"
},
"updateDate": {
"year": "2004",
"month": "04",
"day": "13"
},
"street": "2222 WEST ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40202",
"zipPlusFour": "1111",
"county": "Jefferson"
}
],
"fraudShieldResults": {
"fraudShield01": {
"code": "N"
},
"fraudShield02": {
"code": "N"
},
"fraudShield03": {
"code": "N"
},
"fraudShield04": {
"code": "N"
},
"fraudShield05": {
"code": "N"
},
"fraudShield06": {
"code": "N"
},
"fraudShield10": {
"code": "N"
},
"fraudShield11": {
"code": "N"
},
"fraudShield13": {
"code": "N"
},
"fraudShield14": {
"code": "N"
},
"fraudShield15": {
"code": "N"
},
"fraudShield16": {
"code": "N"
},
"fraudShield17": {
"code": "N"
},
"fraudShield18": {
"code": "N"
},
"fraudShield21": {
BlueAssure Platform Integration Documentation | BlueAssure Products 22
"code": "N"
},
"fraudShield25": {
"code": "N"
},
"fraudShield26": {
"code": "N"
}
},
"sharedApplicationResults": {},
"ipAddressDetail": {
"country": "USA",
"msa": "529",
"latitude": "38.17728",
"longitude": "
-85.69685",
"cityResult": {
"code": "1",
"description": "Match to input"
},
"stateResult": {
"code": "1",
"description": "Match to input"
},
"zipCodeResult": {
"code": "1",
"description": "Match to input"
},
"countryResult": {
"code": "1",
"description": "Match US"
},
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"county": "Jefferson"
}
},
"kbaQuestions": {
"questions": [
{
"text": "Which one of the following area codes is associated with you?",
"questionType": 2,
"answers": [
{
"text": "313/734",
"isCorrect": false
},
{
"text": "517",
"isCorrect": false
},
{
"text": "269",
"isCorrect": false
},
{
"text": "219",
"isCorrect": false
},
{
"text": "283/513",
"isCorrect": false
},
{
"text": "740/220",
"isCorrect": false
},
{
"text": "502",
BlueAssure Platform Integration Documentation | BlueAssure Products 23
},
{
},
{
"isCorrect": true
},
{
"text": "937/326",
"isCorrect": false
},
{
"text": "220/740",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
"text": "Which one of the following counties is associated with you?",
"questionType": 3,
"answers": [
{
"text": "Leelanau",
"isCorrect": false
},
{
"text": "Marquette",
"isCorrect": false
},
{
"text": "Jefferson",
"isCorrect": true
},
{
"text": "Webster",
"isCorrect": false
},
{
"text": "Saint Joseph",
"isCorrect": false
},
{
"text": "Columbiana",
"isCorrect": false
},
{
"text": "Boyle",
"isCorrect": false
},
{
"text": "Trumbull",
"isCorrect": false
},
{
"text": "LaGrange",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
"text": "Which one of the following zip codes is associated with you?",
"questionType": 4,
"answers": [
{
"text": "40743",
"isCorrect": false
BlueAssure Platform Integration Documentation | BlueAssure Products 24
},
{
"text": "40389",
"isCorrect": false
},
{
"text": "40747",
"isCorrect": false
},
{
"text": "40594",
"isCorrect": false
},
{
"text": "40202",
"isCorrect": true
},
{
"text": "40226",
"isCorrect": false
},
{
"text": "40879",
"isCorrect": false
},
{
"text": "40679",
"isCorrect": false
},
{
"text": "40629",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
},
{
"text": "What state was your SSN issued in?",
"questionType": 5,
"answers": [
{
"text": "Massachusetts",
"isCorrect": false
},
{
"text": "Kentucky",
"isCorrect": true
},
{
"text": "Puerto Rico",
"isCorrect": false
},
{
"text": "Idaho",
"isCorrect": false
},
{
"text": "Wisconsin",
"isCorrect": false
},
{
"text": "Ohio",
"isCorrect": false
},
{
"text": "South Dakota",
BlueAssure Platform Integration Documentation | BlueAssure Products 25
you?",
},
{
},
{
"isCorrect": false
},
{
"text": "Pennsylvania",
"isCorrect": false
},
{
"text": "North Carolina",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
"text": "Which one of the following adult individuals is most closely associated with
"questionType": 6,
"answers": [
{
"text": "Alexa",
"isCorrect": false
},
{
"text": "Carlos",
"isCorrect": false
},
{
"text": "Rachel",
"isCorrect": false
},
{
"text": "Ryan",
"isCorrect": false
},
{
"text": "Kaitlyn",
"isCorrect": false
},
{
"text": "Savannah",
"isCorrect": false
},
{
"text": "Anna",
"isCorrect": false
},
{
"text": "Michael",
"isCorrect": false
},
{
"text": "Sydney",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": true
}
]
"text": "What was the zip code for the address on MAIN ST?",
"questionType": 9,
"answers": [
{
"text": "40879",
BlueAssure Platform Integration Documentation | BlueAssure Products 26
"isCorrect": false
},
{
"text": "40299",
"isCorrect": true
},
{
"text": "40973",
"isCorrect": false
},
{
"text": "40629",
"isCorrect": false
},
{
"text": "40743",
"isCorrect": false
},
{
"text": "40747",
"isCorrect": false
},
{
"text": "40594",
"isCorrect": false
},
{
"text": "40389",
"isCorrect": false
},
{
"text": "40226",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
},
{
"text": "What was the house number for the address on MAIN ST?",
"questionType": 10,
"answers": [
{
"text": "880",
"isCorrect": false
},
{
"text": "456",
"isCorrect": true
},
{
"text": "974",
"isCorrect": false
},
{
"text": "632",
"isCorrect": false
},
{
"text": "745",
"isCorrect": false
},
{
"text": "749",
"isCorrect": false
},
{
BlueAssure Platform Integration Documentation | BlueAssure Products 27
"text": "598",
"isCorrect": false
},
{
"text": "395",
"isCorrect": false
},
{
"text": "234",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
}
}
}
}
]
BlueAssure Platform Integration Documentation | BlueAssure Products 28
AssureCorp
The AssureCorp product is used to authenticate a business using the business name, address, and phone
number in the United States.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureCorp
Input Fields
Field Required Notes
BusinessName Yes
Street Yes
City No
State No 2 letter state abbreviation
ZipCode Yes 5 or 9-digit zip code
PhoneNumber No 10-digit phone number
SimilarityThreshold No AssureWatch Option Only. See AssureWatch for
more details.
LookbackDate No AssureAMS Option Only. See AssureAMS for more
details.
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type BusinessName Street
Match Widget Company 123 Main St STE 200
AssureCorp Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"businessName": "Widget Company"
,
"street": "123 Main St STE 200"
,
"city": "Louisville"
,
"state": "KY"
,
"zipcode": "40223"
,
"phoneNumber": null,
"similarityThreshold": 75
}
}
AssureCorp Response JSON Example
{
BlueAssure Platform Integration Documentation | BlueAssure Products 29
"meta": {
"transactionId": 134891,
"transactionDate": "2023-12-06T05:08:24.76",
"productName": "AssureCorp",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "5.797",
"totalDuration": "6.0168661"
},
"data": {
"workflowOutcome": {
"code": "R",
"description": "Needs Further Review"
},
"assureCorp": {
"primaryResult": {
"code": "00"
},
"addressVerificationResult": {
"code": "A",
"description": "Necessary elements missing from address. Multiple address matches found bu
t input address is not specific enough to obtain single match."
},
"addressTypeResult": {
"code": "N",
"description": "No information available for address type for submitted address."
},
"addressHighRiskResult": {
"code": "N",
"description": "No address high risk information found for submitted address."
},
"phoneVerificationResult": {
"code": "M",
"description": "Phone number was not entered on search request."
},
"phoneHighRiskResult": {
"code": "N",
"description": "No phone high risk information found."
},
"changeOfAddressResult": {
"code": "NA"
},
"residentialPhoneDetails": [],
"residentialAddressDetails": []
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 30
AssureSSN
The AssureSSN product is used to authenticate a consumer based solely on a 9-digit social security
number in the United States.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureSsn
Input Fields
Field Required Notes
SSN Yes 9-digit social security number
SimilarityThreshold No AssureWatch Option Only. See AssureWatch for more details.
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type SSN
Match to “John Test” 111111111
Match to “Jane Test” 555555555
Match to “Jim Test” 666666666
AssureSSN Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"ssn": "111111111"
}
}
AssureSSN Response JSON Example
{
"meta": {
"transactionId": 134893,
"transactionDate": "2023-12-06T05:24:53.997",
"productName": "AssureSSN",
"productVersion": "3.0.0",
"customerReference": "123456789ABC",
"dataProviderDuration": "0.1",
"totalDuration": "0.2910032"
},
"data": {
"assureSsn": {
"standardizedAddress": {
"firstName": "JOHN",
"middleInitial": "R",
"lastName": "TEST",
"street": "123 N MAIN ST "
,
"city": "LOUISVILLE",
BlueAssure Platform Integration Documentation | BlueAssure Products 31
"state": "KY",
"zipCode": "40216",
"zipPlusFour": "2906"
},
"ssnFinderDetails": [
{
"areaCode": "502",
"phone": "5551111",
"dateOfBirth": {
"year": "1987",
"month": "11",
"day": "10"
},
"reportedDate": {
"year": "2006",
"month": "09"
},
"lastTouchedDate": {
"year": "2011",
"month": "01"
},
"firstName": "JOHN",
"middleInitial": "R",
"lastName": "TEST",
"street": "123 N MAIN ST "
,
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40216",
"zipPlusFour": "2906"
}
],
"ssnValidation": {
"deceasedResult": {
"code": "N",
"description": "Not deceased - no matching files found on the death master list."
},
"stateIssued": "KY",
"issueStartRange": "1987",
"issueEndRange": "1989"
},
"additionalAddresses": [
{
"reportDate": {
"year": "2008",
"month": "10"
},
"updateDate": {
"year": "2011",
"month": "01"
},
"street": "123 EAST THIRD ST "
,
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40216",
"zipPlusFour": "2906"
},
{
"reportDate": {
"year": "2007",
"month": "09"
},
"updateDate": {
"year": "2008",
"month": "03"
},
"street": "123 WEST FIFTH ST APT 18",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40223",
BlueAssure Platform Integration Documentation | BlueAssure Products 32
"zipPlusFour": "5856"
}
]
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 33
AssureCanada
The AssureCanada product is used to authenticate a consumer based on name, address, date of birth,
and optionally social insurance number, phone number, and email address in Canada.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureCanada
Input Fields
Field Required Notes
FirstName Yes Letters, hyphens, spaces, periods, and
apostrophes
MiddleName No
LastName Yes Letters, hyphens, slashes, spaces, and
apostrophes
Generation No SR, JR, I, II, III, IV, V, VI, VII, VIII, or IX
Sin No 9-digit social insurance number
Street Yes Letters, numbers, periods, commas, number
sign (#), hyphens, slashes, and spaces
City Yes
Province Yes 2-letter province abbreviation
PostalCode Yes 6-character postal code
DateOfBirth Yes Format: yyyy-MM-dd
PhoneNumber No 10-digit phone number
EmailAddress No
SimilarityThreshold No AssureWatch Option Only. See
AssureWatch for more details.
AssureCanada Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"sin": "222222222",
"firstName": "John",
"middleName": null,
"lastName": "Test",
"generation": null,
"street": "123 Main St",
"city": "Toronto"
,
"province": "ON"
,
"postalCode": "A1B2C3"
,
"dateOfBirth": "1950-01-31",
"phoneNumber": "5554443333",
"emailAddress": "johntest@example.com"
,
"similarityThreshold": null
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 34
AssureCanada Response JSON Example
{
"meta": {
"transactionId": 134990,
"transactionDate": "2024-03-28T14:15:02.51",
"productName": "AssureCanada",
"productVersion": "3.0.0",
"customerReference": "123456789ABC "
,
"dataProviderDuration": "1.068",
"totalDuration": "2.2645189"
},
"data": {
"workflowOutcome": {
"code": "R",
"description": "Needs Further Review"
},
"assureCanada": {
"creditFileResults": [
{
"code": "CFI_CFA_04",
"value": "Y",
"description": "Age of credit file is three years or greater"
},
{
"code": "CFI_SIN_MM",
"value": "Y",
"description": "Social Insurance Number mismatch"
},
{
"code": "CFI_CFL_02",
"value": "Y",
"description": "Credit file located - Adequate match"
},
{
"code": "CFI_NPR_00",
"value": "Y",
"description": "No phone record located or poor match score"
},
{
"code": "CFI_DOB_21",
"value": "Y",
"description": "Calculated age on the credit file is 21 or greater"
},
{
"code": "CFI_DOB_18",
"value": "Y",
"description": "Calculated age on the credit file is 18 or greater"
},
{
"code": "CFI_DOB_19",
"value": "Y",
"description": "Calculated age on the credit file is 19 or greater"
},
{
"code": "CFI_CFH_02",
"value": "Y",
"description": "Credit file history is equal to or greater than six months"
},
{
"code": "CFI_SIN_NV",
"value": "Y",
"description": "Social Insurance Number is not valid"
},
{
"code": "CFI_CFA_02",
"value": "Y",
"description": "Age of credit file is six months or greater"
},
BlueAssure Platform Integration Documentation | BlueAssure Products 35
{
"code": "CFI_NCA_30",
"value": "Y",
"description": "Current address is new within 30 days on the credit file"
},
{
"code": "CFI_DOB_01",
"value": "Y",
"description": "Request age matches the calculated age on the credit file"
}
],
"nameResults": [
{
"code": "NA_OV999",
"value": "1",
"description": "Is full name affilated with any other PII element?"
},
{
"code": "NA_FN999",
"value": "1",
"description": "Is full name affiliated with date of birth?"
},
{
"code": "NA_GV999",
"value": "0",
"description": "Is full name affiliated with government ID?"
},
{
"code": "NA_AF999",
"value": "1",
"description": "Is full name affiliated with address?"
},
{
"code": "NA_LN999",
"value": "1",
"description": "Is family name affiliated with date of birth?"
}
],
"fraudInsights": [
{
"code": "FVI_OV_S001",
"value": "L",
"description": "Fraud risk level"
},
{
"code": "FVI_FV_S001",
"value": "N",
"description": "Is fraud victim warning present and information blocked due to
identity theft?"
},
{
"code": "FVI_FV_S005",
"value": "N",
"description": "Is fraud victim alert present?"
}
],
"dobResults": [
{
"code": "DOBA_OV999",
"value": "1",
"description": "Is date of birth affiliated with any other PII element?"
},
{
"code": "DOBA_AA999",
"value": "1",
"description": "Is date of birth affiliated with address?"
},
{
"code": "DOBA_FN999",
BlueAssure Platform Integration Documentation | BlueAssure Products 36
"value": "1",
"description": "Is date of birth affiliated with full name?"
},
{
"code": "DOBA_GI999",
"value": "0",
"description": "Is date of birth affiliated with government ID?"
}
],
"deceasedResults": [
{
"code": "DE_IM_S001",
"value": "N",
"description": "Is the individual deceased?"
}
]
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 37
AssurePhone
The AssurePhone product returns carrier and phone type information about a provided US phone
number. This product will also generate and send a verification code to the provided phone number via
text message for mobile numbers and via text-to-speech for landline or VOIP numbers. This product can
also be added as an option to the AssureID product.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssurePhone
Input Fields
Field Required Notes
Phone Yes 10-digit US phone number
SendPhoneVerification No Send a value of True to have a verification code sent
as a text message / voice call to the phone number.
ForceVerificationByCall No
Send a value of True to force Phone Verification to
be sent by voice call, even if the provided phone
number is found to be a mobile phone.
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type Phone
Match to Landline 5552222222
Match to Mobile 5551111111
AssurePhone Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"phone": "5551111111"
}
}
AssurePhone Response JSON Example
{
"meta": {
"transactionId": 78623882,
"transactionDate": "2023-12-06T05:42:29.42",
"productName": "AssurePhone",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.2088542"
},
"data": {
BlueAssure Platform Integration Documentation | BlueAssure Products 38
"assurePhone": {
"phoneType": {
"code": "M",
"description": "Match to a mobile phone number."
},
"callerType": {
"code": "C",
"description": "Match to a consumer phone number."
},
"deliveryType": {
"code": "N",
"description": "Verification code not sent"
},
"phoneNumber": "+15551111111",
"callerName": "JOHN TEST",
"carrierName": "Fake Mobile Carrier"
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 39
AssureWatch
The AssureWatch product returns identities located on government watchlists using as little information
as the name of a person or entity. This product can be added as an option to other products offered by
EVS.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureWatch
Input Fields
Field Individual Required Entity Required Notes
EntityName N/A Yes Only used when submitting an entity
FirstName Yes N/A Only used when submitting an
individual
MiddleName No N/A Only used when submitting an
individual
LastName Yes N/A Only used when submitting an
individual
Street No No
City No No
State No No 2 character state code
Province No No 2 character province code
ZipCode No No
CountryCode No No 2 character country code
DateOfBirth No No Only used when submitting an
individual. Format: yyyy-MM-dd
IdNumber No No Identification such as SSN or EIN
SimilarityThreshold No No
Value between 50 - 100 representing
how close name must match for a
similarly search. Defaults to 75 when
not sent.
LookbackDate No No AssureAMS Option Only. See
AssureAMS for more details.
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type FirstName LastName EntityName
Exact Match John Test
Similar Match Janet Test
Exact Match Jim Test
Exact Match Widget Company
BlueAssure Platform Integration Documentation | BlueAssure Products 40
AssureWatch Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"idNumber": "222222222",
"firstName": "John",
"middleName": null,
"lastName": "Test",
"street": "123 Main St",
"city": "Louisville",
"state": "KY",
"zipCode": "40223",
"countryCode": "US"
,
"dateOfBirth": "1950-01-31",
"phoneNumber": "5554443333",
"similarityThreshold": 75
}
}
AssureWatch Response JSON Example
{
"meta": {
"transactionId": 134896,
"transactionDate": "2023-12-06T05:56:51.957",
"productName": "AssureWatch",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.1139861"
},
"data": {
"workflowOutcome": {
"code": ""
,
"description": "Workflow Disabled"
},
"assureWatch": {
"ofacWatchlist": {
"ofacRecords": [
{
"ofacFieldMatchResults": {
"nameMatchResult": {
"code": "E",
"description": "Exact match"
},
"addressMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"idMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"dobMatchResult": {
"code": "NS",
"description": "Not submitted"
}
},
"ofacAddresses": [
{
BlueAssure Platform Integration Documentation | BlueAssure Products 41
"street": "4321 Straight St.",
"city": "Denver",
"stateOrProvince": ""
,
"zipCode": "87654",
"country": ""
}
],
"ofacAliases": [
{
"firstName": "Johnny",
"lastName": "Test",
"category": "weak",
"type": "a.k.a"
}
],
"ofacCitizenships": [
{
"country": "United States",
"mainEntry": true
}
],
"ofacDateOfBirths": [
{
"dateOfBirth": "01 Jan 1975",
"mainEntry": true
}
],
"name": ""
,
"title": ""
,
"firstName": "John",
"lastName": "Test",
"classification": "Individual",
"remarks": ""
},
{
"ofacFieldMatchResults": {
"nameMatchResult": {
"code": "E",
"description": "Exact match"
},
"addressMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"idMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"dobMatchResult": {
"code": "NS",
"description": "Not submitted"
}
},
"ofacAddresses": [
{
"street": "101 Rodeo Rd.",
"city": "San Diego",
"stateOrProvince": ""
,
"zipCode": "98765",
"country": ""
}
],
"ofacAliases": [
{
"firstName": "John",
"lastName": "Test",
"category": "Strong",
"type": "f.k.a"
}
BlueAssure Platform Integration Documentation | BlueAssure Products 42
],
"ofacCitizenships": [
{
"country": "United States",
"mainEntry": true
}
],
"ofacDateOfBirths": [
{
"dateOfBirth": "12 Mar 1971",
"mainEntry": true
}
],
"name": ""
,
"title": ""
,
"firstName": "John",
"lastName": "Test",
"classification": "Individual",
"remarks": ""
}
]
}
},
"pep": {
"pepMatchResult": {
"code": "M",
"description": "Matching profiles were found for the entered data."
},
"pepProfiles": [
{
"nameMatchResult": {
"code": "E",
"description": "Exact match"
},
"addressMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"dobMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"matchScore": 90,
"profileName": "John Test",
"alertNotesSummary": "Charged with Class A Misdemeanor of Trespass in the Second Degre
e, Class A Misdemeanor of Having a Posesssion Reportedly Belonging To Someone Else, SRPD, DOI: 10-12-
2015.",
"gender": "Male",
"positions": [
{
"name": "Board of Directors",
"from": "2021",
"to": ""
}
],
"pepRisks": [
{
"typeCode": "LEG",
"typeDescription": "Senior legislative branch officials",
"seniorityLevel": 1
}
],
"relationships": [
{
"type": "MAR",
"direction": "WIFE",
"name": "Janet Test"
}
],
BlueAssure Platform Integration Documentation | BlueAssure Products 43
"addresses": [
{
"rawFormat": "123 MAIN ST, Louisville, Kentucky, 40299, USA",
"addressLine1": "123 MAIN ST",
"addressLine2": ""
,
"city": "Louisville",
"state": "Kentucky",
"province": "KY",
"postalCode": "40299",
"country": "USA",
"isoCountry": "USA"
}
],
"aliases": [
{
"name": "Jonny Test",
"type": "FKA"
}
],
"dateOfBirths": [
{
"year": 1972,
"month": 7,
"day": 13,
"approximate": false
}
],
"attributes": [
{
"type": "WGT",
"value": "130 lbs."
},
{
"type": "SEX",
"value": "Male"
}
]
}
}
}
]
}
BlueAssure Platform Integration Documentation | BlueAssure Products 44
AssureFinCEN
The AssureFinCEN product returns identities located on the Financial Crimes Enforcement Network
watchlist uploaded into BlueAssure.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureFincen
Input Fields
Field Individual Required Entity Required Notes
EntityName N/A Yes Only used when submitting an entity
FirstName Yes N/A Only used when submitting an
individual
MiddleName No N/A Only used when submitting an
individual
LastName Yes N/A Only used when submitting an
individual
Generation No N/A SR, JR, I, II, III
Street No No
City No No
State No No 2 character state code
ZipCode No No
CountryCode No No 2 character country code
SimilarityThreshold No No
Value between 50 - 100 representing
how close name must match for a
similarly search. Defaults to 75 when
not sent.
ListId No No
The ID of the uploaded FinCEN list.
This ID can be found by looking under
FinCEN Management in BlueAssure. If
no list ID is provided, the most current
list will be used automatically.
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type FirstName LastName EntityName
Exact Match John Test
Exact Match Janet Test
Exact Match Jim Test
Exact Match Widget Company
BlueAssure Platform Integration Documentation | BlueAssure Products 45
AssureFinCEN Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"listId": 1234,
"firstName": "John",
"middleName": null,
"lastName": "Test",
"generation": null,
"street": "123 Main St",
"city": "Louisville",
"state": "KY",
"zipCode": "40223",
"similarityThreshold": null
}
}
AssureFinCEN Response JSON Example
{
"meta": {
"transactionId": 134899,
"transactionDate": "2023-12-06T06:10:45.68",
"productName": "AssureFinCEN",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.1390023"
},
"data": {
"workflowOutcome": {
"code": "R",
"description": "Needs Further Review"
},
"assureFincen": {
"fincenList": {
"listId": 1,
"listName": "Test List",
"transmissionDate": "2023-05-16",
"expirationDate": "2030-05-30"
},
"fincenRecords": [
{
"fincenMatchResult": {
"code": "F",
"description": "Match to full name"
},
"trackingNumber": "0000000000",
"businessName": ""
,
"doingBusinessAsName": ""
,
"incorporated": ""
,
"firstName": "JOHN",
"middleName": ""
,
"lastName": "TEST",
"suffix": ""
,
"isIndividual": true,
"fincenAddresses": [
{
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"zipCode": "40299",
"country": "USA"
BlueAssure Platform Integration Documentation | BlueAssure Products 46
}
],
"fincenAliases": [
{
"firstName": "JAMES",
"middleName": ""
,
"lastName": "TEST",
"suffix": ""
},
{
"firstName": "JIM",
"middleName": ""
,
"lastName": "TEST",
"suffix": ""
}
],
"fincenDatesOfBirth": [
{
"year": "1958",
"month": "3",
"day": "11"
}
],
"fincenIdentifications": [
{
"identificationNumber": "222222222",
"identificationType": 1
},
{
"identificationNumber": "XX123456789",
"identificationType": 4
}
],
"fincenPhones": [
"5551112222",
"5551113333"
]
}
}
}
]
}
BlueAssure Platform Integration Documentation | BlueAssure Products 47
AssureCard
AssureCard authenticates government issued IDs using images taken of the front and back of the ID. In
addition, Card can compare the facial similarity of the image on the ID to a submitted portrait image. A
transaction can take anywhere from 10 seconds to a minute to complete at which point the information
will be delivered to a callback web hook URL defined by you.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureCard
Input Fields
Required
Field
Direct
Required
Mobile Capture Notes
Upload
ScanMode Yes Yes DirectImageUpload or CaptureViaMobile or
DeferredRequestLink
DocumentType Yes Yes DriversLicense or PassportBook or
PassportCard
FrontImage Yes N/A Base64 encoded image data in JPG or PNG
format
BackImage Yes* N/A Base64 encoded image data in JPG or PNG
format
PortraitImage No N/A Base64 encoded image data in JPG or PNG
format
RequireConsumerPortrait N/A Yes
Mobile Capture Only. Send a value of True to
require the ID holder to send a self-portrait in
addition to the front and back ID images.
Ssn No No AssureID Option Only. 4 or 9-digit social
security number
PhoneNumber No Yes AssureID & AssurePhone Options Only.
10-digit phone number
SendPhoneVerification No No
AssurePhone Option Only. Send a value of
True to have a verification code sent as a text
message / voice call to the phone number
provided in the PhoneNumber field.
ForceVerificationByCall No No
AssurePhone Option Only. Send a value of
True to force Phone Verification to be sent by
voice call, even if the provided phone number is
found to be a mobile phone.
EmailAddress No No AssureID Option Only
IpAddress No No AssureID Option Only. IPv4 address.
Format: ###.###.###.###
SimilarityThreshold No No
AssureWatch Option Only. Value between 50
- 100 representing how close name must match
for a similarly search. Defaults to 75 when not
sent.
LookbackDate No No AssureAMS Option Only. See AssureAMS for
more details.
*Back Image is not required for passport books
BlueAssure Platform Integration Documentation | BlueAssure Products 48
Upload Images Directly
Images can be uploaded directly to BlueAssure when using the ScanMode value DirectImageUpload. In
this case both FrontImage and BackImage are required fields (unless the document type is a
PassportBook) and should include the base 64 encoded data for each image. For more information on
image size and format recommendations see Image Quality & Size Recommendations below.
Capture Images From Mobile Phone
Images can also be uploaded by the ID holder using the ScanMode value CaptureViaMobile. In this case
a mobile phone number of the ID holder must be provided in the PhoneNumber field. A text message
will be sent to the mobile number with a link that will allow the ID holder to take images of the front and
back of the ID using their phone. The link sent in the text message is only valid for one hour.
Capture Images From Web Portal
Clients can request an image upload link that can be embedded in the client's application or website. In
this case, the two requirements are that ScanMode value must be DeferredRequestLink and the
appropriate DocumentType be specified. This will return the image capturing link in the JSON response
rather than sending it to the end consumer via text. This allows you to embed the image capture portal
in your website or application. The link sent in the response is only valid for one hour.
Receiving Submitted Images
If you wish to receive the images submitted using the CaptureViaMobile or DeferredRequestLink
modes, you can enable an account option to do so. Go to My Account → Options, look in the Product
Options section, and the option labeled “Enable delivery of consumer-uploaded images to product
webhook” should be checked. If it is not, have an account admin enable that option for you by clicking
the Edit button at the bottom of the page, selecting that checkbox, and then clicking Save.
With this option enabled, when images are submitted by the end consumer they will be sent to the
webhook you have configured (see below under Asynchronous Request/Response Process) as base 64-
encoded strings in JSON properties (example below).
Image Quality & Size Recommendations
The best way to ensure accurate authentication results is to submit good images that our systems can
successfully process.
The minimum image resolution is 800 x 600px, in JPG or PNG file format, with a compression rate of less
than 15%. We also recommend keeping file size under 4 MB total and no larger than 1500px in either
dimension. Larger files may result in longer processing time or errors.
Asynchronous Request/Response Process
Due to the time it takes to process the images, this product does not return the results to the initial
request made to BlueAssure. Instead, you can define a callback URL (webhook) that BlueAssure will
send the results to once processing has finished.
To setup the callback URL and credentials, go to My Account → Products and click the button labeled
Edit Webhook under the AssureCard product. The URL must use HTTPS with a valid certificate and must
BlueAssure Platform Integration Documentation | BlueAssure Products 49
1. 2. 1. 2. 3. be a URL that BlueAssure can reach over the internet. If a username and password are entered, all
requests to the callback URL will include these credentials via Basic Authentication. It’s recommended
you password protect the callback URL to restrict access.
BlueAssure will send a POST request to the callback URL when the transaction completes. The callback
URL must return a 2XX response code within 5 seconds indicating the transaction response was
successfully received. If something other than a 2XX response is received or if it takes more than 5
seconds for the callback to return, the request will be delayed and then be resent after a short period. If
requests continue to fail, then subsequent attempts will be made further in the future adding more time
between each attempt. If the request could not be completed after 10 attempts, no further attempts
will be made to the callback URL for that transaction. The transaction can still be viewed by logging into
the BlueAssure management platform.
Linking the Initial Request and Final Callback
When ScanMode is set to DirectImageUpload, the same transaction ID will be returned in the initial
request and in the request BlueAssure sends to the callback URL. When ScanMode is set to
CaptureViaMobile, you must submit a unique CustomerReference value of your own in the initial
request. BlueAssure will include your customer reference value submitted in your initial request in the
final callback.
Client BlueAssure
Client makes initial request to BlueAssure web service passing the images and other input fields listed
above.
BlueAssure platform queues the work and returns an initial response indicating the request was
received or an error indicating why the initial request failed.
BlueAssure Client
Callback
BlueAssure finishes processing the images and completes the transaction.
BlueAssure does an HTTP POST to the client’s callback URL sending the results of the transaction.
The client callback URL returns a 200 response code within 5 seconds indicating the response has been
successfully received.
BlueAssure Platform Integration Documentation | BlueAssure Products 50
Test Data
Use any name and address of your choosing in conjunction with any of the below images to receive the
canned/dummy response. A zip archive containing all three test images can be found under Developer
Resources on the BlueAssure Platform management site. If Solution Engine Workflow has been enabled
of your account, the dummy response will also include a workflow outcome. There are no transaction
charges associated with using the below test data. Note: test transactions must be enabled for your
account for this feature to work.
Image Workflow Code Workflow Message
Green Smile P Pass
Red Smile F Fail
Yellow Smile R Needs Further Review
AssureCard Initial Request (Image Upload) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"frontImage": "Base64 encoded image of document front"
,
"backImage": "Base64 encoded image of document rear"
,
"portraitImage": "Base64 encoded image of consumer’s face"
,
"scanMode": "DirectImageUpload"
,
"documentType": "DriversLicense",
"ssn": null,
"phoneNumber": ""
,
"sendPhoneVerification": null,
"forceVerificationByCall": null,
"emailAddress": null,
"ipAddress": null,
"similarityThreshold": null
}
}
AssureCard Initial Request (Web to Mobile) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"scanMode": "CaptureViaMobile",
"requireConsumerPortrait": true,
"documentType": "DriversLicense",
"ssn": null,
"phoneNumber": "5555555555"
,
"emailAddress": null,
"ipAddress": null,
"similarityThreshold": null
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 51
AssureCard Initial Request (Web Portal) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"scanMode": "DeferredRequestLink"
,
"requireConsumerPortrait": true,
"documentType": "DriversLicense",
"ssn": null,
"emailAddress": null,
"ipAddress": null,
"similarityThreshold": null
}
}
AssureCard Initial Response (Image Upload) JSON Example
{
"meta": {
"transactionDate": "2023-12-06T06:45:26.2314228Z",
"productName": "AssureCard",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.116133"
}
}
AssureCard Initial Response (Web to Mobile) JSON Example
{
"meta": {
"transactionDate": "2023-12-06T06:45:26.2314228Z",
"productName": "AssureCard",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.116133"
}
}
AssureCard Initial Response (Web Portal) JSON Example
{
"meta": {
"transactionDate": "2023-12-06T06:45:26.2314228Z",
"productName": "AssureCard",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.116133"
},
"data": {
"deferredRequestLink": "https://blueassure.evssolutions.com/CDR/02bf2283-632f-49d2-93a9-
bf5780c7bf9a"
}
}
AssureCard Webhook Uploaded Images JSON Example
{
"meta": {
"transactionDate": "2023-12-06T06:45:26.2314228Z",
"productName": "AssureCard",
BlueAssure Platform Integration Documentation | BlueAssure Products 52
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.116133"
},
"data": {
"frontImage": "Base64 encoded image"
,
"backImage": "Base64 encoded image"
,
"portraitImage": "Base64 encoded image"
}
}
AssureCard WebHook Callback JSON Example
{
"meta": {
"transactionId": 134857,
"transactionDate": "2023-11-30T21:36:33.707",
"productName": "AssureCard",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0"
,
"totalDuration": "0.78"
},
"data": {
"workflowOutcome": {
"code": "P",
"description": "Pass"
},
"assureCard": {
"validationResult": {
"code": "0",
"description": "The document has passed the check."
},
"imageParsingResult": {
"code": "B",
"description": "Both sides of the document were successfully parsed."
},
"totalConfidence": 100,
"documentInformation": {
"licenseNumberConfidence": 100,
"licenseNumber": "P12345678",
"documentType": "DL",
"issueDate": "2010-01-31",
"expirationDate": "2100-01-31",
"documentClass": "D",
"template": "US_KY3"
},
"documentName": {
"nameConfidence": 100,
"fullName": "JOHNDOETEST",
"firstName": "JOHN",
"privateName": "JOHNDOE",
"middleName": "DOE",
"familyName": "TEST"
},
"documentAddress": {
"addressConfidence": 100,
"address": "123MAINSTREET",
"city": "FRANKFORT",
"state": "KY",
"zipCode": "40601-0000",
"country": "UNITEDSTATES"
},
"individualCharacteristics": {
"calculatedAge": 33,
"gender": "Male",
"eyeColor": "Blue",
"hairColor": ""
,
BlueAssure Platform Integration Documentation | BlueAssure Products 53
"height": "072IN",
"weight": ""
}
},
"assureId": {
"primaryResult": {
"code": "00"
},
"addressVerificationResult": {
"code": "Y",
"description": "Supplied full name matches supplied address. Address confirmed residenti
al."
},
"addressTypeResult": {
"code": "S",
"description": "Submitted address is residential address."
},
"addressHighRiskResult": {
"code": "N",
"description": "No address high risk information found for submitted address."
},
"phoneVerificationResult": {
"code": "M",
"description": "Phone number was not entered on search request."
},
"phoneHighRiskResult": {
"code": "N",
"description": "No phone high risk information found."
},
"changeOfAddressResult": {
"code": "N",
"description": "No change of address information was found."
},
"driverLicenseResult": {
"code": "M",
"description": "DL number not submitted."
},
"socialSecurityNumberResult": {
"code": "YA",
"description": "Match to full name and address using Social Security Number."
},
"dateOfBirthResult": {
"code": "6",
"description": "DOB not on input."
},
"emailVerificationResult": {
"code": "T1",
"description": "Match to Name associated with Email in repository"
},
"emailValidationResult": {
"code": "V",
"description": "Possible valid email address"
},
"emailReasonResult": {
"code": "N",
"description": "No Failure Identified – the email had proper syntax and domain"
},
"emailRepositoryResult": {
"code": "Y",
"description": "Email address found in repository"
},
"minorResult": {
"code": "N",
"description": "The matched consumer is an adult."
},
"reportedFraudResult": {
"code": "N",
"description": "No fraud has been reported for the matched consumer"
},
BlueAssure Platform Integration Documentation | BlueAssure Products 54
"standardizedAddress": {
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
"consumerIdDetail": {
"areaCode": ""
,
"phone": ""
,
"reportedDate": {
"year": "2012",
"month": "11",
"day": "16"
},
"lastTouchedDate": {
"year": "2015",
"month": "09",
"day": "01"
},
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
"residentialAddressDetails": [
{
"spouseName": ""
,
"houseMembers": [],
"residenceLength": "0047",
"aliasName": ""
,
"areaCode": "502",
"phone": "0000000",
"lastTouchedDate": {
"year": "2015",
"month": "11",
"day": "02"
},
"firstName": "JOHN",
"middleInitial": "R",
"lastName": "TEST",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
},
{
"spouseName": ""
,
"houseMembers": [],
"residenceLength": ""
,
"aliasName": ""
,
"areaCode": ""
,
"phone": ""
,
"lastTouchedDate": {
"year": "2015",
"month": "09",
"day": "01"
},
BlueAssure Platform Integration Documentation | BlueAssure Products 55
es."
e."
"firstName": "JOHN",
"middleInitial": ""
,
"lastName": "SMITH",
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4667",
"county": "Jefferson"
}
],
"ssnValidation": {
"deceasedResult": {
"code": "N",
"description": "Not deceased - no matching files found on the death master list."
},
"formatResult": {
"code": "V",
"description": "Social Security Number is valid per Social Security Administration fil
},
"issueResult": {
"code": "I",
"description": "Social Security Number has been issued with a beginning and ending dat
},
"stateIssued": "KY",
"issueStartRange": "1966",
"issueEndRange": "1968"
},
"additionalAddresses": [
{
"reportDate": {
"year": "2013",
"month": "12",
"day": "10"
},
"updateDate": {
"year": "2014",
"month": "06",
"day": "02"
},
"street": "123 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4333",
"county": "Jefferson"
},
{
"reportDate": {
"year": "2002",
"month": "05",
"day": "11"
},
"updateDate": {
"year": "2011",
"month": "11",
"day": "06"
},
"street": "456 MAIN ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"zipPlusFour": "4333",
"county": "Jefferson"
},
{
"reportDate": {
BlueAssure Platform Integration Documentation | BlueAssure Products 56
"year": "1994",
"month": "09",
"day": "14"
},
"updateDate": {
"year": "2004",
"month": "04",
"day": "13"
},
"street": "1111 BROADWAY AVE",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40202",
"zipPlusFour": "1111",
"county": "Jefferson"
},
{
"reportDate": {
"year": "1994",
"month": "09",
"day": "14"
},
"updateDate": {
"year": "2004",
"month": "04",
"day": "13"
},
"street": "2222 WEST ST",
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40202",
"zipPlusFour": "1111",
"county": "Jefferson"
}
],
"fraudShieldResults": {
"fraudShield01": {
"code": "N"
},
"fraudShield02": {
"code": "N"
},
"fraudShield03": {
"code": "N"
},
"fraudShield04": {
"code": "N"
},
"fraudShield05": {
"code": "N"
},
"fraudShield06": {
"code": "N"
},
"fraudShield10": {
"code": "N"
},
"fraudShield11": {
"code": "N"
},
"fraudShield13": {
"code": "N"
},
"fraudShield14": {
"code": "N"
},
"fraudShield15": {
"code": "N"
},
BlueAssure Platform Integration Documentation | BlueAssure Products 57
"fraudShield16": {
"code": "N"
},
"fraudShield17": {
"code": "N"
},
"fraudShield18": {
"code": "N"
},
"fraudShield21": {
"code": "N"
},
"fraudShield25": {
"code": "N"
},
"fraudShield26": {
"code": "N"
}
},
"sharedApplicationResults": {},
"ipAddressDetail": {
"country": "USA",
"msa": "529",
"latitude": "38.17728",
"longitude": "
-85.69685",
"cityResult": {
"code": "1",
"description": "Match to input"
},
"stateResult": {
"code": "1",
"description": "Match to input"
},
"zipCodeResult": {
"code": "1",
"description": "Match to input"
},
"countryResult": {
"code": "1",
"description": "Match US"
},
"city": "LOUISVILLE",
"state": "KY",
"zipCode": "40299",
"county": "Jefferson"
}
},
"kbaQuestions": {
"questions": [
{
"text": "Which one of the following area codes is associated with you?",
"questionType": 2,
"answers": [
{
"text": "502",
"isCorrect": true
},
{
"text": "231",
"isCorrect": false
},
{
"text": "810",
"isCorrect": false
},
{
"text": "313/586/248/734",
"isCorrect": false
},
BlueAssure Platform Integration Documentation | BlueAssure Products 58
{
"text": "313/586/248",
"isCorrect": false
},
{
"text": "313/734",
"isCorrect": false
},
{
"text": "616",
"isCorrect": false
},
{
"text": "906",
"isCorrect": false
},
{
"text": "765",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
},
{
"text": "Which one of the following counties is associated with you?",
"questionType": 3,
"answers": [
{
"text": "Auglaize",
"isCorrect": false
},
{
"text": "Montgomery",
"isCorrect": false
},
{
"text": "Larue",
"isCorrect": false
},
{
"text": "Benton",
"isCorrect": false
},
{
"text": "Delta",
"isCorrect": false
},
{
"text": "Union",
"isCorrect": false
},
{
"text": "Missaukee",
"isCorrect": false
},
{
"text": "Jefferson",
"isCorrect": true
},
{
"text": "Clark",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
BlueAssure Platform Integration Documentation | BlueAssure Products 59
},
{
},
{
}
]
"text": "Which one of the following zip codes is associated with you?",
"questionType": 4,
"answers": [
{
"text": "40829",
"isCorrect": false
},
{
"text": "40506",
"isCorrect": false
},
{
"text": "40106",
"isCorrect": false
},
{
"text": "40202",
"isCorrect": true
},
{
"text": "40803",
"isCorrect": false
},
{
"text": "40848",
"isCorrect": false
},
{
"text": "40516",
"isCorrect": false
},
{
"text": "40136",
"isCorrect": false
},
{
"text": "40559",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
"text": "What state was your SSN issued in?",
"questionType": 5,
"answers": [
{
"text": "New Mexico",
"isCorrect": false
},
{
"text": "Vermont",
"isCorrect": false
},
{
"text": "Kentucky",
"isCorrect": true
},
{
"text": "Washington",
"isCorrect": false
},
BlueAssure Platform Integration Documentation | BlueAssure Products 60
{
"text": "Nevada",
"isCorrect": false
},
{
"text": "Delaware",
"isCorrect": false
},
{
"text": "Ohio",
"isCorrect": false
},
{
"text": "Virginia",
"isCorrect": false
},
{
"text": "Colorado",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
"text": "Which one of the following adult individuals is most closely associated with
you?",
},
{
"questionType": 6,
"answers": [
{
"text": "Eru",
"isCorrect": false
},
{
"text": "Anna",
"isCorrect": false
},
{
"text": "Isaac",
"isCorrect": false
},
{
"text": "Paulino",
"isCorrect": false
},
{
"text": "Eber",
"isCorrect": false
},
{
"text": "AnaLeticia",
"isCorrect": false
},
{
"text": "Barbara",
"isCorrect": false
},
{
"text": "Colin",
"isCorrect": false
},
{
"text": "Benjamin",
"isCorrect": false
},
{
"text": "None of the above",
BlueAssure Platform Integration Documentation | BlueAssure Products 61
},
{
},
{
"isCorrect": true
}
]
"text": "What was the zip code for the address on MAIN ST?",
"questionType": 9,
"answers": [
{
"text": "40111",
"isCorrect": false
},
{
"text": "40938",
"isCorrect": false
},
{
"text": "40879",
"isCorrect": false
},
{
"text": "40856",
"isCorrect": false
},
{
"text": "40936",
"isCorrect": false
},
{
"text": "40846",
"isCorrect": false
},
{
"text": "40299",
"isCorrect": true
},
{
"text": "40032",
"isCorrect": false
},
{
"text": "40158",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
"text": "What was the house number for the address on MAIN ST?",
"questionType": 10,
"answers": [
{
"text": "120",
"isCorrect": false
},
{
"text": "938",
"isCorrect": false
},
{
"text": "881",
"isCorrect": false
},
{
"text": "858",
"isCorrect": false
BlueAssure Platform Integration Documentation | BlueAssure Products 62
},
{
"text": "936",
"isCorrect": false
},
{
"text": "847",
"isCorrect": false
},
{
"text": "456",
"isCorrect": true
},
{
"text": "42",
"isCorrect": false
},
{
"text": "166",
"isCorrect": false
},
{
"text": "None of the above",
"isCorrect": false
}
]
}
}
}
]
}
BlueAssure Platform Integration Documentation | BlueAssure Products 63
AssureFill
The AssureFill product scans the back of an identification card, such as a Driver’s License, to read the
information encoded in the 2D barcode there and return it in the web service response. Optionally, this
information can also be sent to our AssureID, AssurePhone, and/or AssureWatch products and those
results included in the service response as well.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureFill
Input Fields
Required
Field
Direct
Required
Mobile Capture Notes
Upload
ScanMode Yes Yes DirectImageUpload or CaptureViaMobile or
DeferredRequestLink
BackImage Yes N/A Base64 encoded image data in JPG or PNG
format
Ssn No No AssureID Option Only. 4 or 9-digit social
security number
PhoneNumber No Yes AssureID & AssurePhone Options Only.
10-digit phone number
SendPhoneVerification No No
AssurePhone Option Only. Send a value of
True to have a verification code sent as a text
message / voice call to the phone number
provided in the PhoneNumber field.
ForceVerificationByCall No No
AssurePhone Option Only. Send a value of
True to force Phone Verification to be sent by
voice call, even if the provided phone number is
found to be a mobile phone.
EmailAddress No No AssureID Option Only
IpAddress No No AssureID Option Only. IPv4 address.
Format: ###.###.###.###
SimilarityThreshold No No
AssureWatch Option Only. Value between 50
- 100 representing how close name must match
for a similarly search. Defaults to 75 when not
sent.
LookbackDate No No AssureAMS Option Only. See AssureAMS for
more details.
Image Quality & Size Recommendations
The best way to ensure accurate authentication results is to submit good images that our systems can
successfully process.
The minimum image resolution is 800 x 600px, in JPG or PNG file format, with a compression rate of less
than 15%. We also recommend keeping file size under 4 MB total and no larger than 1500px in either
dimension. Larger files may result in longer processing time or errors.
BlueAssure Platform Integration Documentation | BlueAssure Products 64
Upload Images Directly
Images can be uploaded directly to BlueAssure when using the ScanMode value DirectImageUpload. In
this case BackImage is a required field and should include the Base64-encoded data for the image of the
back of the ID. For more information on image size and format recommendations see Image Quality &
Size Recommendations above.
Capture Images From Mobile Phone
Images can also be uploaded by the ID holder using the ScanMode value CaptureViaMobile. In this case
a mobile phone number of the ID holder must be provided in the PhoneNumber field. A text message
will be sent to the mobile number with a link that will allow the ID holder to take images of the back of
the ID using their phone. The link sent in the text message is only valid for one hour.
If a request is submitted this way via the web service API, you must provide a unique
CustomerReference identifier in the request. This is how you will know which response via the webhook
callback is connected to that request. An initial stub JSON response is returned with a 200 HTTP code to
such requests, but no data can be returned and a transaction ID is not created until the customer
submits the requested data at the link in the text message. This stub response will follow the same
format as the response JSON example below, but with no “data” property (only the “meta” property).
Capture Images From Web Portal
Clients can request an image upload link that can be embedded in the client's application or website. In
this case, the only requirement is that ScanMode value must be DeferredRequestLink. This will return
the image capturing link in the JSON response rather than sending it to the end consumer via text. This
allows you to embed the image capture portal in your website or application. The link sent in the
response is only valid for one hour.
As above, a request submitted this way must have a unique CustomerReference so the webhook
response can be connected to the request.
Receiving Submitted Images
If you wish to receive the image submitted using the CaptureViaMobile or DeferredRequestLink modes,
you can enable an account option to do so. Go to My Account → Options, look in the Product Options
section, and the option labeled “Enable delivery of consumer-uploaded images to product webhook”
should be checked. If it is not, have an account admin enable that option for you by clicking the Edit
button at the bottom of the page, selecting that checkbox, and then clicking Save.
With this option enabled, when an image is submitted by the end consumer it will be sent to the
webhook you have configured (see below under Asynchronous Request/Response Process) as a base
64-encoded string in JSON properties (example below).
Test Data
Use any name and address of your choosing in conjunction with any of the below images to receive the
canned/dummy response. A zip archive containing all three test images can be found under Developer
Resources on the BlueAssure Platform management site. If Solution Engine Workflow has been enabled
BlueAssure Platform Integration Documentation | BlueAssure Products 65
of your account, the dummy response will also include a workflow outcome. There are no transaction
charges associated with using the below test data. Note: test transactions must be enabled for your
account for this feature to work.
Image Workflow Code Workflow Message
Green Smile P Pass
Red Smile F Fail
Yellow Smile R Needs Further Review
AssureFill Request (Image Upload) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"backImage": "Base64 encoded image of document rear"
,
"scanMode": "DirectImageUpload"
,
"documentType": "DriversLicense",
"ssn": null,
"phoneNumber": ""
,
"sendPhoneVerification": null,
"forceVerificationByCall": null,
"emailAddress": null,
"ipAddress": null,
"similarityThreshold": null
}
}
AssureFill Request (Web to Mobile) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"scanMode": "CaptureViaMobile",
"documentType": "DriversLicense",
"ssn": null,
"phoneNumber": "5555555555"
,
"emailAddress": null,
"ipAddress": null,
"similarityThreshold": null
}
}
AssureFill Request (Web Portal) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
BlueAssure Platform Integration Documentation | BlueAssure Products 66
"data": {
"scanMode": "DeferredRequestLink"
,
"documentType": "DriversLicense",
"ssn": null,
"phoneNumber": "5555555555"
,
"emailAddress": null,
"ipAddress": null,
"similarityThreshold": null
}
}
AssureFill Response (Web Portal) JSON Example
{
"meta": {
"transactionDate": "2023-12-06T06:45:26.2314228Z",
"productName": "AssureFill"
,
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.116133"
},
"data": {
"deferredRequestLink": "https://blueassure.evssolutions.com/FDR/02bf2283-632f-49d2-93a9-
bf5780c7bf9a"
}
}
AssureFill Webhook Uploaded Images JSON Example
{
"meta": {
"transactionDate": "2023-12-06T06:45:26.2314228Z",
"productName": "AssureFill"
,
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.116133"
},
"data": {
"backImage": "Base64 encoded image"
}
}
AssureFill Response JSON Example
{
"meta": {
"transactionId": 134900,
"transactionDate": "2023-12-06T15:28:09.147",
"productName": "AssureFill",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0.01",
"totalDuration": "0.1448193"
},
"data": {
"workflowOutcome": {
"code": "P",
"description": "Pass"
},
"assureFill": {
"documentValidationResult": {
"code": "V",
"description": "Successfully processed the image and the document appears valid."
},
BlueAssure Platform Integration Documentation | BlueAssure Products 67
"documentExpirationResult": {
"code": "NE",
"description": "The document has not expired."
},
"parsedName": {
"fullName": "JOHN TEST",
"namePrefix": ""
,
"firstName": "JOHN",
"middleName": ""
,
"lastName": "TEST",
"nameSuffix": ""
},
"parsedAddress": {
"address1": "123 MAIN STREET",
"address2": ""
,
"city": "FRANKFORT",
"jurisdictionCode": "KY",
"postalCode": "40601-0000",
"countryCode": "USA",
"country": "UNITED STATES"
},
"parsedDescription": {
"dateOfBirth": "1990-01-31",
"calculatedAge": 33,
"gender": "Male",
"eyeColor": "Blue",
"hairColor": ""
,
"race": ""
,
"height": "072 IN",
"weightKg": ""
,
"weightLbs": ""
,
"veteran": ""
,
"organDonor": ""
},
"parsedDocumentInfo": {
"licenseNumber": "P12345678",
"documentType": "DL",
"issuerIdentificationNumber": "636046",
"issueDate": "2010-01-31",
"issuedBy": "KY",
"expirationDate": "2100-01-31",
"cardRevisionDate": "2020-01-31",
"classificationCode": "D",
"complianceType": ""
,
"limitedDurationDocument": ""
,
"endorsementsCode": "NONE",
"endorsementCodeDescription": ""
,
"restrictionCode": "NONE",
"restrictionCodeDescription": ""
,
"vehicleClassCode": "D",
"vehicleClassCodeDescription": ""
}
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 68
AssureAMS
AssureAMS (Adverse Media Screening) checks individuals or business entities for negative news events.
Results will include descriptions and sources that can be used to fulfill anti-money laundering
requirements.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureAms
Input Fields
Field Individual Required Entity Required Notes
EntityName N/A Yes Only used when submitting an entity
FirstName Yes N/A Only used when submitting an individual
MiddleName No N/A Only used when submitting an individual
LastName Yes N/A Only used when submitting an individual
Street No No
City No No
Province No No 2 character province code
PostalCode No No
IsoCountryCode No No 3 character country code
DateOfBirth No No Only used when submitting an
individual. Format: yyyy-MM-dd
LookbackDate No No Format: yyyy-MM-dd
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type FirstName LastName EntityName
Exact Match John Test
Exact Match Widget Company
AssureAMS Request JSON Example (Individual)
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"firstName": "John",
"middleName": null,
"lastName": "Test",
"generation": null,
BlueAssure Platform Integration Documentation | BlueAssure Products 69
"street": "123 Main St",
"city": "Louisville",
"province": "KY",
"postalCode": "40223",
"dateOfBirth": "1950-01-31",
"isoCountryCode": "USA"
,
"lookbackDate": "2019-01-01"
}
}
AMS Request JSON Example (Entity)
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"entityName": "Widget Company"
,
"generation": null,
"street": "123 Main St",
"city": "Louisville",
"province": "KY",
"postalCode": "40223",
"isoCountryCode": "USA"
,
"lookbackDate": "2019-01-01"
}
}
AssureAMS Response JSON Example
{
"meta": {
"transactionId": 134901,
"transactionDate": "2023-12-06T15:34:16.26",
"productName": "AssureAMS",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.1232036"
},
"data": {
"workflowOutcome": {
"code": ""
,
"description": "Workflow Disabled"
},
"assureAms": {
"matchesFoundResult": {
"code": "M",
"description": "Matching profiles were found for the entered data."
},
"adverseMediaProfiles": [
{
"matchScore": 90,
"profileName": "John Test",
"alertNotesSummary": "arrested on Thursday, at Mbezi Africana area at night while tryi
ng to steal a Toyota Platz car.",
"riskCodes": ""
,
"gender": "Male",
"events": [
{
"eventDate": "2022-01-07",
"description": "arrested on Thursday, at the Mbezi Africana area at night whil
e trying to steal a Toyota Platz car. The suspect attempted to flee but was apprehended not far from the s
ite of the incident.",
"categoryCode": "TFT",
BlueAssure Platform Integration Documentation | BlueAssure Products 70
"categoryDescription": "Theft (Larceny, Misappropriation, Embezzlement, Extort
ion)",
"subCategoryCode": "ART",
"subCategoryDescription": "Arrest",
"mostRecentDate": "2022-01-07",
"sources": [
{
"publisher": "HT Media Ltd.",
"publication": "PatInto.org (KY)",
"publishDate": "2022-01-07",
"description": "Theft",
"url": "https://rsf.org/en/country/angola",
"type": "Media"
}
]
}
],
"addresses": [
{
"rawFormat": "123 MAIN ST, Louisville, Kentucky, 40299",
"addressLine1": "123 MAIN ST",
"addressLine2": ""
,
"city": "Louisville",
"state": "Kentucky",
"province": "KY",
"postalCode": "40299",
"country": "USA",
"isoCountry": "USA"
}
],
"aliases": [
{
"name": "John T.",
"type": "FKA"
},
{
"name": "John III Test",
"type": "AKA"
}
],
"dateOfBirths": [
{
"year": 1992,
"approximate": true
}
],
"attributes": [
{
"type": "WGT",
"typeDescription": "Weight",
"value": "210 lbs."
},
{
"type": "SEX",
"typeDescription": "Sex",
"value": "Male"
},
{
"type": "HCL",
"typeDescription": "Hair color",
"value": "Gray or Partially Gray"
}
],
"sources": [
{
"publisher": "HT Media Ltd.",
"publication": "PatInto.org (KY)",
"publishDate": "2022-01-07",
"description": ""
,
BlueAssure Platform Integration Documentation | BlueAssure Products 71
"url": "https://rsf.org/en/country/angola",
"type": "Media"
}
]
},
{
"matchScore": 90,
"profileName": "John Test",
"alertNotesSummary": "Repeated abuse of elderly civilians on government property.",
"riskCodes": ""
,
"gender": "Male",
"events": [
{
"eventDate": "2020-05-24",
"description": " Pub. L. 98–
473, title II, § 1001(a) Charged with Class A Felony for Abuse of elderly civilians.",
"categoryCode": "ABU",
"categoryDescription": "Abuse (Domestic, Elder, Child)",
"subCategoryCode": "ART",
"subCategoryDescription": "ARREST",
"mostRecentDate": "2022-09-17",
"sources": [
{
"publisher": ""
,
"publication": "Pub. L.",
"publishDate": "2020-05-24",
"description": ""
,
"url": "https://www.kentuckycriminaldefenseattorney.com/abuse/John-
Test",
"type": "Web"
}
]
},
{
"eventDate": "2020-05-24",
"description": "U.S. Code § 3559 Charged with Class A Felony of assault.",
"categoryCode": "AST",
"categoryDescription": "Assault, Battery",
"subCategoryCode": "ART",
"subCategoryDescription": "ARREST",
"mostRecentDate": "2022-09-16",
"sources": [
{
"publisher": ""
,
"publication": "Pub. L.",
"publishDate": "2020-05-24",
"description": ""
,
"url": "https://www.kentuckycriminaldefenseattorney.com/assult/John-
Test",
"type": "Web"
}
]
}
],
"addresses": [
{
"rawFormat": "333 Cape Cobb Ln, El Paso, Texas, 79913, USA",
"addressLine1": "333 Cape Cobb Ln",
"addressLine2": ""
,
"city": "El Paso",
"state": "Texas",
"province": "TX",
"postalCode": "79913",
"country": "USA",
"isoCountry": "USA"
},
{
"rawFormat": "8888 Beaver Creek Park Drive, El Paso, Texas, 79902, USA",
"addressLine1": "8888 Beaver Creek Park Drive",
BlueAssure Platform Integration Documentation | BlueAssure Products 72
"addressLine2": ""
,
"city": "El Paso",
"state": "Texas",
"province": "TX",
"postalCode": "79913",
"country": "USA",
"isoCountry": "USA"
}
],
"aliases": [
{
"name": "Jon Test",
"type": "AKA"
}
],
"dateOfBirths": [
{
"year": 1975,
"month": 1,
"approximate": true
}
],
"attributes": [
{
"type": "WGT",
"typeDescription": "Weight",
"value": "187 lbs."
},
{
"type": "HCL",
"typeDescription": "Hair color",
"value": "Brown"
}
],
"sources": [
{
"publisher": ""
,
"publication": "Pub. L.",
"publishDate": "2020-05-24",
"description": ""
,
"url": "https://www.kentuckycriminaldefenseattorney.com/assult/John-Test",
"type": "Web"
},
{
"publisher": ""
,
"publication": "Pub. M.",
"publishDate": "2020-05-24",
"description": ""
,
"url": "https://www.kentuckycriminaldefenseattorney.com/abuse/John-Test",
"type": "Web"
}
]
}
}
}
]
}
BlueAssure Platform Integration Documentation | BlueAssure Products 73
PEP
PEP (Politically Exposed Persons) screens individuals for connections to positions of power that can
could potentially be abused through corruption or bribery. This product returns information on an
individual’s PEP level and position type so you can make informed decisions about their risk level for
your use case. See Appendix F for more information about the PEP categories in this product.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/Pep
Input Fields
Field Required Notes
FirstName Yes
MiddleName No
LastName Yes
Street No
City No
Province No 2 character province code
PostalCode No
IsoCountryCode No 3 character country code
DateOfBirth No Format: yyyy-MM-dd
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type FirstName LastName
Exact Match John Test
Exact Match Janet Test
PEP Request JSON Example (Individual)
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"firstName": "John",
"middleName": null,
"lastName": "Test",
"street": "123 Main St",
"city": "Louisville",
"province": "KY",
"postalCode": "40223",
BlueAssure Platform Integration Documentation | BlueAssure Products 74
"dateOfBirth": "1950-01-31",
"isoCountryCode": "USA"
}
}
PEP Response JSON Example
{
"meta": {
"transactionId": 134902,
"transactionDate": "2023-12-06T17:00:07.96",
"productName": "PEP",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0",
"totalDuration": "0.1088578"
},
"data": {
"workflowOutcome": {
"code": ""
,
"description": "Workflow Disabled"
},
"pep": {
"pepMatchResult": {
"code": "M",
"description": "Matching profiles were found for the entered data."
},
"pepProfiles": [
{
"nameMatchResult": {
"code": "E",
"description": "Exact match"
},
"addressMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"dobMatchResult": {
"code": "NS",
"description": "Not submitted"
},
"matchScore": 90,
"profileName": "John Test",
"alertNotesSummary": "Charged with Class A Misdemeanor of Trespass in the Second Degre
e, Class A Misdemeanor of Having a Posesssion Reportedly Belonging To Someone Else, SRPD, DOI: 10-12-
2015.",
"gender": "Male",
"positions": [
{
"name": "Board of Directors",
"from": "2021",
"to": ""
}
],
"pepRisks": [
{
"typeCode": "LEG",
"typeDescription": "Senior legislative branch officials",
"seniorityLevel": 1
}
],
"relationships": [
{
"type": "MAR",
"direction": "WIFE",
"name": "Janet Test"
}
],
"addresses": [
BlueAssure Platform Integration Documentation | BlueAssure Products 75
{
"rawFormat": "123 MAIN ST, Louisville, Kentucky, 40299, USA",
"addressLine1": "123 MAIN ST",
"addressLine2": ""
,
"city": "Louisville",
"state": "Kentucky",
"province": "KY",
"postalCode": "40299",
"country": "USA",
"isoCountry": "USA"
}
],
"aliases": [
{
"name": "Jonny Test",
"type": "FKA"
}
],
"dateOfBirths": [
{
"year": 1972,
"month": 7,
"day": 13,
"approximate": false
}
],
"attributes": [
{
"type": "WGT",
"value": "130 lbs."
},
{
"type": "SEX",
"value": "Male"
}
]
}
}
}
]
}
BlueAssure Platform Integration Documentation | BlueAssure Products 76
AssurePay
AssurePay is your first line of defense against credit card fraud. AssurePay verifies that your customer’s
information matches what is on file for the credit card they want to use. A result code is provided for
each set of information provided with the credit card number: Name, Address, Phone Number, and Zip
Code Only.
Note: American Express cards are currently unsupported.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssurePay
Input Fields
Field Required Notes
CardNumber Yes* 15 or 16-digit number *Required unless Bin and Last4 are both
provided
CardBinNumber No* First 6 digits of number*Required if full number is not provided
CardLast4 No* Last 4 digits of number *Required if full number is not provided
FirstName No
MiddleName No
LastName No
Generation No AssureID Option Only.
Ssn No AssureID Option Only. 4 or 9-digit social security number
Street No
City No
State No 2-character state code
PostalCode Yes 5 or 9-digit postal code
DateOfBirth No Format: yyyy-MM-dd
PhoneNumber No 10-digit phone number
SendPhoneVerification No
AssurePhone Option Only. Send a value of True to have a
verification code sent as a text message / voice call to the phone
number provided in the PhoneNumber field.
ForceVerificationByCall No
AssurePhone Option Only. Send a value of True to force Phone
Verification to be sent by voice call, even if the provided phone
number is found to be a mobile phone.
IpAddress No AssureID Option Only. IPv4 address. Format:
###.###.###.###
EmailAddress No AssureID Option Only.
BlueAssure Platform Integration Documentation | BlueAssure Products 77
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type CreditCardNumber
Match to Name and Zip 1000100010001000
Match to Name, Address, and Zip 2000200020002000
Match to Name, Address, and Zip using Bin and Last4 3000303000
Match to Name and Zip, Partial Match to Address using Bin and Last4 4000404000
Match to Zip 5000500050005000
AssurePay Request JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"cardNumber": "2000200020002000"
,
"ssn": "222222222",
"firstName": "John",
"middleName": null,
"lastName": "Test",
"generation": null,
"street": "123 Main St",
"city": "Louisville",
"state": "KY",
"zipCode": "40223",
"dateOfBirth": "1950-01-31",
"phoneNumber": "5554443333",
"ipAddress": "127.0.0.1"
,
"emailAddress": "johntest@example.com"
,
"similarityThreshold": null
}
}
AssurePay Response JSON Example
{
"meta": {
"transactionId": 134903,
"transactionDate": "2023-12-06T17:10:21.777",
"productName": "AssurePay",
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0.014",
"totalDuration": "0.1290012"
},
"data": {
"workflowOutcome": {
"code": "P",
"description": "Pass"
},
"assurePay": {
"nameMatchResult": {
"code": "E",
"description": "Exact Match to Name"
BlueAssure Platform Integration Documentation | BlueAssure Products 78
},
"addressMatchResult": {
"code": "E",
"description": "Exact Match to Address"
},
"phoneMatchResult": {
"code": "M",
"description": "Missing phone number"
},
"zipOnlyMatchResult": {
"code": "E",
"description": "Exact match to zip"
}
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 79
AssureLocate
AssureLocate determines the likelihood that your customer is using a VPN to hide their location. The
customer is directed to a unique link to a portal that collects location information from their device and
IP address. This information is used to calculate the probability they are using a VPN. The factors used to
make this determination are fully configurable through the product’s settings page and the workflow
editor.
Service URL
https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureLocate
Input Fields
Field Required Notes
PhoneNumber Yes* 10-digit phone number. *Required for Capture Via Mobile
ScanMode Yes “CaptureViaMobile” or “DeferredRequestLink”
Test Data
Use the below data in your request to receive a canned/dummy response for testing purposes. There
are no transaction charges associated with using the below test data. Note: test transactions must be
enabled for your account for this feature to work.
Response Type PhoneNumber
Low Probability of VPN 5552225555
High Probability of VPN 5555555555
AssureLocate Request (Web Portal) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"scanMode": "DeferredRequestLink”
}
}
AssureLocate Request (Web to Mobile) JSON Example
{
"meta": {
"credentials": {
"username": "Your Web Service Username",
"password": "Your Web Service Password"
},
"customerReference": "123456789ABC"
},
"data": {
"phoneNumber": "5552225555"
,
"scanMode": "CaptureViaMobile”
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 80
AssureLocate Initial Response (Web Portal) JSON Example
{
"meta": {
"transactionDate": "2025-04-01T17:10:21.777",
"productName": "AssureLocate"
,
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0.014",
"totalDuration": "0.1290012"
},
"data": {
"deferredRequestLink": “https://blueassure.evssolutions.com/LDR/02xy2222-333z-44a4-
99a9bb7770c7cz9a”
}
}
AssureLocate Initial Response (Web to Mobile) JSON Example
{
"meta": {
"transactionDate": "2025-04-01T17:10:21.777",
"productName": "AssureLocate"
,
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0.014",
"totalDuration": "0.1290012"
}
}
AssureLocate Webhook Callback JSON Example
{
"meta": {
"transactionId": 987654321,
"transactionDate": "2025-04-01T17:10:21.777",
"productName": "AssureLocate"
,
"productVersion": "3.0.0",
"customerReference": "123456789ABC"
,
"dataProviderDuration": "0.014"
,
"totalDuration": "0.1290012"
},
"data": {
"workflowOutcome": {
"code": "P",
"description": "Pass"
},
"assureLocate": {
"locationToIpDistanceMiles": 3,
"vpnProbability": {
"code": "L",
"description": "Distance indicates low probability of VPN usage"
},
"deviceLocation": {
"deviceLatitude": "40.783958",
"deviceLongitude": "
-73.971252",
"accuracyMeters": "10.34490367"
},
"ipLocation": {
"ipAddress": "127.0.0.1"
,
"ipLatitude": "40.783090",
"ipLongitude": "
-73.971335",
"city": "New York",
"region": "New York",
"regionCode": "US-NY",
"postalCode": "10024",
"district": "New York",
"isoCountry": "USA",
"isp": "VERIZON FIOS",
BlueAssure Platform Integration Documentation | BlueAssure Products 81
"organization": "VERIZON FIOS",
"asn": "AS10001",
"hostName": "syn-077-177-111-000.res.verizon.com",
"torDetected": false,
"isProxy": false,
"proxyType": “RELAY”,
"isAnonymous": false,
"isKnownAttacker": false,
"isSpam": false,
"isBot ": false,
"isCloudProvider": false,
"threatScore": 0
}
}
}
}
BlueAssure Platform Integration Documentation | BlueAssure Products 82
Appendix A: Response Codes
Address Verification (Level 5) Result Codes
Code Definition Match
Summary
A1 Exact match on first and last name; Exact match on address Exact Match
B Business was found at supplied address from the residential file. Exact Match
BB Business was found at the supplied address. Exact Match
BM Business was found in both business and residential files at the supplied address. Exact Match
H1 Exact match on first name, last name matches one of hyphenated last names; Exact
match on address Exact Match
Q1 First name matches last, last name matches first (exact matches only);Exact match
on address Exact Match
YB Supplied full name matches supplied address. Address was found in business files. Exact Match
Address Verification (Level 4) Result Codes
Code Definition Match
Summary
A2 Exact match on first and last name; Misspelling of street name (all other fields match) Close Match
A5 Exact match on first and last name; Street number missing on input (all other fields
match) Close Match
A7 Exact match on first and last name; No match to city (all other fields match) Close Match
A8 Exact match on first and last name; No match to ZIP code (all other fields match) Close Match
AC Exact match on first and last name; Partial match to street name (all other fields
match) Close Match
AF Exact match on first and last name; Partial match to street name and no match to
city (all other fields match) Close Match
AG Exact match on first and last name; Close match to street name; no match to city (all
other fields match) Close Match
AH Exact match on first and last name; Close match to street name; no match to state
(all other fields match) Close Match
AJ Exact match on first and last name; Close match to street name; no match to ZIP
code (all other fields match) Close Match
AK Exact match on first and last name; Partial match to street name; no match to state
(all other fields match) Close Match
AU Exact match on first and last name; No match to state (all other fields match) Close Match
AV Exact match on first and last name; Partial match to street name; no match to ZIP
code (all other fields match) Close Match
C1 Misspelling of either first OR last name; Exact match on address Close Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 83
Address Verification (Level 4) Result Codes (CONT’D)
Code Definition Match
Summary
C2 Misspelling of either first OR last name; Misspelling of street name (all other fields
match) Close Match
C7 Misspelling of either first OR last name; No match to city (all other fields match) Close Match
C8 Misspelling of either first OR last name; No match to ZIP code (all other fields match) Close Match
CC Misspelling of either first OR last name; Partial match to street name (all other fields
match) Close Match
CU Misspelling of either first OR last name; No match to state (all other fields match) Close Match
D1 Misspelling of first AND last name; Exact match on address Close Match
D2 Misspelling of first AND last name; Misspelling of street name (all other fields match) Close Match
D7 Misspelling of first AND last name; No match to city (all other fields match) Close Match
D8 Misspelling of first AND last name; No match to ZIP code (all other fields match) Close Match
DC Misspelling of first AND last name; Partial match to street name (all other fields
match) Close Match
DU Misspelling of first AND last name; No match to state (all other fields match) Close Match
H2 Exact match on first name, last name matches one of hyphenated last names;
Misspelling of street name (all other fields match) Close Match
H5 Exact match on first name, last name matches one of hyphenated last names; Street
number missing on input (all other fields match) Close Match
H7 Exact match on first name, last name matches one of hyphenated last names; No
match to city (all other fields match) Close Match
H8 Exact match on first name, last name matches one of hyphenated last names; No
match to ZIP code (all other fields match) Close Match
HC Exact match on first name, last name matches one of hyphenated last names; Partial
match to street name (all other fields match) Close Match
HF Exact match on first name, last name matches one of hyphenated last names; Partial
match to street name and no match to city (all other fields match) Close Match
HG Exact match on first name, last name matches one of hyphenated last names; Close
match to street name; no match to city (all other fields match) Close Match
HH Exact match on first name, last name matches one of hyphenated last names; Close
match to street name; no match to state (all other fields match) Close Match
HJ Exact match on first name, last name matches one of hyphenated last names; Close
match to street name; no match to ZIP code (all other fields match) Close Match
HK Exact match on first name, last name matches one of hyphenated last names; Partial
match to street name; no match to state (all other fields match) Close Match
HU Exact match on first name, last name matches one of hyphenated last names; No
match to state (all other fields match) Close Match
HV Exact match on first name, last name matches one of hyphenated last names; Partial
match to street name; no match to ZIP code (all other fields match) Close Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 84
Address Verification (Level 4) Result Codes (CONT’D)
Code Definition Match
Summary
I1 First name misspelled, last name matches one of hyphenated last names; Exact
match on address Close Match
I2 First name misspelled, last name matches one of hyphenated last names; Misspelling
of street name (all other fields match) Close Match
I7 First name misspelled, last name matches one of hyphenated last names; No match
to city (all other fields match) Close Match
I8 First name misspelled, last name matches one of hyphenated last names; No match
to ZIP code (all other fields match) Close Match
IC First name misspelled, last name matches one of hyphenated last names; Partial
match to street name (all other fields match) Close Match
IU First name misspelled, last name matches one of hyphenated last names; No match
to state (all other fields match) Close Match
P1 Partial match on first name, last name matches on one of hyphenated last names;
Exact match on address Close Match
P2 Partial match on first name, last name matches on one of hyphenated last names;
Misspelling of street name (all other fields match) Close Match
P7 Partial match on first name, last name matches on one of hyphenated last names; No
match to city (all other fields match) Close Match
P8 Partial match on first name, last name matches on one of hyphenated last names; No
match to ZIP code (all other fields match) Close Match
PC Partial match on first name, last name matches on one of hyphenated last names;
Partial match to street name (all other fields match) Close Match
PU Partial match on first name, last name matches on one of hyphenated last names; No
match to state (all other fields match) Close Match
Q2 First name matches last, last name matches first (exact matches only);Misspelling of
street name (all other fields match) Close Match
Q5 First name matches last, last name matches first (exact matches only);Street number
missing on input (all other fields match) Close Match
Q7 First name matches last, last name matches first (exact matches only);No match to
city (all other fields match) Close Match
Q8 First name matches last, last name matches first (exact matches only);No match to
ZIP code (all other fields match) Close Match
QC First name matches last, last name matches first (exact matches only);Partial match
to street name (all other fields match) Close Match
QF First name matches last, last name matches first (exact matches only);Partial match
to street name and no match to city (all other fields match) Close Match
QG First name matches last, last name matches first (exact matches only);Close match
to street name; no match to city (all other fields match) Close Match
QH First name matches last, last name matches first (exact matches only);Close match
to street name; no match to state (all other fields match) Close Match
QJ First name matches last, last name matches first (exact matches only);Close match
to street name; no match to ZIP code (all other fields match) Close Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 85
Address Verification (Level 4) Result Codes (CONT’D)
Code Definition Match
Summary
QK First name matches last, last name matches first (exact matches only); Partial match
to street name; no match to state (all other fields match) Close Match
QU First name matches last, last name matches first (exact matches only); No match to
state (all other fields match) Close Match
QV First name matches last, last name matches first (exact matches only); Partial match
to street name; no match to ZIP code (all other fields match) Close Match
R1 Partial match on first name, exact match on last name; Exact match on address Close Match
R2 Partial match on first name, exact match on last name; Misspelling of street name (all
other fields match) Close Match
R7 Partial match on first name, exact match on last name; No match to city (all other
fields match) Close Match
R8 Partial match on first name, exact match on last name; No match to ZIP code (all
other fields match) Close Match
RC Partial match on first name, exact match on last name; Partial match to street name
(all other fields match) Close Match
RU Partial match on first name, exact match on last name; No match to state (all other
fields match) Close Match
W Match to other Associated Address. Close Match
Address Verification (Level 3) Result Codes
Code Definition Match
Summary
A3 Exact match on first and last name; No match to street name (all other fields match) Partial Match
A6 Exact match on first and last name; No match to street number (all other fields
match) Partial Match
AA Exact match on first and last name; Street number does not match or is missing,
close match to street name (all other fields match) Partial Match
AD Exact match on first and last name; Street number and ZIP code are missing or do
not match (all other fields match) Partial Match
AE Exact match on first and last name; Street number does not match or is missing and
partial match to street name(all other fields match) Partial Match
AN Exact match on first and last name; City and state do not match (all other fields
match) Partial Match
AP Exact match on first and last name; State and ZIP code do not match (all other fields
match) Partial Match
AQ Exact match on first and last name; Street number and state are missing or do not
match (all other fields match) Partial Match
AT Exact match on first and last name; Street number and city are missing or do not
match (all other fields match) Partial Match
C5 Misspelling of either first OR last name; Street number missing on input (all other
fields match) Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 86
Address Verification (Level 3) Result Codes (CONT’D)
Code Definition Match
Summary
C6 Misspelling of either first OR last name; No match to street number (all other fields
match) Partial Match
CA Misspelling of either first OR last name; Street number does not match or is missing,
close match to street name (all other fields match) Partial Match
CE Misspelling of either first OR last name; Street number does not match or is missing
and partial match to street name(all other fields match) Partial Match
CF Misspelling of either first OR last name; Partial match to street name and no match to
city (all other fields match) Partial Match
CG Misspelling of either first OR last name; Close match to street name; no match to city
(all other fields match) Partial Match
CH Misspelling of either first OR last name; Close match to street name; no match to
state (all other fields match) Partial Match
CJ Misspelling of either first OR last name; Close match to street name; no match to ZIP
code (all other fields match) Partial Match
CK Misspelling of either first OR last name; Partial match to street name; no match to
state (all other fields match) Partial Match
CV Misspelling of either first OR last name; Partial match to street name; no match to
ZIP code (all other fields match) Partial Match
D5 Misspelling of first AND last name; Street number missing on input (all other fields
match) Partial Match
D6 Misspelling of first AND last name; No match to street number (all other fields match) Partial Match
DA Misspelling of first AND last name; Street number does not match or is missing, close
match to street name (all other fields match) Partial Match
DE Misspelling of first AND last name; Street number does not match or is missing and
partial match to street name(all other fields match) Partial Match
DF Misspelling of first AND last name; Partial match to street name and no match to city
(all other fields match) Partial Match
DG Misspelling of first AND last name; Close match to street name; no match to city (all
other fields match) Partial Match
DH Misspelling of first AND last name; Close match to street name; no match to state (all
other fields match) Partial Match
DJ Misspelling of first AND last name; Close match to street name; no match to ZIP code
(all other fields match) Partial Match
DK Misspelling of first AND last name; Partial match to street name; no match to state
(all other fields match) Partial Match
DV Misspelling of first AND last name; Partial match to street name; no match to ZIP
code (all other fields match) Partial Match
E1 First initial match, exact match on last name; Exact match on address Partial Match
E2 First initial match, exact match on last name; Misspelling of street name (all other
fields match) Partial Match
E5 First initial match, exact match on last name; Street number missing on input (all
other fields match) Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 87
Address Verification (Level 3) Result Codes (CONT’D)
Code Definition Match
Summary
E7 First initial match, exact match on last name; No match to city (all other fields
match) Partial Match
E8 First initial match, exact match on last name; No match to ZIP code (all other fields
match) Partial Match
EC First initial match, exact match on last name; Partial match to street name (all other
fields match) Partial Match
EF First initial match, exact match on last name; Partial match to street name and no
match to city (all other fields match) Partial Match
EG First initial match, exact match on last name; Close match to street name; no match
to city (all other fields match) Partial Match
EH First initial match, exact match on last name; Close match to street name; no match
to state (all other fields match) Partial Match
EJ First initial match, exact match on last name; Close match to street name; no match
to ZIP code (all other fields match) Partial Match
EK First initial match, exact match on last name; Partial match to street name; no match
to state (all other fields match) Partial Match
EU First initial match, exact match on last name; No match to state (all other fields
match) Partial Match
EV First initial match, exact match on last name; Partial match to street name; no match
to ZIP code (all other fields match) Partial Match
F1 First initial match, last name misspelled; Exact match on address Partial Match
F2 First initial match, last name misspelled; Misspelling of street name (all other fields
match) Partial Match
F5 First initial match, last name misspelled; Street number missing on input (all other
fields match) Partial Match
F7 First initial match, last name misspelled; No match to city (all other fields match) Partial Match
F8 First initial match, last name misspelled; No match to ZIP code (all other fields
match) Partial Match
FC First initial match, last name misspelled; Partial match to street name (all other fields
match) Partial Match
FF First initial match, last name misspelled; Partial match to street name and no match
to city (all other fields match) Partial Match
FG First initial match, last name misspelled; Close match to street name; no match to
city (all other fields match) Partial Match
FH First initial match, last name misspelled; Close match to street name; no match to
state (all other fields match) Partial Match
FJ First initial match, last name misspelled; Close match to street name; no match to
ZIP code (all other fields match) Partial Match
FK First initial match, last name misspelled; Partial match to street name; no match to
state (all other fields match) Partial Match
FU First initial match, last name misspelled; No match to state (all other fields match) Partial Match
FV First initial match, last name misspelled; Partial match to street name; no match to
ZIP code (all other fields match) Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 88
Address Verification (Level 3) Result Codes (CONT’D)
Code Definition Match
Summary
G1 First name does not match or is missing, exact match on last name; Exact match on
address Partial Match
G2 First name does not match or is missing, exact match on last name; Misspelling of
street name (all other fields match) Partial Match
G7 First name does not match or is missing, exact match on last name; No match to city
(all other fields match) Partial Match
G8 First name does not match or is missing, exact match on last name; No match to ZIP
code (all other fields match) Partial Match
GC First name does not match or is missing, exact match on last name; Partial match to
street name (all other fields match) Partial Match
GU First name does not match or is missing, exact match on last name; No match to
state (all other fields match) Partial Match
H3 Exact match on first name, last name matches one of hyphenated last names; No
match to street name (all other fields match) Partial Match
H6 Exact match on first name, last name matches one of hyphenated last names; No
match to street number (all other fields match) Partial Match
HA
Exact match on first name, last name matches one of hyphenated last names; Street
number does not match or is missing, close match to street name (all other fields
match)
Partial Match
HD Exact match on first name, last name matches one of hyphenated last names; Street
number and ZIP code are missing or do not match (all other fields match) Partial Match
HE
Exact match on first name, last name matches one of hyphenated last names; Street
number does not match or is missing and partial match to street name(all other fields
match)
Partial Match
HN Exact match on first name, last name matches one of hyphenated last names; City
and state do not match (all other fields match) Partial Match
HP Exact match on first name, last name matches one of hyphenated last name; State
and ZIP code do not match (all other fields match) Partial Match
HQ Exact match on first name, last name matches one of hyphenated last names; Street
number and state are missing or do not match (all other fields match) Partial Match
HT Exact match on first name, last name matches one of hyphenated last names; Street
number and city are missing or do not match (all other fields match) Partial Match
I5 First name misspelled, last name matches one of hyphenated last names; Street
number missing on input (all other fields match) Partial Match
I6 First name misspelled, last name matches one of hyphenated last names; No match
to street number (all other fields match) Partial Match
IA
First name misspelled, last name matches one of hyphenated last names; Street
number does not match or is missing, close match to street name (all other fields
match)
Partial Match
IE
First name misspelled, last name matches one of hyphenated last names; Street
number does not match or is missing and partial match to street name(all other fields
match)
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 89
IF Code IG IH IJ IK IV J1 J2 J5 J7 J8 JC JF JG JH JJ JK JU JV M1 M2 First name misspelled, last name matches one of hyphenated last names; Partial
match to street name and no match to city (all other fields match) Partial Match
Address Verification (Level 3) Result Codes (CONT’D)
Definition Match
Summary
First name misspelled, last name matches one of hyphenated last names; Close
match to street name; no match to city (all other fields match) Partial Match
First name misspelled, last name matches one of hyphenated last names; Close
match to street name; no match to state (all other fields match) Partial Match
First name misspelled, last name matches one of hyphenated last names; Close
match to street name; no match to ZIP code (all other fields match) Partial Match
First name misspelled, last name matches one of hyphenated last names; Partial
match to street name; no match to state (all other fields match) Partial Match
First name misspelled, last name matches one of hyphenated last names; Partial
match to street name; no match to ZIP code (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Exact match on
address Partial Match
First initial match, last name matches one of hyphenated last names; Misspelling of
street name (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Street number
missing on input (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; No match to
city (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; No match to
ZIP code (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Partial match to
street name (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Partial match to
street name and no match to city (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Close match to
street name; no match to city (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Close match to
street name; no match to state (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Close match to
street name; no match to ZIP code (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Partial match to
street name; no match to state (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; No match to
state (all other fields match) Partial Match
First initial match, last name matches one of hyphenated last names; Partial match to
street name; no match to ZIP code (all other fields match) Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Exact match on address Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Misspelling of street name (all other fields match) Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 90
M7 Code M8 MC MU O1 O2 O5 O7 O8 OC OF OG OH OJ OK OU OV P5 P6 PA
First name does not match or is missing, last name matches on one of hyphenated
last names; No match to city (all other fields match) Partial Match
Address Verification (Level 3) Result Codes (CONT’D)
Definition Match
Summary
First name does not match or is missing, last name matches on one of hyphenated
last names; No match to ZIP code (all other fields match) Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Partial match to street name (all other fields match) Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; No match to state (all other fields match) Partial Match
Partial match on first name, close match on last name; Exact match on address Partial Match
Partial match on first name, close match on last name; Misspelling of street name (all
other fields match) Partial Match
Partial match on first name, close match on last name; Street number missing on
input (all other fields match) Partial Match
Partial match on first name, close match on last name; No match to city (all other
fields match) Partial Match
Partial match on first name, close match on last name; No match to ZIP code (all
other fields match) Partial Match
Partial match on first name, close match on last name; Partial match to street name
(all other fields match) Partial Match
Partial match on first name, close match on last name; Partial match to street name
and no match to city (all other fields match) Partial Match
Partial match on first name, close match on last name; Close match to street name;
no match to city (all other fields match) Partial Match
Partial match on first name, close match on last name; Close match to street name;
no match to state (all other fields match) Partial Match
Partial match on first name, close match on last name; Close match to street name;
no match to ZIP code (all other fields match) Partial Match
Partial match on first name, close match on last name; Partial match to street name;
no match to state (all other fields match) Partial Match
Partial match on first name, close match on last name; No match to state (all other
fields match) Partial Match
Partial match on first name, close match on last name; Partial match to street name;
no match to ZIP code (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Street number missing on input (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names; No
match to street number (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Street number does not match or is missing, close match to street name (all other
fields match)
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 91
PE
PF Code PG PH PJ PK PV Q3 Q6 QA QD QE QN QP QQ QT R5 R6 RA RE Partial match on first name, last name matches on one of hyphenated last names;
Street number does not match or is missing and partial match to street name(all
other fields match)
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Partial match to street name and no match to city (all other fields match) Partial Match
Address Verification (Level 3) Result Codes (CONT’D)
Definition Match
Summary
Partial match on first name, last name matches on one of hyphenated last names;
Close match to street name; no match to city (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Close match to street name; no match to state (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Close match to street name; no match to ZIP code (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Partial match to street name; no match to state (all other fields match) Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Partial match to street name; no match to ZIP code (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);No match to
street name (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);No match to
street number (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);Street number
does not match or is missing, close match to street name (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);Street number
and ZIP code are missing or do not match (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);Street number
does not match or is missing and partial match to street name(all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);City and state
do not match (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);State and ZIP
code do not match (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);Street number
and state are missing or do not match (all other fields match) Partial Match
First name matches last, last name matches first (exact matches only);Street number
and city are missing or do not match (all other fields match) Partial Match
Partial match on first name, exact match on last name; Street number missing on
input (all other fields match) Partial Match
Partial match on first name, exact match on last name; No match to street number
(all other fields match) Partial Match
Partial match on first name, exact match on last name; Street number does not
match or is missing, close match to street name (all other fields match) Partial Match
Partial match on first name, exact match on last name; Street number does not
match or is missing and partial match to street name(all other fields match) Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 92
RF RG RH Code RJ RK RV SB Code A9 AI AL AO AS AW C3 C9 CD CI CL CN Partial match on first name, exact match on last name; Partial match to street name
and no match to city (all other fields match) Partial Match
Partial match on first name, exact match on last name; Close match to street name;
no match to city (all other fields match) Partial Match
Partial match on first name, exact match on last name; Close match to street name;
no match to state (all other fields match) Partial Match
Address Verification (Level 3) Result Codes (CONT’D)
Definition Match
Summary
Partial match on first name, exact match on last name; Close match to street name;
no match to ZIP code (all other fields match) Partial Match
Partial match on first name, exact match on last name; Partial match to street name;
no match to state (all other fields match) Partial Match
Partial match on first name, exact match on last name; Partial match to street name;
no match to ZIP code (all other fields match) Partial Match
Address is found in the business files. Supplied last name matches to address. Partial Match
Address Verification (Level 2) Result Codes
Definition Match
Summary
Exact match on first and last name; City and ZIP do not match (all other fields
match)
Low Confidence
Partial Match
Exact match on first and last name; Close match to street name; city and state do
not match (all other fields match)
Low Confidence
Partial Match
Exact match on first and last name; Close match to street name; state and ZIP code
do not match (all other fields match)
Low Confidence
Partial Match
Exact match on first and last name; Partial match to street name; city and state do
not match (all other fields match)
Low Confidence
Partial Match
Exact match on first and last name; Partial match to street name; state and ZIP
code do not match (all other fields match)
Low Confidence
Partial Match
Exact match on first and last name; Street number and street name match only (no
other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; No match to street name (all other fields
match)
Low Confidence
Partial Match
Misspelling of either first OR last name; City and ZIP do not match (all other fields
match)
Low Confidence
Partial Match
Misspelling of either first OR last name; Street number and ZIP code are missing or
do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; Close match to street name; city and state
do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; Close match to street name; state and ZIP
code do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; City and state do not match (all other fields
match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 93
CO CP CQ Code CS CT CW D3 D9 DD DI DL DN DO DP DQ DS DT DW E3 E6 E9 Misspelling of either first OR last name; Partial match to street name; city and state
do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; State and ZIP code do not match (all other
fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; Street number and state are missing or do
not match (all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
Misspelling of either first OR last name; Partial match to street name; state and ZIP
code do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; Street number and city are missing or do
not match (all other fields match)
Low Confidence
Partial Match
Misspelling of either first OR last name; Street number and street name match only
(no other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; No match to street name (all other fields match) Low Confidence
Partial Match
Misspelling of first AND last name; City and ZIP do not match (all other fields match) Low Confidence
Partial Match
Misspelling of first AND last name; Street number and ZIP code are missing or do
not match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; Close match to street name; city and state do not
match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; Close match to street name; state and ZIP code
do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; City and state do not match (all other fields
match)
Low Confidence
Partial Match
Misspelling of first AND last name; Partial match to street name; city and state do
not match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; State and ZIP code do not match (all other fields
match)
Low Confidence
Partial Match
Misspelling of first AND last name; Street number and state are missing or do not
match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; Partial match to street name; state and ZIP code
do not match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; Street number and city are missing or do not
match (all other fields match)
Low Confidence
Partial Match
Misspelling of first AND last name; Street number and street name match only (no
other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; No match to street name (all other
fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; No match to street number (all other
fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; City and ZIP do not match (all other
fields match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 94
EA ED EE Code EI EL EN EO EP EQ ES ET EW F3 F6 F9 FA FD FE FI FL FN First initial match, exact match on last name; Street number does not match or is
missing, close match to street name (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Street number and ZIP code are
missing or do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Street number does not match or is
missing and partial match to street name(all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
First initial match, exact match on last name; Close match to street name; city and
state do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Close match to street name; state and
ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; City and state do not match (all other
fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Partial match to street name; city and
state do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; State and ZIP code do not match (all
other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Street number and state are missing
or do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Partial match to street name; state
and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Street number and city are missing or
do not match (all other fields match)
Low Confidence
Partial Match
First initial match, exact match on last name; Street number and street name match
only (no other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; No match to street name (all other fields
match)
Low Confidence
Partial Match
First initial match, last name misspelled; No match to street number (all other fields
match)
Low Confidence
Partial Match
First initial match, last name misspelled; City and ZIP do not match (all other fields
match)
Low Confidence
Partial Match
First initial match, last name misspelled; Street number does not match or is
missing, close match to street name (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Street number and ZIP code are missing or
do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Street number does not match or is
missing and partial match to street name(all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Close match to street name; city and state
do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Close match to street name; state and ZIP
code do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; City and state do not match (all other fields
match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 95
FO FP FQ Code FS FT FW G5 G6 GA GE
GF GG GH GJ GK GV H9 HI HL HO First initial match, last name misspelled; Partial match to street name; city and state
do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; State and ZIP code do not match (all other
fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Street number and state are missing or do
not match (all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
First initial match, last name misspelled; Partial match to street name; state and ZIP
code do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Street number and city are missing or do
not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name misspelled; Street number and street name match only
(no other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Street number
missing on input (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; No match to
street number (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Street number
does not match or is missing, close match to street name (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Street number
does not match or is missing and partial match to street name(all other fields
match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Partial match to
street name and no match to city (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Close match to
street name; no match to city (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Close match to
street name; no match to state (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Close match to
street name; no match to ZIP code (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Partial match to
street name; no match to state (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, exact match on last name; Partial match to
street name; no match to ZIP code (all other fields match)
Low Confidence
Partial Match
Exact match on first name, last name matches one of hyphenated last names; City
and ZIP do not match (all other fields match)
Low Confidence
Partial Match
Exact match on first name, last name matches one of hyphenated last names; Close
match to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
Exact match on first name, last name matches one of hyphenated last names; Close
match to street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
Exact match on first name, last name matches one of hyphenated last names;
Partial match to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 96
HS
HW I3 I9 Code ID II IL IN IO IP IQ IS IT IW J3 J6 J9 JA JD JE
Exact match on first name, last name matches one of hyphenated last names;
Partial match to street name; state and ZIP code do not match (all other fields
match)
Low Confidence
Partial Match
Exact match on first name, last name matches one of hyphenated last names;
Street number and street name match only (no other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; No match
to street name (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; City and
ZIP do not match (all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
First name misspelled, last name matches one of hyphenated last names; Street
number and ZIP code are missing or do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Close
match to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Close
match to street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; City and
state do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Partial
match to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last name; State and
ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Street
number and state are missing or do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Partial
match to street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Street
number and city are missing or do not match (all other fields match)
Low Confidence
Partial Match
First name misspelled, last name matches one of hyphenated last names; Street
number and street name match only (no other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; No match to
street name (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; No match to
street number (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; City and ZIP
do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Street number
does not match or is missing, close match to street name (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Street number
and ZIP code are missing or do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Street number
does not match or is missing and partial match to street name(all other fields
match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 97
JI JL JN JO JP Code JQ JS JT JW L1 L2 L5 L7 L8 LC LF LG LH LJ LK LU First initial match, last name matches one of hyphenated last names; Close match to
street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Close match to
street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; City and state
do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Partial match
to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last name; State and ZIP
code do not match (all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
First initial match, last name matches one of hyphenated last names; Street number
and state are missing or do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Partial match
to street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Street number
and city are missing or do not match (all other fields match)
Low Confidence
Partial Match
First initial match, last name matches one of hyphenated last names; Street number
and street name match only (no other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Exact match on
address
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Misspelling of
street name (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Street number
missing on input (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; No match to city
(all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; No match to ZIP
code (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Partial match to
street name (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Partial match to
street name and no match to city (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Close match to
street name; no match to city (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Close match to
street name; no match to state (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Close match to
street name; no match to ZIP code (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; Partial match to
street name; no match to state (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, close match on last name; No match to
state (all other fields match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 98
LV M5 M6 MA
Code ME
MF
MG MH MJ
MK MV
O3 O6 O9 OA OD OE OI First name does not match or is missing, close match on last name; Partial match to
street name; no match to ZIP code (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Street number missing on input (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; No match to street number (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Street number does not match or is missing, close match to street name
(all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
First name does not match or is missing, last name matches on one of hyphenated
last names; Street number does not match or is missing and partial match to street
name(all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Partial match to street name and no match to city (all other fields
match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Close match to street name; no match to city (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Close match to street name; no match to state (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Close match to street name; no match to ZIP code (all other fields
match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Partial match to street name; no match to state (all other fields match)
Low Confidence
Partial Match
First name does not match or is missing, last name matches on one of hyphenated
last names; Partial match to street name; no match to ZIP code (all other fields
match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; No match to street name (all
other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; No match to street number
(all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; City and ZIP do not match
(all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Street number does not
match or is missing, close match to street name (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Street number and ZIP code
are missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Street number does not
match or is missing and partial match to street name(all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Close match to street name;
city and state do not match (all other fields match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 99
OL ON OO OP OQ OS Code OT OW P3 P9 PD PI PL
PN PO PP PQ PS
PT PW Partial match on first name, close match on last name; Close match to street name;
state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; City and state do not match
(all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Partial match to street
name; city and state do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; State and ZIP code do not
match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Street number and state are
missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Partial match to street
name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
Partial match on first name, close match on last name; Street number and city are
missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, close match on last name; Street number and street
name match only (no other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
No match to street name (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
City and ZIP do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Street number and ZIP code are missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Close match to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Close match to street name; state and ZIP code do not match (all other fields
match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
City and state do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Partial match to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last name;
State and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Street number and state are missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Partial match to street name; state and ZIP code do not match (all other fields
match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Street number and city are missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, last name matches on one of hyphenated last names;
Street number and street name match only (no other fields match)
Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 100
Q9 QI QL QO QS QW R3 Code R9 RD RI RL RN RO RP RQ RS RT RW Code First name matches last, last name matches first (exact matches only);City and ZIP
do not match (all other fields match)
Low Confidence
Partial Match
First name matches last, last name matches first (exact matches only);Close match
to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
First name matches last, last name matches first (exact matches only);Close match
to street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First name matches last, last name matches first (exact matches only);Partial match
to street name; city and state do not match (all other fields match)
Low Confidence
Partial Match
First name matches last, last name matches first (exact matches only);Partial match
to street name; state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
First name matches last, last name matches first (exact matches only);Street
number and street name match only (no other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; No match to street name (all
other fields match)
Low Confidence
Partial Match
Address Verification (Level 2) Result Codes (CONT’D)
Definition Match
Summary
Partial match on first name, exact match on last name; City and ZIP do not match
(all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Street number and ZIP code
are missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Close match to street name;
city and state do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Close match to street name;
state and ZIP code do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; City and state do not match
(all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Partial match to street
name; city and state do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; State and ZIP code do not
match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Street number and state are
missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Street number and state are
missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Street number and city are
missing or do not match (all other fields match)
Low Confidence
Partial Match
Partial match on first name, exact match on last name; Street number and street
name match only (no other fields match)
Low Confidence
Partial Match
Address Verification (Level 1) Result Codes
Definition Match
Summary
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 101
A4 C4 D4 E4 F4 G3 G4 G9 Code GD GI GL GN GO GP GQ GS GT GW H4 I4 J4 Exact match on first and last name; Different Street number and different street name (all
other fields match)
No Match /
With Detail
Misspelling of either first OR last name; Different Street number and different street name
(all other fields match)
No Match /
With Detail
Misspelling of first AND last name; Different Street number and different street name (all
other fields match)
No Match /
With Detail
First initial match, exact match on last name; Different Street number and different street
name (all other fields match)
No Match /
With Detail
First initial match, last name misspelled; Different Street number and different street
name (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; No match to street
name (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Different Street
number and different street name (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; City and ZIP do not
match (all other fields match)
No Match /
With Detail
Address Verification (Level 1) Result Codes (CONT’D)
Definition Match
Summary
First name does not match or is missing, exact match on last name; Street number and
ZIP code are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Close match to street
name; city and state do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Close match to street
name; state and ZIP code do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; City and state do not
match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Partial match to
street name; city and state do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; State and ZIP code
do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Street number and
ZIP code are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Partial match to
street name; state and ZIP code do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Street number and
city are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, exact match on last name; Street number and
street name match only (no other fields match)
No Match /
With Detail
Exact match on first name, last name matches one of hyphenated last names; Different
Street number and different street name (all other fields match)
No Match /
With Detail
First name misspelled, last name matches one of hyphenated last names; Different Street
number and different street name (all other fields match)
No Match /
With Detail
First initial match, last name matches one of hyphenated last names; Different Street
number and different street name (all other fields match)
No Match /
With Detail
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 102
L3 L4 L6 L9 LA LD LE LI Code LL LN LO LP LQ LS LT LW M3 M4 M9 MD MI First name does not match or is missing, close match on last name; No match to street
name (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Different Street
number and different street name (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; No match to street
number (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; City and ZIP do not
match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Street number does
not match or is missing, close match to street name (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Street number and
ZIP code are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Street number does
not match or is missing and partial match to street name(all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Close match to street
name; city and state do not match (all other fields match)
No Match /
With Detail
Address Verification (Level 1) Result Codes (CONT’D)
Definition Match
Summary
First name does not match or is missing, close match on last name; Close match to street
name; state and ZIP code do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; City and state do not
match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Partial match to street
name; city and state do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; State and ZIP code do
not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Street number and
state are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Partial match to street
name; state and ZIP code do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Street number and
city are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, close match on last name; Street number and
street name match only (no other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; No match to street name (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Different Street number and different street name (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; City and ZIP do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Street number and ZIP code are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Exact match on address
No Match /
With Detail
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 103
ML
MN MO MP MQ MS
MT MW Code O4 P4 Q4 R4 Code X0 ZZ Code EU
MU
First name does not match or is missing, last name matches on one of hyphenated last
names; Close match to street name; state and ZIP code do not match (all other fields
match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; City and state do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Partial match to street name; city and state do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
name; State and ZIP code do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Street number and state are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Partial match to street name; state and ZIP code do not match (all other fields
match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Street number and city are missing or do not match (all other fields match)
No Match /
With Detail
First name does not match or is missing, last name matches on one of hyphenated last
names; Street number and street name match only (no other fields match)
No Match /
With Detail
Address Verification (Level 1) Result Codes (CONT’D)
Definition Match
Summary
Partial match on first name, close match on last name; Different Street number and
different street name (all other fields match)
No Match /
With Detail
Partial match on first name, last name matches on one of hyphenated last names;
Different Street number and different street name (all other fields match)
No Match /
With Detail
First name matches last, last name matches first (exact matches only);Different Street
number and different street name (all other fields match)
No Match /
With Detail
Partial match on first name, exact match on last name; Different Street number and
different street name (all other fields match)
No Match /
With Detail
Address Verification (Level 0) Result Codes
Definition Match Summary
No match on name; No match on address No Match / No Detail
Invalid/No match – Legacy No Match / No Detail
Address Unit Mismatch Result Codes
Definition Explanation Match Summary
Unit number is extra -
Not expected at this
address
Database does not show an apartment or unit number
needed at this address. N/A
Unit number is missing -
Unit number expected at
this address
Database shows an apartment/unit number at this
address.
No match for unit
number
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 104
WU
Unit number is wrong -
Unit number does not
match unit number at
this address
Database shows a different apartment/unit number. No match for unit
number
Phone Mismatch Result Codes
Code Definition Explanation Match Summary
EU
Unit number is extra -
Not expected at the
address for this phone
Database does not show an apartment or unit number
needed at the address for this phone. N/A
MU
Unit number missing -
expected for the
address for this phone
Database shows an apartment/unit number at the
address for this phone.
No match for unit
number.
WU
Unit number wrong -
Unit number does not
match unit number for
this address at this
phone
Database shows a different apartment/unit number for
this address for this phone.
No match for unit
number
Change Of Address Result Codes
Code Definition Explanation Match Summary
NA Test not in profile C Change of Address
Information Found
N No Change of Address
Information Found Data not available NP A change of address was found using elements of the
name and address.
Match to change of
address file.
No change of address was found. No match to change
of address file.
Code not utilized. N/A
Not returned.
U Test not available Search was not available. Match not
performed.
Address Type Result Codes
Code Definition Explanation
C Single – Company
address Business address.
EB Business address Address classified as seasonal and in business file.
EM Residential address Address classified as seasonal.
EX Mixed-use address Address classified as seasonal and in both business and residential files.
M Residential address N No information available NA Data not available PO Box.
Residential address.
Address type not available.
Code not utilized.
O Office building address Business complex.
P Post office box address BlueAssure Platform Integration Documentation | Appendix A: Response Codes 105
S Residential address Residential address.
SE Residential address Address classified as seasonal.
V Vacant – Unknown type Address is vacant.
VB Vacant – Business
address Business address is vacant.
VM Vacant – Residential
address Residential address is vacant.
VS Vacant – Residential
address Residential address is vacant.
VX Vacant – Mixed-use
address Vacant address in both business and residential files.
X Mixed use address Address in both business and residential files.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 106
Address High Risk Result Codes
Code Definition Explanation Match Summary
N No address high risk
information found
No match to high
risk business.
YA
A high risk business
was identified at this
address
Address matched a business with an SIC code flagged
as high risk.
Match to high risk
business.
Driver's License Result Codes
Code Definition Explanation Match Summary
A Match to address only DL matches address only Match
I DL state and number
format invalid DL information invalid for state
Validation failed,
match not
performed
M
Driver License number
not submitted on
inquiry
DL number not supplied on input Match not
performed
N No match to name or
address DL does not match the supplied name or address. No match
NA Data not available for
this state Used on business searches only. N/A
NI Input DL state and
number not on file DL number not found on file for verification Match not
performed
S Match to surname only DL matches last name only Match
SA Match to surname and
address DL matches last name and address Match
V
Valid DL state and
number - Name match
not available
DL number valid and on file, but no record as to
consumer.
Match not
performed
Y Match to full name only DL matches full name Match
YA Match to full name and
address
Input DL matches to File DL and matches full name
and address Match
YB Match to full name and
address
No DL input, match performed using name and
address Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 107
Code EA EB EC ED EE EF EG EH Code EI CA EJ EL EN EO EP CB CC PA CD CE CF CG CH PB PC PD PE PF PG PH Phone Verification (Level 5) Result Codes
Definition Match Summary
Exact match to Phone, Exact match to Name, Exact match to Address Exact Match
Exact match to Phone, Exact match to Name, Close match to Address Exact Match
Exact match to Phone, Close match to Name, Exact match to Address Exact Match
Exact match to Phone, Exact match to Name, Partial match to Address Exact Match
Exact match to Phone, Exact match to Name, Low confidence match to Address Exact Match
Exact match to Phone, Exact match to Name, No match to Address Exact Match
Exact match to Phone, Exact match to Name, Address missing Exact Match
Exact match to Phone, Close match to Name, Close match to Address Exact Match
Phone Verification (Level 4) Result Codes
Definition Match Summary
Exact match to Phone, Partial match to Name, Exact match to Address Close Match
Close match to Phone, Exact match to Name, Exact match to Address Close Match
Exact match to Phone, Close match to Name, Partial match to Address Close Match
Exact match to Phone, Name missing, Exact match to Address Close Match
Exact match to Phone, Close match to Name, Low confidence match to Address Close Match
Exact match to Phone, Close match to Name, No match to Address Close Match
Exact match to Phone, Close match to Name, Address missing Close Match
Close match to Phone, Exact match to Name, Close match to Address Close Match
Close match to Phone, Close match to Name, Exact match to Address Close Match
Partial match to Phone, Exact match to Name, Exact match to Address Close Match
Close match to Phone, Exact match to Name, Partial match to Address Close Match
Close match to Phone, Exact match to Name, Low confidence match to Address Close Match
Close match to Phone, Exact match to Name, No match to Address Close Match
Close match to Phone, Exact match to Name, Address missing Close Match
Close match to Phone, Close match to Name, Close match to Address Close Match
Partial match to Phone, Exact match to Name, Close match to Address Close Match
Partial match to Phone, Close match to Name, Exact match to Address Close Match
Partial match to Phone, Exact match to Name, Partial match to Address Close Match
Partial match to Phone, Exact match to Name, Low confidence match to Address Close Match
Partial match to Phone, Exact match to Name, No match to Address Close Match
Partial match to Phone, Exact match to Name, Address missing Close Match
Partial match to Phone, Close match to Name, Close match to Address Close Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 108
Phone Verification (Level 3) Result Codes
Code Definition Match Summary
EK Exact match to Phone, No match to Name, Exact match to Address Partial Match
EM Exact match to Phone, Partial match to Name, Close match to Address Partial Match
ER Exact match to Phone, Partial match to Name, Partial match to Address Partial Match
ES Exact match to Phone, Name missing, Close match to Address Partial Match
ET Exact match to Phone, Partial match to Name, Low confidence match to Address Partial Match
EV Exact match to Phone, Partial match to Name, Address missing Partial Match
CI Close match to Phone, Partial match to Name, Exact match to Address Partial Match
CJ Close match to Phone, Close match to Name, Partial match to Address Partial Match
CL Close match to Phone, Name missing, Exact match to Address Partial Match
CN Close match to Phone, Close match to Name, Low confidence match to Address Partial Match
CO Close match to Phone, Close match to Name, No match to Address Partial Match
CP Close match to Phone, Close match to Name, Address missing Partial Match
PI Partial match to Phone, Partial match to Name, Exact match to Address Partial Match
PJ Partial match to Phone, Close match to Name, Partial match to Address Partial Match
PL Partial match to Phone, Name missing, Exact match to Address Partial Match
PN Partial match to Phone, Close match to Name, Low confidence match to Address Partial Match
PO Partial match to Phone, Close match to Name, No match to Address Partial Match
PP Partial match to Phone, Close match to Name, Address missing Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 109
Phone Verification (Level 2) Result Codes
Code Definition Match Summary
EQ Exact match to Phone, No match to Name, Close match to Address Low Confidence
Partial Match
EU Exact match to Phone, Partial match to Name, No match to Address Low Confidence
Partial Match
EW Exact match to Phone, No match to Name, Partial match to Address Low Confidence
Partial Match
EX Exact match to Phone, Name missing, Partial match to Address Low Confidence
Partial Match
CK Close match to Phone, No match to Name, Exact match to Address Low Confidence
Partial Match
CM Close match to Phone, Partial match to Name, Close match to Address Low Confidence
Partial Match
CR Close match to Phone, Partial match to Name, Partial match to Address Low Confidence
Partial Match
CS Close match to Phone, Name missing, Close match to Address Low Confidence
Partial Match
CT Close match to Phone, Partial match to Name, Low confidence match to Address Low Confidence
Partial Match
PK Partial match to Phone, No match to Name, Exact match to Address Low Confidence
Partial Match
CV Close match to Phone, Partial match to Name, Address missing Low Confidence
Partial Match
PM Partial match to Phone, Partial match to Name, Close match to Address Low Confidence
Partial Match
PR Partial match to Phone, Partial match to Name, Partial match to Address Low Confidence
Partial Match
PS Partial match to Phone, Name missing, Close match to Address Low Confidence
Partial Match
PT Partial match to Phone, Partial match to Name, Low confidence match to Address Low Confidence
Partial Match
PV Partial match to Phone, Partial match to Name, Address missing Low Confidence
Partial Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 110
Code EY EZ E4 E5 E6 E7 CQ CU CW CX CY CZ C4 C5 C6 C7 PQ PU PW PX PY PZ P4 P5 P6 P7 MX Code NX Phone Verification (Level 1) Result Codes
Definition Match Summary
Exact match to Phone, No match to Name, Low confidence match to Address No Match With Detail
Exact match to Phone, No match to Name, No match to Address No Match With Detail
Exact match to Phone, No match to Name, Address missing No Match With Detail
Exact match to Phone, Name missing, Low confidence match to Address No Match With Detail
Exact match to Phone, Name missing, No match to Address No Match With Detail
Exact match to Phone, Name missing, Address missing No Match With Detail
Close match to Phone, No match to Name, Close match to Address No Match With Detail
Close match to Phone, Partial match to Name, No match to Address No Match With Detail
Close match to Phone, No match to Name, Partial match to Address No Match With Detail
Close match to Phone, Name missing, Partial match to Address No Match With Detail
Close match to Phone, No match to Name, Low confidence match to Address No Match With Detail
Close match to Phone, No match to Name, No match to Address No Match With Detail
Close match to Phone, No match to Name, Address missing No Match With Detail
Close match to Phone, Name missing, Low confidence match to Address No Match With Detail
Close match to Phone, Name missing, No match to Address No Match With Detail
Close match to Phone, Name missing, Address missing No Match With Detail
Partial match to Phone, No match to Name, Close match to Address No Match With Detail
Partial match to Phone, Partial match to Name, No match to Address No Match With Detail
Partial match to Phone, No match to Name, Partial match to Address No Match With Detail
Partial match to Phone, Name missing, Partial match to Address No Match With Detail
Partial match to Phone, No match to Name, Low confidence match to Address No Match With Detail
Partial match to Phone, No match to Name, No match to Address No Match With Detail
Partial match to Phone, No match to Name, Address missing No Match With Detail
Partial match to Phone, Name missing, Low confidence match to Address No Match With Detail
Partial match to Phone, Name missing, No match to Address No Match With Detail
Partial match to Phone, Name missing, Address missing No Match With Detail
Phone number is missing No Match With Detail
Phone Verification (Level 0) Result Codes
Definition Match Summary
No Match No Match / No Detail
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 111
Caller Type Result Codes
Code Definition Explanation Match Summary
C Consumer Phone matched to a consumer number. Match found
B Business Phone matched to a business number. Match found
U Unavailable The type of caller could not be determined. Match not found
Phone High Risk Result Codes
Code Definition Explanation Match Summary
N No phone high risk
information found
No match to high
risk business
YP
A high-risk business
was identified for this
address at this phone
Phone matched a business with an SIC code flagged
as high risk.
Match to high risk
business
Phone Type Result Codes
Code Definition Explanation Match Summary
M Mobile Phone matched to a mobile number. Mobile match
L Landline Phone matched to a landline number. Landline match
V VOIP Phone matched to a voice over IP number VOIP match
U Unknown Unable to determine the type of phone number No match
Phone Verification Delivery Type Result Codes
Code Definition Explanation
TM Text Message Verification code was delivered via text message.
VC Voice Call Verification code was delivered via voice call using text-to-speech.
N Not Sent A verification code was not sent.
SSN Format Validation Result Codes
Code Definition Explanation Match Summary
I Invalid format SSN – invalid format per SSA. No match format
V Valid format SSN – valid format per SSA Match format
Driver's License Format Validation Result Codes
Code Definition Explanation Match Summary
I Invalid format DL – invalid format for state. No match format
V Valid format DL – valid format of number for state. Match format
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 112
SSN Issue Result Codes
Code Definition Explanation Match Summary
C SSN issue date cannot be
verified
SSN issue date cannot be verified due to SSN random
assignment of SSNs by the SSA. No match issued file
I SSN issued SSN has beginning and ending issue dates. Match issued file
N SSN not issued SSN not opened for issue. No match issued file
P SSN opened for issue per
SSA SSN has beginning issue date, still open. Match issued file
X SSN issued date is prior to
input Year of Birth
SSN has beginning and ending issue dates, however was
issued before year of birth.
Match issued file,
cautious
Y SSN issued date is prior to
onfile Year of Birth
SSN has beginning and ending issue dates, however was
issued before year of birth.
Match issued file,
cautious
Z
SSN issued date is prior to
input Year of Birth and
onfile Yeah of Birth
SSN has beginning and ending issue dates, however was
issued before year of birth.
Match issued file,
cautious
SSN Deceased Result Codes
Code Definition Explanation Match Summary
Y
Hit to the deathmaster -
SSA reports death benefits
are being paid on the SSN
Deceased. Match deceased
N No hit to the deathmaster Not deceased. No match deceased
Consumer ID (SSN) Result Codes
Code Definition Explanation Match Summary
A Match to address only
(using SSN)
SSN matches to address only Match
D Deceased - Unable to
verify name SSN reported as deceased. Match not performed
DN Deceased - No match to
name
SSN reported as deceased and is associated with a different
consumer.
No match and
deceased
DS Deceased - Match to
surname SSN reported as deceased with the same surname. Match but deceased
DY Deceased - Match to full
name
SSN reported as deceased with the same first and last
name.
Match but deceased
F SSN format is invalid SSN format not valid per SSA. Validation failed,
match not performed.
FF SSN Finder Match to first
name and address
SSN matches to first name and address only– match
performed using SSN Finder Match
FY SSN Finder Match to full
name and address
Match to full name and address – match performed using
SSN Finder. Match
I SSN is incorrect length SSN not 9 digits or 4 digits. Validation failed,
match not performed
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 113
Consumer ID (SSN) Result Codes (CONT'D)
Code Definition Explanation Match Summary
M
SSN is missing; no match
found using name/address
search
SSN not supplied on search request. Header file searched
by name/address and no match was found. No match
N No match to name or address
using SSN search SSN does not match the supplied name or address. No match
NI SSN not issued SSN not opened for issue per SSA. Validation failed,
match not performed
NA Data not available No information available. Match not performed
P Match to previous address
only SSN matches previous address only. Match
SA Match to surname and
address (using SSN) SSN matches to last name and address only. Match
V Valid SSN - Name match not
available.
SSN is valid and issued, not deceased. No name match is
available. Match not performed
Y Match to full name only
(using SSN) SSN matches to first name and last name only. Match
YA
Match to full name
and address -
Match performed using SSN
Match to full name and address. Match
YB
Match to full name and
address - Match performed
using name and address
Used only when SSN not supplied on inquiry. Input name
and address match file name and address.
Match
PY Match to full name and
previous address.
SSN Matches to first name, last name, and a previous
address. Match
SP Match to surname and
previous address SSN Matches to last name and a previous address. Match
S Match to surname only SSN Matches to last name only. Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 114
Date of Birth Result Codes
Code Definition Explanation Match Summary
1 Match Full DOB available and matched input (within 1 year
plus/minus if month/day exact). Match
2 Partial match YOB only matches (within 1 year plus/minus). Match
3 No match Input DOB does not match on file DOB. No match
4 Not on file DOB or YOB information not available for this consumer
(consumer is on file). Match not performed
5 SSN not on file; search cannot
be done Consumer not on file – no record. Match not performed
6 DOB not provided on inquiry DOB not on input. Match not performed
7 Invalid date format Date format is invalid. Match not performed
8 Year only exact match YOB only exact matches (no plus/minus 1 year
allowance) Match
9 Day, month, and year exact
match
Full DOB available and exact matched input (no
plus/minus 1 year allowance) Match
A Month exact match, year
match +/- 1 year MOB exact match, YOB match (within 1 year plus/minus) Match
B Month and year exact match MOB and YOB exact match (no plus/minus 1 year
allowance) Match
C
Day of Birth and Month of Birth
exact match, Year of Birth +/- 10
years exactly
Day of Birth and Month of Birth exact match,
Year of Birth +/- 10 years exactly Match
D
Month of Birth exact match,
Year of Birth +/- 10 years
exactly
Month of Birth exact match, Year of Birth +/- 10
years exactly Match
E Day & month exact match,
year not match Day, MOB exact match, YOB no match Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 115
Fraud Shield Results
Each fraud shield returns either ‘Y’ indicating the fraud shield was triggered or ‘N’ if the fraud shield was
not triggered. The table below defines the triggered state of each fraud shield.
Fraud Shield Description
Fraud Shield 01 Inquiry/Online current address conflict
Fraud Shield 02 Inquiry address first reported < 90 days
Fraud Shield 03 Inquiry current address not on-file
Fraud Shield 04 Input SSN issue date cannot be verified
Fraud Shield 05 Input SSN recorded as deceased
Fraud Shield 06 Inquiry age younger than SSN issue date
Fraud Shield 07 Credit established before age 18
Fraud Shield 08 Credit established prior to SSN issue date
Fraud Shield 09 More than 3 inquires in last 30 days
Fraud Shield 10 Type of high risk address
Fraud Shield 11 Non-residential address
Fraud Shield 13 High probability SSN belongs to another person
Fraud Shield 14 Input SSN invalid
Fraud Shield 15 Address reported cautious
Fraud Shield 16 Type of high risk address
Fraud Shield 17 Non-residential address
Fraud Shield 18 Reported cautious
Fraud Shield 19 Current address reported by new trade only
Fraud Shield 20 Current address reported by trade open <90 days
Fraud Shield 21 Telephone number inconsistent with address
Fraud Shield 25 Best on-file SSN recorded as deceased
Fraud Shield 26 Best on-file SSN issue data cannot be verified
Fraud Shield 27 SSN Reported more frequently for another person
Exclusion Conditions
Code Summary Description
9001 Consumer reported as
deceased The consumer is reported as deceased.
9012 Consumer/Victim
Statement on-file
A Consumer/Victim Statement has been placed on the
consumer’s credit file.
9013 Blocked or Frozen credit
file The consumer’s credit file has been blocked or frozen.
9017 Consumer is a Nevada
resident The consumer is a resident of the state of Nevada.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 116
Shared Application Result Codes
Code Summary Description
1004 Non-Residential Current
Address The home address provided in the current application is a business address.
1005 Current Address is High-
Risk
The home address provided in the current application is a business address having
potential for fraudulent activity.
1006
Fraud Shield Cautious
Address Found – Incoming
Address
Fraud had been perpetrated at the address provided in the current application.
1007
Fraud Shield Cautious
Address Found – On File
Address
Fraud has been perpetrated at one of the addresses associated with the current
application’s Credit Profile.
1008 High Risk Address On File One of the addresses in the current application’s Credit Profile is a business
address having a potential for fraudulent activity.
1009 Non-Residential Address
On File One of the addresses in the current application’s Credit Profile is a business.
1010 Incoming Address First
Reported Within 90 Days
The current address provided in the current application was first reported within the
last 90 days.
1201
Combined Time at
Address Exceeds
Applicant’s Age
The time at all addresses provided in the current application is greater than the
applicant’s age provided in the current application.
1402 / 1452 Adjusted Time at Current
Address Mismatched
The incoming application shows that the applicant has lived in the current address
longer than the time implied by a past application (6 – 120 month tolerance allowed
based on length of time).
1403 / 1453 Previous Address
Mismatched
The incoming application omits a previous address that is present on a past
application.
1404 / 1454 Time at Previous Address
Mismatched
The incoming application shows that the applicant has lived in the previous
address longer than the time implied by a past application (6 – 120 month
tolerance allowed based on length of time).
1406 / 1456 Accommodation Type
Mismatched
The current address provided in the current application is equal to the matched
application current address AND the current application accommodation type is
unequal to the matched application accommodation type (owns, rents, lives with
parents, others).
1413 / 1463 Impersonation – Time at
Current Address
The incoming application shows that the applicant has lived in the current address
for a shorter period than the time implied by a past application (6 – 120 month
tolerance allowed based on length of time).
1414 / 1464 Impersonation – Time at
Previous Address
The incoming application shows that the applicant has lived in the previous
address for a shorter period than the time implied by a past application (6 – 120
month tolerance allowed based on length of time).
1417 / 1467 Historic Address
Identified
The current address provided in the current application is not equal to the matched
application current address AND the current application previous address is not
equal to the matched application previous address.
OR
The current address provided in the current application is not equal to the matched
application current address AND the matched application contains a previous
address, which the current application omits.
1423/1473 Inconsistent Time at
Address Cross Check
The incoming application contains a previous address that is equal to the current
address of a past matched application, but the time at that address is not
consistent with what is implied in the past application (6 – 120 month tolerance
allowed based on length of time).
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 117
Shared Application Result Codes (CONT’D)
Code Summary Description
1424 / 1474 Inconsistent Move Date
The incoming application contains a previous address that is equal to the current
address of a past matched application, but the implied move date to that address is
not consistent with the implied move date in the past application (6 – 120 month
tolerance allowed based on length of time).
1602 Adjusted Time at
Current Address
The incoming application shows that the applicant has lived in the current address
longer than the time implied by a past application (6 – 20 month tolerance allowed
based on length of time).
1603 Previous Address
Mismatched
The incoming application omits a previous address that is present on a past
application.
1604 Time at Previous
Address Mismatched
The incoming application shows that the applicant has lived in the previous
address longer than the time implied by a past application (6 – 120 month
tolerance allowed based on length of time).
1606 Accommodation Type
Mismatched
The current address provided in the current application is equal to the matched
application current address AND the current application accommodation type is
unequal to the matched application accommodation type (owns, rents, lives with
parents, others).
1613 Impersonation – Time at
Current Address
The incoming application shows that the applicant has lived in the current address
for a shorter period than the time implied by a past application (6 – 120 month
tolerance allowed based on length of time).
1614 Impersonation – Time at
Previous Address
The incoming application shows that the applicant has lived in the previous
address for a shorter period than the time implied by a past application (6 – 120
month tolerance allowed based on length of time).
1617 Historic Address
Identified
The current address provided in the current application is not equal to the matched
application current address AND the current application previous address is not
equal to the matched application previous address.
OR
The current address provided in the current application is not equal to the matched
application current address AND the matched application contains a previous
address, which the current application omits.
1623 Inconsistent Time at
Address Cross Check
The incoming application contains a previous address that is equal to the current
address of a past matched application, but the time at that
address is not consistent with what is implied in the past application (6 – 120
month tolerance allowed based on length of time).
1624 Inconsistent Move
Date
The incoming application contains a previous address that is equal to the current
address of a past matched application, but the implied move date to that address is
not consistent with the implied move date in the past application (6 – 120 month
tolerance allowed based on length of time).
2801 / 2851 Same Address
Connection
The current address provided in the current application is equal to the connected
application current address AND the current application applicant name is not
equal to the connected application applicant name.
3201
Incoming Application
Omits Best Address on
File
The “best address” per the Credit Profile is not present on the current application.
3202
Incoming Previous
Address is Best Address
On File
The “best address” per the Credit Profile is equal to the previous address on the
current application.
3203 No Trace of Address The current address provided in the current application does not match an address
On file has for this applicant.
3204
Best address on credit
profile does not match the
current address specified
on inquiry
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 118
Shared Application Result Codes (CONT’D)
Code Summary Description
3401 Additional Addresses
(0 – 1)
Any of the three Credit Profile addresses are missing from the current application
and the Credit Profile address was 1st reported less than 1 year ago.
3402 Additional Addresses
(1 – 2)
Any of the three Credit Profile addresses are missing from the current application
and the Credit Profile address was 1st reported between 1 and 2 years ago.
3403 Additional Addresses
(2 – 3)
Any of the three Credit Profile addresses are missing from the current application
and the Credit Profile address was 1st reported between 2 and 3 years ago.
3404 Additional Addresses
(3 – 4)
Any of the three Credit Profile addresses are missing from the current application
and the Credit Profile address was 1st reported between 3 and 4 years ago.
3405 Additional Addresses
(4 – 5)
Any of the three Credit Profile addresses are missing from the current application
and the Credit Profile address was 1st reported between 4 and 5 years ago.
3406 Additional Addresses
(5 – 6)
Any of the three Credit Profiles addresses are missing from the current application
and the Credit Profile address was 1st reported between 5 and 6 years ago.
1001 Home Telephone Number
Conflicts with Zip Code
The home telephone number provided in the current application does not correlate
to the current address provided in the current application.
1203 Home Telephone
Number is Invalid
The home telephone provided in the current application had an invalid exchange
and area code combination.
1204 Home Telephone Number
is Cellular or other Special
The home telephone number provided in the current application is a cellular
number or defined as special.
1207 Self-Employed with no
Home Telephone
The current application states the applicant is self employed but does not include a
home telephone number.
1208
Not Self-Employed but
Same Home and Work
Telephone
The current application states the applicant is not self employed but the home and
work number on the current application is the same.
1209 Work Telephone Number
is Unused or Reserved
The work telephone number provided in the current application is reported as
expired or is not yet connected for use.
1407 / 1457 Home Telephone
Number Mismatched
The current address provided in the current application is equal to the matched
application current address AND the current application home telephone number is
not ‘special’ AND does not equal the matched application updated home telephone
number.
1410 / 1460 Work Telephone
Number Mismatched
The work telephone number provided in the current application is not
‘special’ AND it is not equal to the matched application updated work telephone
number.
1607 Home Telephone
Number Mismatched
The current address provided in the current application is equal to the matched
application current address AND the current application home telephone number is
not ‘special’ AND does not equal the matched application updated home telephone
number.
1610 Work Telephone
Number Mismatched
The work telephone number provided in the current application is not
‘special’ AND it is not equal to the matched application updated work telephone
number.
1801 / 1851 Same Person Home
Telephone Connection
The home telephone number from the incoming application is equal to a past
application’s update home telephone number where the past application is for the
same person as the incoming application
AND
The current and previous address provided in the current application is not equal to
the connected application current address.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 119
Shared Application Result Codes (CONT’D)
Code Summary Description
1802 / 1852 Other Person Home
Telephone Connection
The home telephone number from the incoming application is equal to a past
application’s update home telephone number where the past application is for a
different person as the incoming application
AND
The current and previous address provided in the current application is not equal to
the connected application current address.
1803 / 1853
Multiple Same Person
Home Telephone
Connections
This rule will trigger if Rule 1801/1851: Same Person Home Telephone
Connection is triggered by more than one connected application.
1804 / 1854
Multiple Other Person
Home Telephone
Connections
This rule will trigger if Rule 1802/1852: Other Person Home Telephone
Connection is triggered by more than one connected application.
2201 / 2251 Same Person Work
Telephone Connection
The applicant name and work telephone number provided in the current application
is equal to the connected application applicant name and updated work telephone
number
AND
The current and previous address provided in the current application is not equal to
the connected application current address.
2202 / 2252 Other Person Work
Telephone Connection
The work telephone number provided in the current application is equal to the
connected application updated work telephone number
AND
The applicant name in the current application is not equal to the connected
application applicant name AND the current and previous address provided in the
current application is not equal to the connected application current address.
2203 / 2253
Multiple Same Person
Work Telephone
Connections
This rule will trigger if Rule 2201/2251: Same Person Work Telephone
Connection is triggered by more than one connected application.
2204 / 2254
Multiple Other Person
Work Telephone
Connections
This rule will trigger if Rule 2202/2252: Other Person Work Telephone
Connection is triggered by more than one connected application.
2205 / 2255
Other Person Work Phone
Connection w/ Same
Address
The current address and work telephone number provided in the current
application is equal to the connected application current address and updated work
telephone number
AND
The applicant name in the current application is not equal to the connected
application applicant name.
3006 Telephone Number(s)
not On File
3007 Home Telephone
Number Conflict
The home telephone number provided in the current application is not equal to any
of the consumer's home telephone number(s) on the Credit Profile, as updated for
area code splits.
3008 Shared Home
Telephone Number
The number of other consumers who share the same home telephone number on
the Consumer Master database is greater than 4.
1013 Driver’s License
Number Conflict
The driver’s license number provided in the current application is not equal to the
driver’s license number on file.
1213 Driver’s License from
Previous State
The incoming application shows that the applicant has moved to a new state and
has been living there for at least 9 months but kept his old state's driver's license.
1421 / 1471 Driver’s License Mismatch
– Same State
The driver’s license state provided in the current application is equal to the driver’s
license state provided in the matched application AND the current application
driver’s license number is not equal to the matched application driver’s license
number. (Allow one single-digit error or one transposition of adjacent digits.)
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 120
Shared Application Result Codes (CONT’D)
Code Summary Description
1422 / 1472 Driver’s License Mismatch
– Different State
The driver’s license state provided in the current application is not equal to the
driver’s license state provided in the matched application AND
the current application driver’s license number is not equal to the matched
application driver’s license number. (Allow one single-digit
error or one transposition of adjacent digits.) AND the elapsed time
between current and matched applications is under 90 days.
OR
The driver’s license state provided in the current application is not equal to the
driver’s license state provided in the matched application AND
the current application driver’s license number is not equal to the matched
application driver’s license number. (Allow one single-digit
error or one transposition of adjacent digits.) AND the current
application current address is equal to the matched application current address.
1621 Driver’s License Mismatch
– Same State
The driver’s license state provided in the current application is equal to the driver’s
license state provided in the matched application AND the current application
driver’s license number is not equal to the matched application driver’s license
number. (Allow one single-digit error or one transposition of adjacent digits.)
1622 Driver’s License Mismatch
– Different State
The driver’s license state provided in the current application is not equal to the
driver’s license state provided in the matched application AND
the current application driver’s license number is not equal to the matched
application driver’s license number. (Allow one single-digit
error or one transposition of adjacent digits.) AND the elapsed time between
current and matched applications is under 90 days.
OR
The driver’s license state provided in the current application is not equal to the
driver’s license state provided in the matched application AND
the current application driver’s license number is not equal to the matched
application driver’s license number. (Allow one single-digit error or one
transposition of adjacent digits.) AND the current application current address is
equal to the matched application current address.
2601 / 2651
Same Person Driver’s
License Number
Connection
The DL number and DL state provided in the current application is equal to the
connected application DL number and DL state. (DL number exact match)
AND
The current and previous address provided in the current application is not equal to
the connected application current address.
AND
The applicant name in the current application is equal to the connected application
applicant name.
2602 / 2652
Other Person Driver’s
License Number
Connection
The DL number and DL state provided in the current application is equal to the
connected application DL number and DL state. (DL number exact match)
AND
The current and previous address provided in the current application is not equal to
the connected application current address.
AND
The applicant name in the current application is not equal to the connected
application applicant name.
2603 / 2653 Multiple Same Person DL
Number Connections
This rule will trigger if Rule 2601/2651: Same Person DL Number
Connection is triggered by more than one connected application.
2604 / 2654 Multiple Other Person DL
Number Connections
This rule will trigger if Rule 2602/2652: Other Person DL Number
Connection is triggered by more than one connected application.
1002 Invalid or Non-issued
Social Security Number
The social security number (SSN) provided in the current application
has not been issued by the Social Security Administration (SSA) OR the
SSN is not a valid number as reported by the SSA.
1003 Social Security Number
Issued before Year of Birth
The social security number provided in the current application has an issue date
that is less than the age of the applicant provided in the current application.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 121
Shared Application Result Codes (CONT’D)
Code Summary Description
1012 High Probability SSN
Belongs to Another
The social security number provided in the current application is more closely
associated with another consumer.
1014 Retired Social
Security Number SSA reports that death benefits are being paid on the SSN
1015 Non-issued SSN
1016 Best on-file SSN is retired
1017 Best on-file SSN is not
issued
1018
SSN specified on inquiry
has been reported more
frequently for another
1420 / 1470 Social Security
Number Mismatch
The social security number provided in the current application is not equal to the
matched application social security number.
1620 Social Security
Number Mismatch
The social security number provided in the current application is not equal to the
matched application social security number.
2401 / 2451
Same Person Social
Security Number
Connection
The applicant name and social security number provided in the current application
is equal to the connected application applicant name and updated social security
number (exact match)
AND
The current and previous address provided in the current application is not equal to
the connected application current address.
2402 / 2452
Other Person Social
Security Number
Connection
The social security number provided in the current application is equal to the
connected application social security number (exact match)
AND
The applicant name in the current application is not equal to the connected
application applicant name AND the current and previous address provided in the
current application is not equal to the connected application current address.
2403 / 2453 Multiple Same Person
SSN Connections
This rule will trigger if Rule 2401/2451: Same Person SSN Connection is triggered
by more than one connected application.
2404 / 2454 Multiple Other Person
SSN Connections
This rule will trigger if Rule 2402/2452: Other Person SSN Connection is triggered
by more than one connected application.
1401 / 1451 Date of Birth
Mismatched
The current application date of birth is less than the matched application date of
birth. (within a specified tolerance)
1412 / 1462 Impersonation – Age The applicant date of birth provided in the current application is greater than the
date of birth provided on the matched application.
1601 Date of Birth
Mismatched
The current application date of birth is earlier than the matched application date of
birth. (within a specified tolerance)
1612 Impersonation – Age The applicant date of birth provided in the current application is greater than the
date of birth provided on the matched application.
3002 Impersonation of
Applicant under Age 18
The current application and Credit Profile contain date of birth AND the
Credit Profile Date of Birth implies that the applicant is under age 18
AND the current application date of birth is not equal to the Credit
Profile’s Date of Birth. OR
The current application and/or Credit Profile contain only year of birth AND the
Credit Profile date of Birth implies that the applicant is under age 18 (Infer “January
1” if the Credit Profile contains only the year of birth.) AND the current application
year of birth is not equal to the Credit Profile’s year of birth.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 122
Shared Application Result Codes (CONT’D)
Code Summary Description
3003 Inconsistent Date of
Birth on File
The current application and Credit Profile contain date of birth AND the current
application date of birth is less than the Credit Profile date of birth.
OR
The current application and/or Credit Profile contain only year of birth AND the
current application year of birth is less than the Credit Profile year of birth.
3004 Impersonation – Age
The current application and Credit Profile contain date of birth AND the current
application date of birth is greater than the Credit Profile date of birth.
OR
The current application and/or Credit Profile contain only year of birth AND the
current application year of birth is greater than the Credit Profile year of birth.
1427 / 1477 Under 18 at Time of
Matched Application The age on the matched application is less than 18.
1627 Under 18 at Time of
Matched Application The age on the matched application is less than 18.
3001 Consumer Not Found This rule will trigger if the applicant cannot be identified such that a Credit Profile
cannot be generated.
3005 Consumer Statement on
File
The Credit Profile contains a free form consumer statement other than a victim
statement.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 123
Email Verification Result Codes
Code Summary Description
T1 Match found Match to Name associated with Email in repository
T2 Match found Exact input Name to Username match
T3 Match found Strong Input Name to Username Match
T4 Match found Partial Input Name to Username Match
T5 No match found Username to Name Mismatch or email linked to different Name in repository
T6 No match performed Email failed validation or no input name
Email Validation Result Codes
Code Summary Description
I Invalid Email address is not valid
N No match performed No input or cannot be validated
V Match found Possible valid email address
Email Reason Result Codes
Code Summary Description
D Domain Validation Failure Domain Validation Failure – an MX record could not be located for the registered
domain
N No Failure Identified No Failure Identified – the email had proper syntax and domain
S Syntax Validation Failure Syntax Validation Failure – the email address did not have the proper syntax
Email Repository Result Codes
Code Summary Description
N No match found Email address not found in repository/Unknown
Y Match found Email address found in repository
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 124
IP Address Verification Result Codes - City
Code Summary Description
1 Match to Input IP Matches to Input City
2 No Match to Input IP Does Not Match to Input City
3 No Data No City Data Available
4 IP Not Available IP Address Not Available
IP Address Verification Result Codes - State
Code Summary Description
1 Match to Input IP Matches to Input State
2 No Match to Input IP Does Not Match to Input State
3 No Data No State Data Available
4 IP Not Available IP Address Not Available
IP Address Verification Result Codes – Zip Code
Code Summary Description
1 Match to Input IP Matches to Input Zip Code
2 No Match to Input IP Does Not Match to Input Zip Code
3 No Data No Zip Code Data Available
4 IP Not Available IP Address Not Available
IP Address Verification Result Codes – Country
Code Summary Description
1 Match to US IP Address Matches to US or US Territory
2 Match no US IP Address Matches to a Foreign Country (outside of US)
3 No Data No Country Data Available
4 IP Not Available IP Address Not Available
5 Reserved/Private IP Address is Classified as Reserved or Private, Unable to Retrieve Data
6 Unknown Country Associated with IP is Unknown
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 125
Card Document Validation Result Codes
Code Summary Description
0 OK The document has passed the check.
1 Fake The document has evidence of forgery.
2 Expired The document has expired.
E Error There was an unknown problem processing the document.
Card Image Parsing Result Codes
Code Summary Description
B Both sides parsed Both sides of the document were successfully parsed.
F Front side parsed Only the front side of the document was successfully parsed.
R Rear side parsed Only the rear side of the document was successfully parsed.
X Neither side parsed Neither side of the document was successfully parsed.
E Error There was an error while processing the request.
Fill Document Validation Result Codes
Code Summary Description
V Valid Successfully processed the image and the document appears valid.
I Invalid Document appears invalid.
E Error There was an unknown problem processing the ID.
Fill Document Expiration Result Codes
Code Summary Description
NE Not Expired The document has not expired.
EXP Expired The document has expired.
NF Not Found The document does not contain an Expiration Date field.
E Error There was an unknown problem processing the ID.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 126
Legacy Address Verification Result Codes
Code Definition Explanation Match Summary
A Address ambiguous
Necessary elements missing from address. Multiple
address matches found but input address is not
specific enough to obtain single match.
Validation failed,
match not
performed
B Match to business name
- Residential address
Used on business searches only. Business found at
address from residential file. Match
BB Match to business name
- Business address
Used on business searches only. Business found at
the supplied address. Match
BM Match to business name
- Mixed use address
Used on business searches only. Business found in
both business and residential files. Match
E
Matching records
exceed maximum
defined on profile
Code not utilized. N/A
H House number not
found on street
Street number invalid for this street. Not a
deliverable address. Validation failed,
I Incomplete or blank
address Address not complete.
Validation failed,
match not
performed
N No match to name -
Residential address
Address confirmed residential. Database record
indicates different consumer name at this address. No match
NB No match to name -
Business address
Address found on business file. Consumer name not
associated with address. No match
NM No match to name -
Mixed use address
Address found in both business and residential files.
Consumer name not associated with address. No match
Standardization
database has expired R Road name -
City/Zip mismatch
S Match to surname -
Residential address
SB Match to surname -
Business address
NS/SX U Address unverifiable -
Not in database
N/A
Failed address standardization due to street name
not existing in city or zipcode.
Validation failed,
match not
performed
Address confirmed residential. Input last name
matches (household-level match). Match
Address on business file. Input last name matches
(household-level match). Match
SM Match to surname -
Mixed use address
Address found in both business and residential files.
Input last name matches (household-level match). Match
T City/State mismatch Failed address standardization due to city not
existing in state.
Validation failed,
match not
performed
Address passed standardization, but is not is the
database.
Match not
performed
UR
Address residential -
Name match
unavailable
Address passed standardization and is found on the
residential file. No record as to resident for name
match.
Match not
performed
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 127
Legacy Address Verification Result Codes (CONT'D)
Code Definition Explanation Match Summary
Y Match to full name -
Residential address
Address confirmed residential. Input last name
matches (household-level match). Match
YB Match to full name -
Business address Address found on business file. Input name matches. Match
YM Match to full name -
Mixed use address
Address found in both business and residential files.
Input full name matches (household-level match). Match
Z City/State Zip
mismatch Failed address standardization. Validation failed,
match not performed
P Match to full name -
Previous address
Address matches to previous address. Input name
matches. Match
Legacy Phone Verification Result Codes
Code Definition Explanation Match Summary
A Match to address only -
Residential phone Phone matches address. Match
AB Match to address only -
Business phone
Phone matches address. Address found in business
file. Match
AM Match to address only -
Mixed-use phone
Phone matches address. Address found in both
business and residential files. Match
B
Match to business
name and address -
Residential phone
Used for business searches only. Phone is found in
residential files, but matches business name on input. Match
BB
Match to business
name and address -
Business phone
Used for business searches only. Phone matches
business name and address. Match
BM
Match to business
name and address -
Mixed use phone
Used for business searches only. Phone is found in
both residential and business files. Matches business
name and address.
Match
C Probable cellular phone Phone is classified as mobile, PCS or cellular. Based
on area code/exchanges reported for cell phones
Match not
performed
D
Match to business
name - Residential
address
Used for business searches only. Phone in residential
file matches business name. Match
DB
Match to business
name -Business
address
Used for business searches only. Phone matches
business name only. Match
DM
Match to business
name -
Mixed use phone
Used for business searches only. Phone is found in
both residential and business files. Phone matches
business name only.
Match
E
Matching records
exceed maximum
defined in profile
Code not utilized. N/A
F Match to full name only
-Residential phone Phone matches full name. Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 128
Legacy Phone Verification Result Codes (CONT’D)
Code Definition Explanation Match Summary
FB Match to full name only
-Business phone
Phone matches full name. Phone was found in
business file. Match
FM Match to full name only
- Mixed-use phone
Phone matches full name. Phone was found in both
business and residential files. Match
H
Match to surname and
address - Residential
phone
Phone matches last name and address (household-
level match). Match
HB
Match to surname and
address - Business
phone
Phone matches last name and address (household-
level match). Phone was found in business file. Match
HM
Match to surname and
address - Mixed-use
phone
Phone was found in both business and residential files.
Phone matches last name and address (household-
level match).
Match
I Phone is incorrect
length Phone is not 10 digits.
Validation failed,
match not
performed
IA Invalid area code Area code is invalid.
Validation failed,
match not
performed
M
Phone Missing - Search
information not
received
Phone not supplied on search request. Match not
performed.
MA Match to header data Phone matched to header information Match
N
No match to name or
address - Residential
phone
Phone does not match input name or address. No match
NA Data not available Code not utilized. N/A
NB
No match to name or
address - Business
phone
Phone found in business file but does not match input
name or address. No match
NM
No match to name or
address - Mixed-use
phone
Phone was found in both business and residential files.
No match to input name or address. No match
P Probable pager Phone is classified as a pager. Based on area
code/exchanges reported for pagers.
Match not
performed.
S Match to surname only
- Residential phone Phone matches input last name only. Match
SB Match to surname only
- Business phone
Phone matches input last name only and found on
business file. Match
SM
Match to surname only
- Mixed-use
phone
Phone was found in both business and residential files.
Phone matches last name only. Match
U Phone unverifiable -
Not in database
Phone valid and consistent with address. Phone not in
database for name/address verification, primarily due
to being unlisted.
Match not
performed.
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 129
Legacy Phone Verification Result Codes (CONT’D)
Code Definition Explanation Match Summary
X Prefix-Zip mismatch Phone does not match the address.
Validation failed,
match not
performed
Y
Match to full name and
address - Residential
phone
Phone matches input name and address. Match
YB
Match to full name and
address - Business
phone
Phone matches input name and address, but found in
business file. Match
YM
Match to full name and
address - Mixed-use
phone
Phone was found in both business and residential files.
Phone matches input name and address. Match
BlueAssure Platform Integration Documentation | Appendix A: Response Codes 130
Appendix B: AssureCanada Match Codes
Address Result Codes
Code Description Value
AA_BD999 Is address affiliated with date of birth? Boolean
AA_FN999 Is address affiliated with full name? Boolean
AA_GI999 Is address affiliated with government ID? Boolean
AA_LN999 Is address affiliated with family name? Boolean
AA_OV999 Is address affiliated with any other PII element? Boolean
AI_OT_S001 Is address valid? Boolean
AI_OV_S007 Is address associated with fraud records? Boolean
AT_AA_S001 Address risk score 0-100
AT_AA_S002 Is address affiliated with input PII? Boolean
AT_ATRC001 Is address trusted? Boolean
AV_AV_S001 Is address verified? Boolean
Credit File Result Codes
Code Description Value
CFI_ANM_CA Request address does not match current address in database Boolean
CFI_ANM_F1 Request address does not match former address 1 in database Boolean
CFI_ANM_F2 Request address does not match former address 2 in database Boolean
CFI_CFA_01 Age of credit file is less than six months Boolean
CFI_CFA_02 Age of credit file is six months or greater Boolean
CFI_CFA_03 Age of credit file is less than three years Boolean
CFI_CFA_04 Age of credit file is three years or greater Boolean
CFI_CFH_00 Unable to confirm credit file history Boolean
CFI_CFH_01 Credit file history is less than six months Boolean
CFI_CFH_02 Credit file history is equal to or greater than six months Boolean
CFI_CFL_00 No credit file located or poor match score Boolean
CFI_CFL_01 Credit file located - Good match Boolean
CFI_CFL_02 Credit file located - Adequate match Boolean
CFI_CFL_03 Credit file located - Possible match Boolean
CFI_COT_02 Credit file has more than 2 open trades Boolean
CFI_DOB_00 Request age does not match the calculated age on the credit file Boolean
CFI_DOB_01 Request age matches the calculated age on the credit file Boolean
CFI_DOB_18 Calculated age on the credit file is 18 or greater Boolean
CFI_DOB_19 Calculated age on the credit file is 19 or greater Boolean
BlueAssure Platform Integration Documentation | Appendix B: AssureCanada Match Codes 131
CFI_DOB_21 Calculated age on the credit file is 21 or greater Boolean
CFI_DOB_NP Date of birth is not present on the credit file Boolean
CFI_NCA_30 Current address is new within 30 days on the credit file Boolean
CFI_NNV_FN First name not validated Boolean
CFI_NNV_LN Last name not validated Boolean
CFI_NPR_00 CFI_SIN_MM Social Insurance Number mismatch CFI_SIN_NV Social Insurance Number is not valid No phone record located or poor match score CFI_WRN_IF Boolean
Boolean
Boolean
CFI_WID_LS Wallet or identification is lost or stolen Boolean
WARNING: Request-only file Boolean
CFI_WRN_NF WARNING: Age of credit file is under one month Boolean
CFI_WRN_SI WARNING: Request Social Insurance Number has not yet been issued Boolean
CFI_WRN_SM WARNING: Request Social Insurance Number has been reported misused.
Thorough verification suggested Boolean
CFI_WRN_TF WARNING: Thin file Boolean
CFI_WRN_TS WARNING: Temporary SIN Boolean
Name Result Codes
Code Description Value
NA_AF999 Is full name affiliated with address? Boolean
NA_FN999 Is full name affiliated with date of birth? Boolean
NA_GV999 Is full name affiliated with government ID? Boolean
NA_LN999 Is family name affiliated with date of birth? Boolean
NA_OV999 Is full name affilated with any other PII element? Boolean
Fraud Insight Result Codes
Code Description Value
FVI_FV_S001 Is fraud victim warning present and information blocked due to identity theft? Boolean
FVI_FV_S005 Is fraud victim alert present? Boolean
FVI_OV_S001 Fraud risk level “H”, “M”, or “L”
BlueAssure Platform Integration Documentation | Appendix B: AssureCanada Match Codes 132
Date of Birth Result Codes
Code Description Value
DOBA_AA999 Is date of birth affiliated with address? Boolean
DOBA_FN999 Is date of birth affiliated with full name? Boolean
DOBA_GI999 Is date of birth affiliated with government ID? Boolean
DOBA_OV999 Is date of birth affiliated with any other PII element? Boolean
Deceased Result Codes
Code Description Value
DE_IM_S001 Is the individual deceased? Boolean
BlueAssure Platform Integration Documentation | 133
Appendix C: AssureWatch Match Codes
AssureWatch Field-Level Result Codes
The below match codes indicate the possible results for the submitted ID Number, Name, Address,
and/or Date of Birth.
Name results include FirstName, MiddleName, and LastName for individuals, or just EntityName for
entities.
Address results include Street, City, State, Province, ZipCode, and CountryCode.
Code Definition Explanation Match Summary
E Exact Match Exact match to the submitted value Match
R Reverse Exact Match Exact match when the submitted value is reversed. For
example, when last name and first name are reversed. Match
P Partial Match
Submitted value matches part of the value on record. For
example, the year of submitted date of birth matches the year
of a date of birth on record.
Partial Match
S Similar Match Submitted value is similar to the value on record. For example,
“John Test” will be similar to “Jon Test”. Similar Match
N No Match No match found between submitted value and values on the
record. No Match
NF Not on File
No records found for this field. For example, a “John Test” was
found that matched to the submitted name, but no dates of
birth are on file for that record.
No Match
NS Not Submitted This field was not submitted in the request. No Match
BlueAssure Platform Integration Documentation | Appendix C: AssureWatch Match Codes 134
Appendix D: AssureFinCEN Match Codes
AssureFinCEN Validation Result Codes
Code Definition Explanation Match Summary
FA Match to full name and
address
Inquiry full name and address matches name and address on
FinCEN list. Match
FP Match to full name and
partial address
Inquiry full name matches name on FinCEN list. Address
partially matches address on file. Match
F Match to full name Inquiry full name matches name on FinCEN list. Match
RA Match to name when input
is reversed and full address
Inquiry full name matches name on FinCEN list when inquiry
name is reversed. Address matches FinCEN list exactly. Match
RP
Match to name when input
is reversed and partial
address
Inquiry full name matches name on FinCEN list when inquiry
name is reversed. Address matches partially. Match
R Match to name when input
is reversed
Inquiry full name matches name on FinCEN list when inquiry
name is reversed. Match
PA Wildcard match to name
and full address.
Inquiry name matches name on FinCEN list partially using a
wildcard search. Address matches FinCEN list exactly. Match
PP Wildcard match to name
and partial address
Inquiry name matches name on FinCEN list partially using a
wildcard search. Address matches partially. Match
P Wildcard match to name Inquiry name matches name on FinCEN list partially using a
wildcard search. Match
SA Match to similar name and
full address
Inquiry name matches name on FinCEN list using a similarity
search. Address matches exactly. Match
SP Match to similar name and
partial address
Inquiry name matches name on FinCEN list using a similarity
search. Address matches partially. Match
S Match to similar name Inquiry name matches name on FinCEN list using a similarity
search. Match
IA Match to first initial,
surname, and full address
Inquiry first initial and surname matches name on FinCEN list.
Surname and address matches exactly. Match
IP Match to first initial,
surname, and full address
Inquiry first initial and surname matches name on FinCEN list.
Surname and address matches exactly. Match
I Match to first initial and
surname
Inquiry first initial surname matches name on FinCEN list.
Surname matches exactly. Match
N No match to name or
address Inquiry name not on FinCEN list. No match
BlueAssure Platform Integration Documentation | Appendix D: AssureFinCEN Match Codes 135
Appendix E: AssureAMS Match Codes
AssureAMS Match Found Codes
Code Definition Explanation Match Summary
M Matches Found Matching profiles were found for the entered data. Match
N No Matches Found No matching profiles were found for the entered data. No match
AssureAMS Type Categories
Code Description
ABU Abuse (Domestic, Elder, Child)
ARS Arson
AST Assault, Battery
BRB Bribery, Graft, Kickbacks, Political Corruption
BUR Burglary
BUS Business Crimes (Antitrust, Bankruptcy, Price Fixing)
CFT Counterfeiting, Forgery
CON Conspiracy (No specific crime named)
CPR Copyright Infringement (Intellectual Property, Electronic Piracy)
CYB Computer Related, Cyber Crime
DEN Denied Entity
DPS Possession of Drugs or Drug Paraphernalia
DTF Trafficking or Distribution of Drugs
ENV Environmental Crimes (Poaching, Illegal Logging, Animal Cruelty
FAR Foreign Agent Registration Act
FOF Former OFAC
FOR Forfeiture
FOS Former Sanctions List
FRD Fraud, Scams, Swindles
FUG Escape, Fugitive
GAM Illegal Gambling
HUM Human rights, Genocide, War crimes
IGN Possession or Sale of Guns, Weapons and Explosives
IMP Identity Theft, Impersonation
IPR Illegal Prostitution, Promoting Illegal Prostitution
IRC Iran Connect
KID Kidnapping, Abduction, Held Against Will
LMD Legal Marijuana Dispensary
BlueAssure Platform Integration Documentation | Appendix E: AssureAMS Match Codes 136
LNS Loan Sharking, Usury, Predatory Lending
MIS Misconduct
MLA Money Laundering
MOR Mortgage Related
MSB Money Services Business
MUR Murder, Manslaughter (Committed, Planned or Attempted)
NSC Non Specific Crime
OBS Obscenity Related, Child Pornography
ORG Organized Crime, Criminal Association, Racketeering
PEP Person Political
PRJ False Filings, False Statements, Perjury, Obstruction of Justice
PSP Possession of Stolen Property
REG Regulatory Action
RES Real Estate Actions
ROB Robbery (Stealing by Threat, Use of Force)
SEC SEC Violations (Insider Trading, Securities Fraud)
SEX Sex Offenses (Rape, Sodomy, Sexual Abuse, Pedophilia)
SMG Smuggling (Does not include Drugs, Money, People or Guns)
SNX Sanctions Connect
SPY Espionage, Spying, Treason
TAX Tax Related Offenses
TER Terrorist Related
TFT TRF Theft (Larceny, Misappropriation, Embezzlement, Extortion)
People Trafficking, Organ Trafficking
WLT VCY Virtual Currency
Watch List
BlueAssure Platform Integration Documentation | Appendix E: AssureAMS Match Codes 137
AssureAMS SubType Categories
Code Description
ACC Accuse
ACQ Acquit, Not Guilty
ACT Disciplinary, Regulatory Action
ADT Audit
ALL Allege
APL Appeal
ARB Arbitration
ARN Arraign
ART Arrest
ASC Associated with, Seen with
CEN Censure
CHG Charged
CMP Complaint Filed
CNF Confession
CSP Conspire
CVT Convict, Conviction
DEP Deported
DMS Dismissed
EXP Expelled
FIL Fine – Less than $10,000
FIM Fine – More than $10,000
GOV Government Official
IND Indict, Indictment
LIN Lien
PLE Plea
PRB Probe
RVK Revoked Registration
SAN Sanction
SET Settlement of Suit
SEZ Seizure
SJT Served Jail Time
SPD Suspended
SPT Suspected
TRL Trial
WTD Wanted
BlueAssure Platform Integration Documentation | Appendix E: AssureAMS Match Codes 138
Appendix F: PEP Match Codes
PEP Match Result Codes
Code Definition Explanation Match Summary
M Matches Found Matching profiles were found for the entered data. Match
N No Matches Found No matching profiles were found for the entered data. No match
PEP Risk Types
Code Description
HOS Head of State
CAB Cabinet or Government Agency Head
AMB Ambassador
MIL Senior Official in Military Branch
JUD Senior Official in Judicial Branch
POL Senior Official of Political Party
GCO Senior Executive or Influential Functionary in a Government Owned Enterprise
IGO International Governmental Organization Official
NIO Senior Official In Non-Infrastructure Division or Agency
MUN Municipal Level Employee
REG Regional Official
LEG Senior Official in Legislative Branch
ISO International Sporting Official
INF Senior Official In Government Infrastructure Division or Agency
FAM Family
ASC Associate
BlueAssure Platform Integration Documentation | Appendix F: PEP Match Codes 139
Appendix G: AssurePay Match Codes
AssurePay Attribute Match Codes
Code Description
E Exact match
C Close match
P Partial match
N No match
M Missing attribute
NF Card not found
BlueAssure Platform Integration Documentation | Appendix G: AssurePay Match Codes 140
Appendix H: AssureLocate Match Codes
AssureLocate VPN Probability Result Codes
Code Summary Description
L Low VPN Probability Distance indicates low probability of VPN usage
M Medium VPN Probability Distance indicates medium probability of VPN usage
H High VPN Probability Distance indicates high probability of VPN usage
BlueAssure Platform Integration Documentation | Appendix H: AssureLocate Match Codes 141