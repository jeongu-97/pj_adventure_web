from pydantic import BaseModel

class User(BaseModel):
    id: int
    username: str
    # Add other user fields
