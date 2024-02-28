from openai import OpenAI

# client = OpenAI(api_key="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")

# completion = client.chat.completions.create(
#     model="gpt-3.5-turbo",
#     messages=[
#         {"role": "system", "content": "You are a helpful assistant."},
#         {"role": "user", "content": "Hello!"},
#     ],
# )

# print(completion.choices[0].message)

# import openai


client = OpenAI(api_key="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")

completion = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Hello!"},
    ],
)

output_text = completion.choices[0].message
print(output_text)
