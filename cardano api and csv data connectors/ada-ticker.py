#this is a bitcoin cardano api test
#https://medium.com/@randerson112358/get-bitcoin-price-in-real-time-using-python-98b7393b6152

#Import the requests library
import requests

TICKER_API_URL = 'https://api.coinmarketcap.com/v1/ticker/'

def get_latest_crypto_price(crypto):
  
  response = requests.get(TICKER_API_URL+crypto)
  response_json = response.json()
  
  return float(response_json[0]['price_usd'])


#Test the function to see if it returns the current price of the crypto currency.
get_latest_crypto_price('cardano')
