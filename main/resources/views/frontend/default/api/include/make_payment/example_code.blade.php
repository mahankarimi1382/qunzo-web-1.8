<code class="hljs language-*" id="php">

// API endpoint and sandbox credentials
$url = '{{ url('/api/make-payment') }}';
$authToken = 'your_authorization_token_here'; // Replace with your actual token

// Request payload
$data = [
    'amount' => 100.00, // Example amount
    'currency' => 'USD', // Example currency
    'transaction_id' => 'ABC123456789', // Unique transaction ID
    'description' => 'Test payment', // Transaction description
    'ipn_url' => 'https://yourdomain.com/ipn', // Notification URL (optional)
    'callback_url' => 'https://yourdomain.com/callback', // Callback URL (optional)
    'customer_name' => 'John Doe', // Customer name (optional)
    'customer_email' => 'johndoe@example.com', // Customer email (optional)
];

// Initialize cURL
$ch = curl_init($url);

// Set up the request headers
$headers = [
    'Content-Type: application/json',
    'Authorization: Bearer ' . $authToken, // Add the authorization token
];

// Configure cURL options
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute the POST request
$response = curl_exec($ch);

// Handle errors
if (curl_errno($ch)) {
    echo 'cURL Error: ' . curl_error($ch);
} else {
    // Parse and display the response
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    if ($httpCode === 200) {
        $responseData = json_decode($response, true);
        print_r($responseData); // Example output
    } else {
        echo 'Error: HTTP Code ' . $httpCode . PHP_EOL;
        echo 'Message: ' . $response . PHP_EOL;
    }
}

// Close cURL
curl_close($ch);

</code>
<code class="hljs language-* d-none" id="laravel">
    use Illuminate\Support\Facades\Http;

    // API endpoint and sandbox credentials
    $url = '{{ url('/api/make-payment') }}';
    $authToken = 'your_authorization_token_here'; // Replace with your actual token

    // Request payload
    $data = [
        'amount' => 100.00, // Example amount
        'currency' => 'USD', // Example currency
        'transaction_id' => 'ABC123456789', // Unique transaction ID
        'description' => 'Test payment', // Transaction description
        'ipn_url' => 'https://yourdomain.com/ipn', // Notification URL (optional)
        'callback_url' => 'https://yourdomain.com/callback', // Callback URL (optional)
        'customer_name' => 'John Doe', // Customer name (optional)
        'customer_email' => 'johndoe@example.com', // Customer email (optional)
    ];

    // Make the POST request
    $response = Http::withHeaders([
        'Content-Type' => 'application/json',
        'Authorization' => 'Bearer ' . $authToken, // Add the authorization token
    ])->post($url, $data);

    // Handle the response
    if ($response->successful()) {
        // Process the successful response
        $responseData = $response->json();
        print_r($responseData); // Example output
    } else {
        // Handle errors
        echo 'Error: ' . $response->status();
        echo 'Message: ' . $response->body();
    }
</code>
<code class="hljs language-* d-none" id="curl">
curl -X POST {{ url('/api/make-payment') }} \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your_authorization_token_here" \
-d '{
  "amount": 100.00,
  "currency": "USD",
  "transaction_id": "ABC123456789",
  "description": "Test payment",
  "ipn_url": "https://yourdomain.com/ipn",
  "callback_url": "https://yourdomain.com/callback",
  "customer_name": "John Doe",
  "customer_email": "johndoe@example.com"
}'
</code>

<code class="hljs language-* d-none" id="dotnet">
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        // API endpoint and sandbox credentials
        var url = "{{ url('/api/make-payment') }}";
        var authToken = "your_authorization_token_here"; // Replace with your actual token

        // Request payload
        var data = new
        {
            amount = 100.00, // Example amount
            currency = "USD", // Example currency
            transaction_id = "ABC123456789", // Unique transaction ID
            description = "Test payment", // Transaction description
            ipn_url = "https://yourdomain.com/ipn", // Notification URL (optional)
            callback_url = "https://yourdomain.com/callback", // Callback URL (optional)
            customer_name = "John Doe", // Customer name (optional)
            customer_email = "johndoe@example.com" // Customer email (optional)
        };

        using (var client = new HttpClient())
        {
            // Add authorization header
            client.DefaultRequestHeaders.Add("Authorization", "Bearer " + authToken);

            // Convert the data to JSON
            var jsonData = System.Text.Json.JsonSerializer.Serialize(data);
            var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

            // Make the POST request
            try
            {
                var response = await client.PostAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    // Process the successful response
                    var responseData = await response.Content.ReadAsStringAsync();
                    Console.WriteLine(responseData); // Example output
                }
                else
                {
                    // Handle errors
                    Console.WriteLine("Error: " + response.StatusCode);
                    var errorMessage = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Message: " + errorMessage);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
        }
    }
}
</code>

<code class="hljs language-* d-none" id="java">
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.OutputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;

public class PaymentRequest {

