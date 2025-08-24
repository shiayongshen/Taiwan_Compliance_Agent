import os
from dotenv import load_dotenv
load_dotenv()

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
OPENAI_BASE_URL = os.getenv("OPENAI_BASE_URL", "https://api.openai.com/v1")
OPENAI_MODEL = os.getenv("OPENAI_MODEL", "gpt-4o-mini")

llm_config = {
    "model": OPENAI_MODEL,
    "api_key": OPENAI_API_KEY,
    "base_url": OPENAI_BASE_URL,
    "temperature": 0.2,
}
