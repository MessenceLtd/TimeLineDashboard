using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard_BLL
{
    internal class Cryptography_Processor
    {
        public static string CreateSalt(int size)
        {
            //Generate a cryptographic random number.
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[size];
            rng.GetBytes(buff);
            return Convert.ToBase64String(buff);
        }

        public static string GenerateHash(string input, string randomGeneratedSalt)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(input + randomGeneratedSalt);
            SHA512Managed sHA512ManagedString = new SHA512Managed();
            byte[] hash = sHA512ManagedString.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }

        public static bool ArePasswordsEqual(string plainTextInput, string encryptedPassword, string salt)
        {
            string newHashedPin = GenerateHash(plainTextInput, salt);
            return newHashedPin.Equals(encryptedPassword);
        }
    }
}
