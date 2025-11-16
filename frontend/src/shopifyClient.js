import Client from 'shopify-buy';

// Get the keys from your .env file
const storefrontToken = process.env.REACT_APP_SHOPIFY_STOREFRONT_TOKEN;
const storeDomain = process.env.REACT_APP_SHOPIFY_STORE_DOMAIN;

// Initialize a client to return from SDK
const client = Client.buildClient({
  domain: storeDomain,
  storefrontAccessToken: storefrontToken
});

export default client;