import os
from dotenv import load_dotenv
load_dotenv()

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
OPENAI_MODEL = os.getenv("OPENAI_MODEL")

llm_config = {
    "model": OPENAI_MODEL,
    "api_key": OPENAI_API_KEY,
    "temperature": 0,
    "seed": 42,
}
