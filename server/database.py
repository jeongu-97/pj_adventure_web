from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Database connection setup
DATABASE_URL = "sqlite:///pj_adventure.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)
