import os
import subprocess
from typing import Iterable
from openai import OpenAI
from openai.types.chat import ChatCompletionToolParam

client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

# Function to execute a bash command
def command(bash_command):
    try:
        # Run the command and capture the output
        result = subprocess.run(bash_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return result.stdout.decode('utf-8')
    except subprocess.CalledProcessError as e:
        return f"Error executing command: {e.stderr.decode('utf-8')}"

# Define tools available to the AI
tools: Iterable[ChatCompletionToolParam] = [
    {
        "function": {
            "parameters": {
            "type": "object",
            "properties": {
                "bash_command": {
                    "type": "string",
                    "description": "The bash command to execute."
                }
            },
            "required": ["bash_command"]
        },
        "name": "command",
        "description": "Execute a bash command and get its output.",
        },
        "type": "function",

    }
]

# Sample OpenAI request including tool call
response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {
            "role": "user",
            "content": "Hello, OpenAI! Please run a sample commnad, say, ls -al",
        }
    ],
    tools=tools,
)

# Print the response
print(response)
