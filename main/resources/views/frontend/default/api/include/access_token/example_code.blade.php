<code class="hljs language-*" id="php">
    // Set up the API endpoint and your public key
    $url = '{{ url('api/access-token') }}';
    $publicKey = 'your_public_key';

    // Initialize cURL
    $ch = curl_init($url);

    // Set up the request headers
    $headers = [
        'Content-Type: application/json'
    ];

    // Prepare the request payload
    $data = [
        'public_key' => $publicKey,
    ];

    // Configure cURL options
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // Execute the request
    $response = curl_exec($ch);

    // Check for errors
    if (curl_errno($ch)) {
        echo 'cURL Error: ' . curl_error($ch);
    } else {
        // Parse and display the response
        echo 'Response: ' . $response;
    }

    // Close cURL
    curl_close($ch);
</code>
<code class="hljs language-* d-none" id="laravel">

    use Illuminate\Support\Facades\Http;

    // Set up the API endpoint and your public key
    $url = '{{ url('api/access-token') }}';
    $publicKey = 'your_public_key';

    // Make the POST request using Laravel's HTTP client
    $response = Http::withHeaders([
        'Content-Type' => 'application/json'
    ])->post($url, [
        'public_key' => $publicKey,
    ]);

    // Check the response
    if ($response->successful()) {
        // Parse and display the response
        return response()->json($response->json());
    } else {
        // Handle errors
        return response()->json($response->json());
    }

</code>
<code class="hljs language-* d-none" id="curl">
    curl -X POST "{{ url('api/access-token') }}" \
    -H "Content-Type: application/json" \
    -d '{"public_key":"your_public_key"}'

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
            // Set up the API endpoint and your public key
            string url = "{{ url('api/access-token') }}"; // Replace with your API URL
            string publicKey = "your_public_key"; // Replace with your actual public key

            // Create the HTTP client
            using (HttpClient client = new HttpClient())
            {
                // Set up the request headers
                client.DefaultRequestHeaders.Add("Content-Type", "application/json");

                // Prepare the request payload
                var payload = new
                {
                    public_key = publicKey
                };

                // Convert payload to JSON
                string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(payload);

                // Send the POST request
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(url, content);

                // Check the response
                if (response.IsSuccessStatusCode)
                {
                    string responseBody = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Response: " + responseBody);
                }
                else
                {
                    Console.WriteLine("Error: " + response.StatusCode);
                    string errorResponse = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Error Details: " + errorResponse);
                }
            }
        }
    }
</code>

<code class="hljs language-* d-none" id="java">
    import java.io.OutputStream;
    import java.net.HttpURLConnection;
    import java.net.URL;
    import java.util.Scanner;

    public class APIRequest {

        public static void main(String[] args) {
            // Set up the API endpoint and your public key
            String apiUrl = "{{ url('api/access-token') }}"; // Replace with your API URL";
            String publicKey = "your_public_key";

            try {
                // Create URL object
                URL url = new URL(apiUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();

                // Configure the HTTP connection
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setDoOutput(true);

                // Prepare the JSON payload
                String jsonInput = "{ \"public_key\": \"" + publicKey + "\" }";

                // Send the request payload
                try (OutputStream os = conn.getOutputStream()) {
                    byte[] input = jsonInput.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                // Read the response
                int status = conn.getResponseCode();
                if (status == HttpURLConnection.HTTP_OK) {
                    try (Scanner scanner = new Scanner(conn.getInputStream(), "utf-8")) {
                        StringBuilder response = new StringBuilder();
                        while (scanner.hasNextLine()) {
                            response.append(scanner.nextLine());
                        }
                        System.out.println("Response: " + response.toString());
                    }
                } else {
                    try (Scanner scanner = new Scanner(conn.getErrorStream(), "utf-8")) {
                        StringBuilder errorResponse = new StringBuilder();
                        while (scanner.hasNextLine()) {
                            errorResponse.append(scanner.nextLine());
                        }
                        System.err.println("Error Response: " + errorResponse.toString());
                    }
                }

                // Disconnect the connection
                conn.disconnect();

            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
</code>
<code class="hljs language-* d-none" id="nodejs">
    const axios = require('axios');

    // Set up the API endpoint and your public key
    const url = '{{ url('api/access-token') }}'; // Replace with your API URL
    const publicKey = 'your_public_key';

    // Prepare the request payload
    const data = {
        public_key: publicKey
    };

    // Make the POST request
    axios.post(url, data, {
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        // Handle successful response
        console.log('Response:', response.data);
    })
    .catch(error => {
        if (error.response) {
            // Handle error response from the server
            console.error('Error Response:', error.response.data);
        } else {
            // Handle network or other errors
            console.error('Error:', error.message);
        }
    });
</code>
<code class="hljs language-* d-none" id="python">
    import requests
    import json

    # Set up the API endpoint and your public key
    url = '{{ url('api/access-token') }}'
    public_key = 'your_public_key'

    # Prepare the request payload
    data = {
        'public_key': public_key,
    }

    # Set up the headers
    headers = {
        'Content-Type': 'application/json',
    }

    # Send the POST request
    response = requests.post(url, headers=headers, data=json.dumps(data))

    # Check for errors
    if response.status_code != 200:
        print(f'Error: {response.status_code}')
    else:
        # Parse and display the response
        print('Response:', response.text)

</code>
<code class="hljs language-* d-none" id="ruby">
    require 'net/http'
    require 'uri'
    require 'json'

    # Set up the API endpoint and your public key
    url = URI.parse('https://money-chain.test/api/access-token')
    public_key = 'your_public_key'

    # Prepare the request payload
    data = {
        'public_key' => public_key,
    }

    # Create the HTTP request
    http = Net::HTTP.new(url.host, url.port)

    # Create a POST request
    request = Net::HTTP::Post.new(url.path,
    {'Content-Type' => 'application/json'})
    request.body = data.to_json

    # Send the request
    response = http.request(request)

    # Check for errors
    if response.code.to_i != 200
        puts "Error: #{response.code}"
    else
        # Parse and display the response
        puts "Response: #{response.body}"
    end
</code>