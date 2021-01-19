using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
//using Dashboard_BackEnd.Data;
using Dashboard_BackEnd.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SharedLayer.Models;
using TimeLineDashboard.BusinessLogicLayer;

namespace Dashboard_BackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private IConfiguration _config;

        public AuthController( IConfiguration config)
        {
            this._config = config;
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Login")]
        public IActionResult Login([FromBody]UserLoginDetails loginDetailsRequest)
        {
            IActionResult response = Unauthorized();
            var user = AuthenticateUser(loginDetailsRequest);

            if (user != null)
            {
                var tokenString = GenerateJSONWebToken(user);
                response = Ok(new { token = tokenString });
            }

            return response;
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Register")]
        public IActionResult Register([FromBody]UserRegistrationRequestDetails registrationDetailsRequest)
        {
            IActionResult response = Unauthorized();

            var user = this.RegisterUser(registrationDetailsRequest);

            if (user != null)
            {
                var tokenString = GenerateJSONWebToken(user);
                response = Ok(new { token = tokenString });
            }

            return response;
        }

        private Users AuthenticateUser(UserLoginDetails loginDetailsRequest)
        {
            Users userDetailsToReturnForAuthentication = null;

            // First step is to check if the username/email is in the databsae
            var userDetails = BusinessLogicLayerFacade.Instance.Users_GetByUsername(loginDetailsRequest.Username);

            if (userDetails != null )
            {
                // There is such a user grab the salted hashed string and generate the password and check if its right against the stored encryptedPassword in the database
                string passwordSaltInDatabase = userDetails.EncryptionRandomSalt;
                string encryptedPasswordInDatabase = userDetails.EcryptedPassword;
                string applicationSecretSolt = this._config["Jwt:ExtraApplicationPasswordsEncryptionInAdditionToRandomSalts"];

                bool arePasswordsEqualAfterHashAndEncryptions = CryptographyProcessor.ArePasswordsEqual(loginDetailsRequest.Password, 
                    encryptedPasswordInDatabase, 
                    passwordSaltInDatabase, 
                    applicationSecretSolt );

                if (!arePasswordsEqualAfterHashAndEncryptions)
                {
                    // Authentication failed! return "null" for current userDetails so Jwt token will not be created
                    userDetails = null;
                    userDetailsToReturnForAuthentication = null;
                }
                else
                {
                    // Authentication passed successfully -- return the current userDetails for Jwt token generation 
                    userDetailsToReturnForAuthentication = userDetails;
                }
            }

            return userDetailsToReturnForAuthentication;
        }

        private Users RegisterUser(UserRegistrationRequestDetails registrationDetailsRequest)
        {
            Users userToReturnAfterSuccessfullCreation = null;

            Users newUser = new Users();

            newUser.FirstName = registrationDetailsRequest.FirstName;
            newUser.LastName = registrationDetailsRequest.LastName;
            newUser.MiddleName = registrationDetailsRequest.MiddleName;

            newUser.Username = registrationDetailsRequest.Username;
            newUser.Email = registrationDetailsRequest.Email;

            string applicationSecretSolt = this._config["Jwt:ExtraApplicationPasswordsEncryptionInAdditionToRandomSalts"];
            int randomGeneratedSoltLength = int.Parse(this._config["Jwt:CryptographyProcessorRandomSoltLength"]);
            string randomGeneratedSoltForPasswordEncryptionAndDatabaseSaving = CryptographyProcessor.CreateSalt(randomGeneratedSoltLength);

            string encryptedHashedPassword = CryptographyProcessor.GenerateHash(
                    registrationDetailsRequest.Password,
                    randomGeneratedSoltForPasswordEncryptionAndDatabaseSaving,
                    applicationSecretSolt);

            newUser.EcryptedPassword = encryptedHashedPassword;
            newUser.EncryptionRandomSalt = randomGeneratedSoltForPasswordEncryptionAndDatabaseSaving;

            newUser.BirthDate = registrationDetailsRequest.BirthDate;
            newUser.RegistrationDate = DateTime.UtcNow;

            newUser.CountryCode = registrationDetailsRequest.CountryCode;
            newUser.CountryName = registrationDetailsRequest.CountryName;

            userToReturnAfterSuccessfullCreation = BusinessLogicLayerFacade.Instance.Users_InsertUser(newUser);

            return userToReturnAfterSuccessfullCreation;
        }

        private string GenerateJSONWebToken(Users userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_config["Jwt:SecretJwtAuthEncryptionKey"]));
            //var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha512Signature);
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);


            var claims = new[] {
                new Claim("id", userInfo.UserId.ToString()),
                new Claim(JwtRegisteredClaimNames.Sub, userInfo.Username),
                new Claim(JwtRegisteredClaimNames.Email, userInfo.Email),
                new Claim("InitiationUTCTimeStamp", DateTime.UtcNow.ToString("dd/MM/yyyy HH:mm:ss")),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
              _config["Jwt:Issuer"],
              claims,
              expires: DateTime.Now.AddMinutes(120),
              signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        internal class CryptographyProcessor
        {
            public static string CreateSalt(int size)
            {
                //Generate a cryptographic random number.
                RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
                byte[] buff = new byte[size];
                rng.GetBytes(buff);
                return Convert.ToBase64String(buff);
            }

            public static string GenerateHash(string input, string randomGeneratedSalt, string applicationSaltForPasswordEncryption)
            {
                byte[] bytes = Encoding.UTF8.GetBytes(input + randomGeneratedSalt + applicationSaltForPasswordEncryption );
                SHA512Managed sHA512ManagedString = new SHA512Managed();
                byte[] hash = sHA512ManagedString.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }

            public static bool ArePasswordsEqual(string plainTextInput, string encryptedPassword, string salt, string applicationSaltForPasswordEncryption)
            {
                string newHashedPin = GenerateHash(plainTextInput, salt, applicationSaltForPasswordEncryption);
                return newHashedPin.Equals(encryptedPassword);
            }
        }
    }
}