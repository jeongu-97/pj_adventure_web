#!/bin/bash

# PJ_adventure/ 디렉토리에서 실행
# 디렉토리 생성
mkdir -p client/scenes/maps client/scenes/characters client/scenes/ui client/scripts client/tilesets client/assets/sprites client/assets/audio client/assets/animations client/html5_export server/routers db tests/client tests/server

# Godot 관련 파일 생성 (빈 tscn, gd 파일)
touch client/main.tscn
touch client/scenes/maps/town_map.tscn
touch client/scenes/characters/player.tscn
touch client/scenes/characters/npc.tscn
touch client/scenes/ui/hud.tscn
touch client/scripts/player.gd
touch client/scripts/npc.gd
touch client/scripts/websocket.gd
touch client/scripts/api.gd

# Python 파일 생성 (기본 템플릿 포함)
cat << EOF > server/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Welcome to PJ_adventure API"}
EOF

cat << EOF > server/routers/auth.py
from fastapi import APIRouter

router = APIRouter()

@router.post("/login")
async def login():
    # Implement login logic with JWT
    pass
EOF

cat << EOF > server/routers/users.py
from fastapi import APIRouter

router = APIRouter()

@router.get("/users/{user_id}")
async def get_user(user_id: int):
    # Implement user profile retrieval
    pass
EOF

cat << EOF > server/routers/game.py
from fastapi import APIRouter

router = APIRouter()

@router.get("/game/state")
async def get_game_state():
    # Implement game state retrieval
    pass
EOF

cat << EOF > server/websocket_handlers.py
from fastapi import WebSocket

async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    # Implement WebSocket logic
    pass
EOF

cat << EOF > server/models.py
from pydantic import BaseModel

class User(BaseModel):
    id: int
    username: str
    # Add other user fields
EOF

cat << EOF > server/crud.py
# Database CRUD operations
def create_user():
    # Implement user creation logic
    pass
EOF

cat << EOF > server/database.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Database connection setup
DATABASE_URL = "sqlite:///pj_adventure.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)
EOF

cat << EOF > server/requirements.txt
fastapi
uvicorn
pydantic
sqlalchemy
EOF

# 기타 파일 생성
touch db/init.sql
touch README.md
touch .env.client
touch .env.server

# README.md 기본 내용 추가
cat << EOF > README.md
# PJ_adventure

A multiplayer game built with Godot (client) and FastAPI (server).

## Setup
1. Install Godot Engine for client development.
2. Install Python dependencies: \`pip install -r server/requirements.txt\`
3. Configure environment variables in \`.env.client\` and \`.env.server\`.
4. Run the server: \`uvicorn server.main:app --reload\`
5. Open Godot project in \`client/\` and run.

## Directory Structure
- \`client/\`: Godot client files
- \`server/\`: FastAPI backend
- \`db/\`: Database initialization scripts
- \`tests/\`: Test suites for client and server
EOF

# .env 파일 기본 내용 추가
cat << EOF > .env.client
# Client environment variables
API_URL=http://localhost:8000
EOF

cat << EOF > .env.server
# Server environment variables
DATABASE_URL=sqlite:///pj_adventure.db
SECRET_KEY=your-secret-key-here
EOF

# 실행 권한 부여
chmod +x create_project_structure.sh

echo "Project structure and files created successfully!"