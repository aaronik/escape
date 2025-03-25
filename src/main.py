import os
from openai import OpenAI

client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

# Set OpenAI API key from environment variable

# Sample request to OpenAI using the new API method
response = client.chat.completions.create(model="gpt-4o-mini",
messages=[
    {"role": "user", "content": "Hello, OpenAI!"}
])

# Print the response
print(response.choices[0].message.content)
