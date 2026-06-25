<code class="hljs language-*" id="php">

    // Assuming the necessary data is available
    $secretKey = ''; // Define your secret key here
    $data = $_GET['data']; // Get the 'data' parameter from the request
    $receivedSignature = $_GET['signature']; // Get the 'signature' parameter from the request

    // Recreate the signature
    $dataToHash = $data['transaction_id'] . $data['total_amount'];
    $generatedSignature = hash_hmac('sha256', $dataToHash, $secretKey);

    // Verify the signature
    if ($generatedSignature === $receivedSignature) {
        // Perform the task
        // Your task execution code here
    }

</code>
<code class="hljs language-* d-none" id="laravel">
    use Illuminate\Http\Request;

    Route::get('my-ipn-url', function (Request $request) {

        $secretKey = '';
        $data = $request->get('data');
        $receivedSignature = $request->get('signature');

        // Recreate the signature
        $dataToHash = $data['transaction_id'] . $data['total_amount'];
        $generatedSignature = hash_hmac('sha256', $dataToHash, $secretKey);

        // Verify the signature
        if ($generatedSignature == $receivedSignature) {
            // Perform the task
        }
    });
</code>

<code class="hljs language-* d-none" id="dotnet">
    using System;
    using System.Security.Cryptography;
    using System.Text;
    using Microsoft.AspNetCore.Mvc;

    namespace YourNamespace
    {
        [Route("my-ipn-url")]
        [ApiController]
        public class PaymentController : ControllerBase
        {
            [HttpGet]
            public IActionResult VerifyPayment(string data, string signature)
            {
                string secretKey = ""; // Define your secret key here

                // Deserialize data (assuming it's a JSON string)
                var dataObject = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(data);

                string transactionId = dataObject.transaction_id;
                string totalAmount = dataObject.total_amount;

                // Recreate the signature
                string dataToHash = transactionId + totalAmount;
                string generatedSignature = GenerateHashSignature(dataToHash, secretKey);

                // Verify the signature
                if (generatedSignature == signature)
                {
                    // Perform the task
                    return Ok("Payment verified successfully.");
                }

                return BadRequest("Invalid signature.");
            }

            private string GenerateHashSignature(string dataToHash, string secretKey)
            {
                using (HMACSHA256 hmac = new HMACSHA256(Encoding.UTF8.GetBytes(secretKey)))
                {
                    byte[] hashBytes = hmac.ComputeHash(Encoding.UTF8.GetBytes(dataToHash));
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                }
            }
        }
    }
</code>

<code class="hljs language-* d-none" id="java">
    import javax.crypto.Mac;
    import javax.crypto.spec.SecretKeySpec;
    import java.nio.charset.StandardCharsets;
    import java.security.NoSuchAlgorithmException;
    import java.util.Base64;

    public class PaymentVerification {

        public static void main(String[] args) {
            // Example data
            String secretKey = ""; // Define your secret key here
            String data = "{\"transaction_id\": \"12345\", \"total_amount\": \"100.00\"}"; // Example data (in JSON format)
            String receivedSignature = "received_signature"; // Replace with the actual signature from the request

            // Assuming data is a JSON string, you can extract the required fields like this:
            String transactionId = "12345"; // Extracted from the JSON data
            String totalAmount = "100.00"; // Extracted from the JSON data

            // Recreate the signature
            String dataToHash = transactionId + totalAmount;
            String generatedSignature = generateHashSignature(dataToHash, secretKey);

            // Verify the signature
            if (generatedSignature.equals(receivedSignature)) {
                // Perform the task
                System.out.println("Payment verified successfully.");
            } else {
                System.out.println("Invalid signature.");
            }
        }

        private static String generateHashSignature(String dataToHash, String secretKey) {
            try {
                // Create HMACSHA256 hash
                Mac mac = Mac.getInstance("HmacSHA256");
                SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
                mac.init(secretKeySpec);

                byte[] hashBytes = mac.doFinal(dataToHash.getBytes(StandardCharsets.UTF_8));

                // Convert hash bytes to a hexadecimal string
                StringBuilder hexString = new StringBuilder();
                for (byte b : hashBytes) {
                    String hex = Integer.toHexString(0xff & b);
                    if (hex.length() == 1) {
                        hexString.append('0');
                    }
                    hexString.append(hex);
                }

                return hexString.toString();
            } catch (NoSuchAlgorithmException | java.security.InvalidKeyException e) {
                e.printStackTrace();
                return null;
            }
        }
    }
