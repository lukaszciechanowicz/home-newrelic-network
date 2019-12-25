# home-newrelic-network
Monitoring performance of my Home network

# Example
```
docker run -d -e "PING_ENDPOINT=google.com,facebook.com" -e "NR_API_KEY=xxx" -e "NR_ACCOUNT_ID=xxx" home-newrelic-network:latest
```