    public static void main(String[] args) {
        try {
            // API endpoint and sandbox credentials
            String url = "{{ url('/api/make-payment') }}";
            String authToken = "your_authorization_token_here"; // Replace with your actual token

            // Request payload as a JSON string
            String jsonData = "{"
                    + "\"amount\": 100.00, "
                    + "\"currency\": \"USD\", "
                    + "\"transaction_id\": \"ABC123456789\", "
                    + "\"description\": \"Test payment\", "
                    + "\"ipn_url\": \"https://yourdomain.com/ipn\", "
                    + "\"callback_url\": \"https://yourdomain.com/callback\", "
                    + "\"customer_name\": \"John Doe\", "
                    + "\"customer_email\": \"johndoe@example.com\""
                    + "}";

            // Create URL object and open a connection
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            // Set the request method to POST
            con.setRequestMethod("POST");

            // Add request headers
            con.setRequestProperty("Content-Type", "application/json");
            con.setRequestProperty("Authorization", "Bearer " + authToken);

            // Enable input/output streams for the connection
            con.setDoOutput(true);

            // Send the POST data
            try (OutputStream os = con.getOutputStream()) {
                byte[] input = jsonData.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Get the response code
            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Read and print the response
                try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                    String inputLine;
                    StringBuilder response = new StringBuilder();
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    System.out.println("Response: " + response.toString());
                }
            } else {
                // Handle error
                System.out.println("Error: " + responseCode);
                try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getErrorStream()))) {
                    String inputLine;
                    StringBuilder errorMessage = new StringBuilder();
                    while ((inputLine = in.readLine()) != null) {
                        errorMessage.append(inputLine);
                    }
                    System.out.println("Message: " + errorMessage.toString());
                }
            }
        } catch (Exception e) {
            // Handle exception
            e.printStackTrace();
        }
    }
}
</code>

<code class="hljs language-* d-none" id="nodejs">
const axios = require('axios');

async function makePayment() {
    try {
        // API endpoint and sandbox credentials
        const url = '{{ url('/api/make-payment') }}';
        const authToken = 'your_authorization_token_here'; // Replace with your actual token

        // Request payload
        const data = {
            amount: 100.00, // Example amount
            currency: 'USD', // Example currency
            transaction_id: 'ABC123456789', // Unique transaction ID
            description: 'Test payment', // Transaction description
            ipn_url: 'https://yourdomain.com/ipn', // Notification URL (optional)
            callback_url: 'https://yourdomain.com/callback', // Callback URL (optional)
            customer_name: 'John Doe', // Customer name (optional)
            customer_email: 'johndoe@example.com' // Customer email (optional)
        };

        // Make the POST request
        const response = await axios.post(url, data, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + authToken // Add the authorization token
            }
        });

        // Handle the response
        console.log('Response:', response.data); // Example output

    } catch (error) {
        // Handle errors
        if (error.response) {
            // Server responded with an error
            console.error('Error:', error.response.status);
            console.error('Message:', error.response.data);
        } else {
            // Request did not get a response
            console.error('Error:', error.message);
        }
    }
}

// Call the function
makePayment();
</code>
<code class="hljs language-* d-none" id="python">
import requests
import json

def make_payment():
    # API endpoint and sandbox credentials
    url = '{{ url('/api/make-payment') }}'
    auth_token = 'your_authorization_token_here'  # Replace with your actual token

    # Request payload
    data = {
        'amount': 100.00,  # Example amount
        'currency': 'USD',  # Example currency
        'transaction_id': 'ABC123456789',  # Unique transaction ID
        'description': 'Test payment',  # Transaction description
        'ipn_url': 'https://yourdomain.com/ipn',  # Notification URL (optional)
        'callback_url': 'https://yourdomain.com/callback',  # Callback URL (optional)
        'customer_name': 'John Doe',  # Customer name (optional)
        'customer_email': 'johndoe@example.com'  # Customer email (optional)
    }

    # Set the headers
    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + auth_token  # Add the authorization token
    }

    # Make the POST request
    try:
        response = requests.post(url, json=data, headers=headers)

        # Handle the response
        if response.status_code == 200:
            # Process the successful response
            response_data = response.json()
            print('Response:', response_data)  # Example output
        else:
            # Handle errors
            print(f'Error: {response.status_code}')
            print(f'Message: {response.text}')

    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print(f'Error: {e}')

# Call the function
make_payment()
</code>
<code class="hljs language-* d-none" id="ruby">
require 'net/http'
require 'json'
require 'uri'

def make_payment
  # API endpoint and sandbox credentials
  url = URI.parse('{{ url('/api/make-payment') }}')
  auth_token = 'your_authorization_token_here'  # Replace with your actual token

  # Request payload
  data = {
    amount: 100.00,  # Example amount
    currency: 'USD',  # Example currency
    transaction_id: 'ABC123456789',  # Unique transaction ID
    description: 'Test payment',  # Transaction description
    ipn_url: 'https://yourdomain.com/ipn',  # Notification URL (optional)
    callback_url: 'https://yourdomain.com/callback',  # Callback URL (optional)
    customer_name: 'John Doe',  # Customer name (optional)
    customer_email: 'johndoe@example.com'  # Customer email (optional)
  }

  # Set up the HTTP request
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url.path, {
    'Content-Type' => 'application/json',
    'Authorization' => "Bearer #{auth_token}"  # Add the authorization token
  })
  
  # Convert the data to JSON and set the body of the request
  request.body = data.to_json

  # Make the POST request
  begin
    response = http.request(request)

    # Handle the response
    if response.code.to_i == 200
      # Process the successful response
      response_data = JSON.parse(response.body)
      puts "Response: #{response_data}"  # Example output
    else
      # Handle errors
      puts "Error: #{response.code}"
      puts "Message: #{response.body}"
    end
  rescue StandardError => e
    # Handle exceptions
    puts "Error: #{e.message}"
  end
end

# Call the function
make_payment
</code>