</code>

<code class="hljs language-* d-none" id="nodejs">
    const crypto = require('crypto');

    function verifyPayment(data, receivedSignature, secretKey) {
        // Recreate the signature
        const transactionId = data.transaction_id;
        const totalAmount = data.total_amount;
        const dataToHash = transactionId + totalAmount;

        // Generate the HMAC-SHA256 signature
        const generatedSignature = generateHashSignature(dataToHash, secretKey);

        // Verify the signature
        if (generatedSignature === receivedSignature) {
            console.log("Payment verified successfully.");
            // Perform the task
        } else {
            console.log("Invalid signature.");
        }
    }

    function generateHashSignature(dataToHash, secretKey) {
        return crypto.createHmac('sha256', secretKey)
            .update(dataToHash)
            .digest('hex');
    }

    // Example usage
    const secretKey = ''; // Define your secret key here
    const data = {
        transaction_id: '12345',
        total_amount: '100.00'
    }; // Example data object
    const receivedSignature = 'received_signature'; // Replace with actual received signature

    verifyPayment(data, receivedSignature, secretKey);

</code>
<code class="hljs language-* d-none" id="python">
    import hmac
    import hashlib

    def verify_payment(data, received_signature, secret_key):
        # Recreate the signature
        transaction_id = data['transaction_id']
        total_amount = data['total_amount']
        data_to_hash = transaction_id + total_amount

        # Generate the HMAC-SHA256 signature
        generated_signature = generate_hash_signature(data_to_hash, secret_key)

        # Verify the signature
        if generated_signature == received_signature:
            print("Payment verified successfully.")
            # Perform the task
        else:
            print("Invalid signature.")

    def generate_hash_signature(data_to_hash, secret_key):
        # Create HMACSHA256 signature
        return hmac.new(secret_key.encode('utf-8'), data_to_hash.encode('utf-8'), hashlib.sha256).hexdigest()

    # Example usage
    secret_key = ''  # Define your secret key here
    data = {
        'transaction_id': '12345',
        'total_amount': '100.00'
    }  # Example data dictionary
    received_signature = 'received_signature'  # Replace with actual received signature

    verify_payment(data, received_signature, secret_key)

</code>
<code class="hljs language-* d-none" id="ruby">
    require 'openssl'

    def verify_payment(data, received_signature, secret_key)
        # Recreate the signature
        transaction_id = data[:transaction_id]
        total_amount = data[:total_amount]
        data_to_hash = transaction_id + total_amount.to_s

        # Generate the HMAC-SHA256 signature
        generated_signature = generate_hash_signature(data_to_hash, secret_key)

        # Verify the signature
        if generated_signature == received_signature
            puts "Payment verified successfully."
            # Perform the task
        else
            puts "Invalid signature."
        end
    end

    def generate_hash_signature(data_to_hash, secret_key)
        # Create HMACSHA256 signature
        hmac = OpenSSL::HMAC.new(secret_key, OpenSSL::Digest::SHA256.new)
        hmac.update(data_to_hash)
        hmac.hexdigest
    end

    # Example usage
    secret_key = ''  # Define your secret key here
    data = { 
        transaction_id: '12345', 
        total_amount: 100.00
    }  # Example data hash
    received_signature = 'received_signature'  # Replace with actual received signature

    verify_payment(data, received_signature, secret_key)

</code>
