# datadoctor


HOST: https://localhost:8000/

## Registration [/register]

### Request User Registration [POST]

+ Request (application/json)

        {
            "firstName": <First Name : String>,
            "lastName": <Last Name : String>,
            "mobileNumber": <Mobile Number : String>,
            "email": <Email : String>,
            "password": <Password : String>
        }

+ Response 201 (application/json)
  
        {
            "status": "success",
            "rescode": 1001,
            "message": "OTP has been sent to email, proceed with otp verification."
        }

+ Response 400 (application/json)
  
        {
            "status": "failure",
            "rescode": 1002,
            "message": "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special character."
        }

+ Response 409 (application/json)
  
        {
            "status": "failure",
            "rescode": 1003,
            "message": "Email already registered"
        }

+ Response 409 (application/json)
  
        {
            "status": "failure",
            "rescode": 1004,
            "message": "Mobile Number Already in use"
        }

+ Response 500 (application/json)
  
        {
            "status": "failure",
            "rescode": 1005,
            "message": "Unknown Server Error"
        }


## OTP Verification [/verifyotp]

### Request OTP Verification [POST]

+ Request (application/json)

        {
            "email": <Email : String>,
            "otp": <OTP : String>
        }

+ Response 201 (application/json)

        {
            "status": "success",
            "rescode": 1006,
            "message": "Account created successfully"
            "token": <JWT Token : String>
        }

+ Response 400 (application/json)

        {
            "status": "failure",
            "rescode": 1007,
            "message": "Invalid or expired OTP. Please try again."
        }

## OTP Verification [/login]

### Request Login (JWT Token) [POST]

+ Request (application/json)

        {
            "email": <Email : String>,
            "password": <Password : String>
        }

+ Response 200 (application/json)

        {
            "status": "success",
            "rescode": 1008,
            "message": "Logged in successfully",
            "token": <JWT Token : String>
        }

+ Response 400 (application/json)

        {
            "status": "failure",
            "rescode": 1009,
            "message": "Invalid credentials"
        }

## Reset Password [/resetpassword]

### Request ownership verification [POST]

+ Request (application/json)

        {
            "stage": "verifyownership",
            "email": <Email : String>
        }

+ Response 200 (application/json)

        {
            "status": "sucess",
            "rescode": 1010,
            "message": "OTP has been sent to email"
        }

+ Response 404 (application/json)
  
        {
            "status": "failure",
            "rescode": 1011,
            "message": "Provided email is not registered"
        }

+ Response 500 (application/json)

        {
            "status": "failure",
            "rescode": 1012,
            "message": "Unknown server error, please try again later"
        }

+ Request (application/json)

        {
            "stage": "password-reset",
            "email": <Email : String>,
            "otp": <OTP : String>,
            "newpassword": <New Password : String>
        }

+ Response 200 (application/json)

        {
            "status": "success",
            "rescode": 1013,
            "message": "Password Changed Successfully"
        }

+ Response 409 (application/json)

        {
            "status": "failure",
            "rescode": 1014,
            "message": "Invalid or expired OTP"
        }

+ Response 400 (application/json)

        {
            "status": "failure",
            "rescode": 1015,
            "message": "Password is too weak"
        }

+ Response 500 (application/json)

        {
            "status": "failure",
            "rescode": 1016,
            "message": "Unknown server error, please try again later"
        }