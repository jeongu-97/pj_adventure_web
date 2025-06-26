# PJ_adventure

A multiplayer game built with Godot (client) and FastAPI (server).

## Setup
1. Install Godot Engine for client development.
2. Install Python dependencies: `pip install -r server/requirements.txt`
3. Configure environment variables in `.env.client` and `.env.server`.
4. Run the server: `uvicorn server.main:app --reload`
5. Open Godot project in `client/` and run.

## Directory Structure
- `client/`: Godot client files
- `server/`: FastAPI backend
- `db/`: Database initialization scripts
- `tests/`: Test suites for client and server
